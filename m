Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E4AC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 21:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD2281B71;
	Wed,  3 Aug 2022 21:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AD2281B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NvzF9qqZ6IcZ; Wed,  3 Aug 2022 21:57:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59D5813F6;
	Wed,  3 Aug 2022 21:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A59D5813F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82BD61BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5062C40477
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 21:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5062C40477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v9HXv326zT3w for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 21:57:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCDE4021C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECCDE4021C
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 21:57:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A9F961C0003;
 Wed,  3 Aug 2022 21:57:23 +0000 (UTC)
Date: Wed, 3 Aug 2022 23:57:22 +0200
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20220803235722.63985959@windsurf>
In-Reply-To: <CAB1t1Cxs_U0rtKxoaWByef71KOrOeuL9_MpYM--TQCwS8eA0wA@mail.gmail.com>
References: <20220726193810.43817-1-pevik@seznam.cz>
 <20220726220405.4fbd3e0c@windsurf>
 <CAB1t1Cxs_U0rtKxoaWByef71KOrOeuL9_MpYM--TQCwS8eA0wA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659563844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0+57ejMY+9q8PlIMsnykCZrdbs8K3cB5ASwZv+E+/M=;
 b=N/SzEXHprUAdkY/X161wiFMzielDd0XGo7fvMmZMwP/1sNGVrpnJhMcZz60idYXd2Ntj7W
 Fk+9BPqhJRdGTDu80kqQOm8rw+9l02aZNiRbHPr1coqyQJBmGLH/90dmQHwF6G/Er+OvlK
 Uv2NNykkmDcTANibtxQrVj3I9tfNVcPk0JPEc5gkjhzq+4fxlunOjukJ+zB4D5bCsAt7r1
 Oho2Dpz+9nXbpOG7KvcS+cqv83G7gz5CYzcFcoc7BS7JfH+8h/XUDEh2aC9/+GBbMOuxr0
 l3QI52GnmMGYB5MzBKjYbcp/+YCDK3VoiOhmPxSr9lEpXvidhatBkEUlWTvOWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N/SzEXHp
Subject: Re: [Buildroot] [PATCH 1/1] package/debianutils: bump version to
 5.7-0.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Petr,

On Fri, 29 Jul 2022 20:36:09 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> I'm also a bit annoyed by patches like this that we cannot upstream
> > (and therefore have to keep forever), and that require AUTORECONF :-/
> >  
> Understand, I'm sorry. I can either add  po4a as host package to have it in
> build or discuss with Debian maintainer how to make translations (po4a
> non-mandatory).
> What do you prefer? Hope I'm now clear about the goal.

I would prefer to make translations not mandatory. Actually, there is
already some partial logic for it, but not used properly. The following
patch is probably a useful start:

diff --git a/Makefile.am b/Makefile.am
index 86ac499..d433444 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,6 +1,8 @@
 AUTOMAKE_OPTIONS = foreign
 
+if TRANSLATE_DOCS
 SUBDIRS = po4a
+endif
 
 EXTRA_DIST = CHANGELOG CONTRIBUTING .gitlab-ci.yml
 
diff --git a/po4a/de/Makefile.am b/po4a/de/Makefile.am
index 11f0094..d14e297 100644
--- a/po4a/de/Makefile.am
+++ b/po4a/de/Makefile.am
@@ -3,11 +3,7 @@ AUTOMAKE_OPTIONS=foreign
 l = de
 addendum = -a $(top_srcdir)/po4a/$(l)/translator_german.add
 
-if TRANSLATE_DOCS
-  TRANSLATE = po4a-translate -k 0 -f man $(addendum) -p $(top_srcdir)/po4a/po/$(l).po
-else
-  TRANSLATE = @echo po4a-translate not installed, failing to rebuild changed man page translation; exit 1;
-endif
+TRANSLATE = po4a-translate -k 0 -f man $(addendum) -p $(top_srcdir)/po4a/po/$(l).po
 
 EXTRA_DIST = translator_german.add

TRANSLATE_DOCS is already provided by configure.ac, depending on
whether po4a is available or not.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
