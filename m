Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AF0C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BABA4185A;
	Mon, 25 Jul 2022 08:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BABA4185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aYhO1t2Wa-XB; Mon, 25 Jul 2022 08:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B9A416E4;
	Mon, 25 Jul 2022 08:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B9A416E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A577F1BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F9A831D6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75F9A831D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clUGqp8sxl0E for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:44:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E129A830C2
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E129A830C2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:44:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 68FD2200006;
 Mon, 25 Jul 2022 08:44:19 +0000 (UTC)
Date: Mon, 25 Jul 2022 10:44:18 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220725104418.11977661@windsurf>
In-Reply-To: <20210912084540.1047574-1-fontaine.fabrice@gmail.com>
References: <20210912084540.1047574-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658738659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zztJ80I+QC+OCjuhqkT06t1TavxxQnq11XJU9fKEDPE=;
 b=VFOsuCAbaHfWJ31bm0LKwtC1EKrddxj0UKboE0YF0jkAvUfL6xA6hZLvDwWU3m7d1h0FSz
 iMva5GoUsDxrs46I7sKURXEXkWVXs8m84rRK9RcueHxMnytgJ1dgItUtALtNHsTUfdXfcX
 FxljINVZYTjMFdq6OFctqTfJiX06Vxv6/Wks7NlqlxcMbSIhoWzHHqnuv9lS1341Si3y+L
 /RhLeMr/A+0UTgIeg9DwpAGH3JbO4940CQHq3k6y9P0N3BMWZZJz75D9QZYq1kdj/f9b3B
 Xf736evTZkgCsLx76l3/d/0fewnmqCUvpWKQ/t3aJVxEXZVe6mczLsq+oiw14g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VFOsuCAb
Subject: Re: [Buildroot] [PATCH 1/1] package/patchelf: bump to version 0.13
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 12 Sep 2021 10:45:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update third patch and drop other ones (already in version)
> - Update indentation in hash file (two spaces)
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=14191
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-the-rpath-relative-under-a-specif.patch} | 122 ++++++------
>  ...apparently-incorrect-usage-of-static.patch |  56 ------
>  ...on-for-splitting-a-colon-separated-s.patch |  63 -------
>  ...LF-endianness-before-writing-new-run.patch |  40 ----
>  ...file-sizes-needlessly-and-allow-bina.patch | 176 ------------------
>  ...ry-corruption-when-rerunning-patchel.patch |  55 ------
>  .../0007-fix-adjusting-startPage.patch        |  45 -----
>  ...stead-of-sh_addr-when-checking-alrea.patch |  38 ----
>  ...ignoring-the-first-section-header-wh.patch |  41 ----
>  ...ix-endianness-issues-for-powerpc-PIE.patch |  80 --------
>  package/patchelf/patchelf.hash                |   4 +-
>  package/patchelf/patchelf.mk                  |   5 +-
>  12 files changed, 72 insertions(+), 653 deletions(-)
>  rename package/patchelf/{0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch => 0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch} (68%)
>  delete mode 100644 package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
>  delete mode 100644 package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
>  delete mode 100644 package/patchelf/0004-patchelf-Check-ELF-endianness-before-writing-new-run.patch
>  delete mode 100644 package/patchelf/0005-Avoid-inflating-file-sizes-needlessly-and-allow-bina.patch
>  delete mode 100644 package/patchelf/0006-Fix-shared-library-corruption-when-rerunning-patchel.patch
>  delete mode 100644 package/patchelf/0007-fix-adjusting-startPage.patch
>  delete mode 100644 package/patchelf/0008-Use-sh_offset-instead-of-sh_addr-when-checking-alrea.patch
>  delete mode 100644 package/patchelf/0009-Fix-issue-66-by-ignoring-the-first-section-header-wh.patch
>  delete mode 100644 package/patchelf/0010-Fix-endianness-issues-for-powerpc-PIE.patch

Now that we have bumped the minimum required host gcc version to 4.8 in
Buildroot, I finally applied this patch (after checking that the C++11
features patchelf is using are indeed available in gcc 4.8).

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
