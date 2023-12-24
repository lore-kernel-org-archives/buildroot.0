Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF051C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 10:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4101F416D0;
	Sun, 24 Dec 2023 10:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4101F416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FnhV7Gff5cJw; Sun, 24 Dec 2023 10:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 604D2416D2;
	Sun, 24 Dec 2023 10:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 604D2416D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB8621BF2CA
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A97EF81ED0
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 10:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A97EF81ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Az_Jc01Aw3hv for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 10:57:00 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D1DE81EC9
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 10:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D1DE81EC9
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4E0B60003;
 Sun, 24 Dec 2023 10:56:56 +0000 (UTC)
Date: Sun, 24 Dec 2023 11:56:55 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231224115655.6b9bb131@windsurf>
In-Reply-To: <20231203041841.492885-6-adam.duskett@amarulasolutions.com>
References: <20231203041841.492885-1-adam.duskett@amarulasolutions.com>
 <20231203041841.492885-6-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703415416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zizf1T/X221s/z39J0JKuvVhJIETPCKThv0y592xrwQ=;
 b=AVMT2d0z+Cqh18Hnyb7OByCXTV9WbCahZfsMYPli8AWIdMtbr0ZbGAk0sgK8Ok8PdmcLp3
 4kqP9SknCDQpIHm0qFHnK/B5IZCCNUz00KOiYy+7jbTMr76HpqFv/Z2g0lRgzL+gwqTmeZ
 nPZBlJgfUWMcENpIcOUgrgi1au8FKz0QhjB7m/It4ttWuq/jQh+OajSZBLFcm5dhkHmNml
 cvd7ePcpCxDE8vUix91OGyKWkaueFJU3KguqXpJxQfHfXQkN1SiHrXthd1H2GylHtBtRAg
 UcCXJzrHmXDBrKUEUfX4FG0Ki4Q7L2HVoup2mGk6NKPACowZDF46YPjG22WCbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AVMT2d0z
Subject: Re: [Buildroot] [PATCH 6/6] package/google-breakpad: bump version
 to f49c2f1a2023da0cb055874fba050563dfea57db
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
Cc: Pascal Huerst <pascal.huerst@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

Thanks for this patch! I have applied, but after doing a number of
changes because as-is the change was not building correctly (I will
provide more details below on what the issues were).

On Sat,  2 Dec 2023 21:18:39 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

>   - Drop no longer needed 0001-add-cstdint-to-minidump_descriptor.h.patch
> 
>   - Rename 0002-dont-include-stab.h.patch to 0001-dont-include-stab.h.patch
>     and refactor so it applies cleanly.

I dropped this part, because I did not include the fix that allows
building with uClibc at this point (I will reply separately to PATCH
5/6 about this).

> -GOOGLE_BREAKPAD_VERSION = c85eb4a59b618f3beaad5445ceb1f865ffa8efdf
> +GOOGLE_BREAKPAD_VERSION = f49c2f1a2023da0cb055874fba050563dfea57db
>  GOOGLE_BREAKPAD_SITE = https://chromium.googlesource.com/breakpad/breakpad
>  GOOGLE_BREAKPAD_SITE_METHOD = git
>  GOOGLE_BREAKPAD_INSTALL_STAGING = YES
> -GOOGLE_BREAKPAD_LICENSE = BSD-3-Clause, MIT
> +GOOGLE_BREAKPAD_LICENSE = Apache-2.0, Clarified Artistic License, gedcurl, BSD-3-Clause, GPL-2.0, MIT

"gedcurl" wasn't a valid SPDX identifier, based on the LICENSE file, I
assumed it was for the curl license, which is known simply as "curl" in
the SPDX spec.

"Clarified Artistic License" is now as "ClArtistic" in the SPDX
specification.

However, some of those licenses are actually not relevant, because they
are used only for Mac code, or for the autotools machinery that doesn't
go into the target. So I looked at all the licenses of LICENSE one by
one, which gave this:

+# APSL-2.0, BSD-4-Clause, Apache-2.0, BSD-2-Clause not listed, only
+# used for Mac code, GPL-2.0 not listed, only used for autotools code
+GOOGLE_BREAKPAD_LICENSE = \
+       BSD-3-Clause, \
+       Unicode-DFS-2015 (UTF code), \
+       MIT (src/common/linux/breakpad_getcontext.S), \
+       curl (src/third_party/curl/), \
+       ClArtistic (src/third_party/libdisasm)

Hopefully I got it right, because it was a bit tricky. I'm definitely
open to review/suggestions on this as I might have gotten it wrong.

Now, to the things that were problematic:

- This new version has a mandatory dependency on zlib, without which
  the build simply fails.

- This new version has an optional dependency on zstd, which needs to
  be disabled explicitly to avoid build failures. And also AUTORECONF =
  YES is needed because the pre-generated configure/Makefile.in is out
  of date, and tries to link with -lzstd even if --disable-zstd is
  passed.

So I had to add the following changes:

-GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support
+# Needed because the configure/Makefile.in provided in the Git
+# repository is out of date, and links with -lzstd even if
+# --disable-zstd is passed
+GOOGLE_BREAKPAD_AUTORECONF = YES
+GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad linux-syscall-support zlib
+GOOGLE_BREAKPAD_CONF_OPTS = --disable-zstd
 
-HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support
+HOST_GOOGLE_BREAKPAD_DEPENDENCIES = host-linux-syscall-support host-zlib
+HOST_GOOGLE_BREAKPAD_CONF_OPTS = --disable-zstd

To get breakpad to build properly in this new version (as well as
"select BR2_PACKAGE_ZLIB" in the Config.in).

Applied with those fixes. Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
