Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B65EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 16:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C13840492;
	Sun, 16 Jul 2023 16:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C13840492
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AyPKt_sp_NjU; Sun, 16 Jul 2023 16:27:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9185940141;
	Sun, 16 Jul 2023 16:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9185940141
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2F5E1BF8B4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C9176068B
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 16:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9176068B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9f65lEq1Xm1 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 16:27:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50999605F6
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50999605F6
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 16:27:45 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4fbc0314a7bso5740999e87.2
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 09:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689524863; x=1692116863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55KT2oq7UOdMCBFbOeWk43vn18FQY7C6ZEr8e6x1yZo=;
 b=DxGN1vG6/vAHyMyQAETPiZM58CE537W2eEUYfOQ1EzvGpxMIePrsyEqm3KbUTBDseG
 2vl9jt9ZS5b191DgWR2X0Ba1u6NDoWRCTxYVDIZVRsIHJZ6By0n8CG/Bk+SH0K1W6E7i
 LxXZRhDVbqZqWoXwlm/sn4t+To0Xr5XrohrM+F1m03t3rkg+vU0PS/LtrBcLOgBWtM5b
 Xx62X/dQIwPy9oJFt1JA7vAw97EGvsY6KozyEH5LEPm37JNlzMKKhSXdXdorFevaNsjp
 1/D9TqigEhs+XiVHiYe/ZpZE3Fzv/jtu/uzJRDgLxWSG43jFNs/kZkwxhdJRuzKUcpRp
 /+nQ==
X-Gm-Message-State: ABy/qLZhwgoAFdjBbVFgBi/5FSe0K2XznCONqANPJeBi1M+LNseFAxlk
 b/kZP3DeLi4VkXCXCqtEyXDktBZt0cE=
X-Google-Smtp-Source: APBJJlHhohe3Sz/86uW/j/bAe1d8pNUq0Pd4qSS+AvOgWRhQ5ClMRLTQLf8JAKF6NCvb08psf34y5A==
X-Received: by 2002:a05:6512:340b:b0:4fb:9f24:bba9 with SMTP id
 i11-20020a056512340b00b004fb9f24bba9mr8272115lfr.5.1689524862766; 
 Sun, 16 Jul 2023 09:27:42 -0700 (PDT)
Received: from fedora (tmo-097-144.customers.d1-online.com. [80.187.97.144])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05640207c800b0051df67eaf62sm8657849edy.42.2023.07.16.09.27.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 09:27:42 -0700 (PDT)
Date: Sun, 16 Jul 2023 20:19:03 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230716201903.66dee413@fedora>
In-Reply-To: <20230710232709.5b8a3eca@windsurf>
References: <20221015060411.326933-1-huth@tuxfamily.org>
 <20230710232709.5b8a3eca@windsurf>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/frotz: Add a missing dependency to
 the Makefile to fix build problems
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Mon, 10 Jul 2023 23:27:09 +0200
schrieb Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello Thomas,
> 
> On Sat, 15 Oct 2022 08:04:11 +0200
> Thomas Huth <huth@tuxfamily.org> wrote:
> 
> > There are currently some build jobs failing where blorblib is built before
> > hash.h has been created. This patch should hopefully fix these issues.
> > 
> > Signed-off-by: Thomas Huth <huth@tuxfamily.org>
> > ---
> >  See e.g. here for a failed build:
> >  http://autobuild.buildroot.net/results/9cd213ce2d36f797041c7b21044c2b2c223dd546/build-end.log  
> 
> I believe this kind of issue dates back from when James was testing
> with --shuffle=random.

Yes, I think that's right. The problem went away automatically after a
while, I guess that happened when the shuffle had been disabled again.

> So I tried to reproduce locally by doing several
> builds of frotz with "make --shuffle=random", and I was not able to
> reproduce. I'm not really keen on adding a patch that "hopefully fix
> these issues", without being able to reproduce them and confidently say
> that the patch fixes the issue.
> 
> So for now, I've marked the patch as Rejected, but we can always
> revisit that if we get a way of reproducing the issue, and therefore
> confirming that the problem no longer occurs thanks to the patch.

That's fine, I was able to get the patch accepted upstream (with a
different commit message):

 https://gitlab.com/DavidGriffith/frotz/-/commit/cdf0ad4aff2d8937034e02e41a5aadcca320ea18

... so it will be included anyway when we update the package to the next
version.

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
