Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E95C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 10:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 674CF81919;
	Sun, 14 Aug 2022 10:37:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 674CF81919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtG_s0YvULn3; Sun, 14 Aug 2022 10:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C84982813;
	Sun, 14 Aug 2022 10:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C84982813
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC2891BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8254E4024B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 10:37:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8254E4024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcsBaCe_inkE for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 10:37:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3630C400D8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3630C400D8
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 10:37:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C4EEF1C0004;
 Sun, 14 Aug 2022 10:37:49 +0000 (UTC)
Date: Sun, 14 Aug 2022 12:37:48 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814123748.167ebb02@windsurf>
In-Reply-To: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660473470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aMMLg4Stn0QzQJ8EOqBjVNyikahb4eJaC5M6rtUuQ4=;
 b=TGawdyCB9IXXQ4LEsAegPb0F51/KbTsrFwKoXoZBXCZFFx18YDOMN6VUidkA0j/QhYlAju
 /L1AqjiZkqDm2QRsOJWRCx4voM7V9uT5ypeHNYMxSIumM9sSMzsvfoP5fwxAKAkABWvXEr
 TLyS6B/6//5dQ02ViV76l7SWIMKcRVE1Wozslth1A+bb6sm1Imjze8NAEX8Nj7uAGBmuih
 2v/Jj+0+oTlAb8ihP2z61MPc3DYTvJvLTqJHW7KnhvokuZlqFgQAhAG3hMdXdjS1QaDtzR
 Z+MlBgoYDh5+FVdKlcEWMGFhbry+sLYPYXf+nn28d2Hh/sWPeuhTzUdYKjDk1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TGawdyCB
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

+Adam Duskett for GOI expertise.

On Fri, 12 Aug 2022 12:17:18 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
> index b54262e7c4..db6da25d39 100644
> --- a/package/poppler/poppler.mk
> +++ b/package/poppler/poppler.mk
> @@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES += gobject-introspection
>  POPPLER_CONF_OPTS += \
>  	-DENABLE_GOBJECT_INTROSPECTION=ON \
>  	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
> -	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
> +	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler \
> +	-DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
>  else
>  POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
>  endif

I am really not familiar with all the gobject-introspection stuff, but
I'm wondering if this is the right solution for this problem.

In package/gobject-introspection/, I can see that we create and install
a g-ir-scanner wrapper that passes --add-include-path="$(dirname
"$0")"/../share/gir-1.0.

In this same directory, we also have a g-ir-compiler wrapper, which is
used to execute things in Qemu. If a special path is needed, why don't
we pass it within this wrapper, so that the solution works for all
packages?

Apparently, according to
package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
there are some packages that set girdir in their .pc file so that other
packages now where to find the GIR files.

Really not clear in my mind how all of this should work. My only
concern is that I would like us to find and use the same solution
everywhere to solve the same problem, rather than having 10 different
solutions for each package encountering the same issue.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
