Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D7DFA373E
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED6CB60B6C;
	Tue, 25 Oct 2022 20:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED6CB60B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f-swxjO4E6KS; Tue, 25 Oct 2022 20:55:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A7C60ACD;
	Tue, 25 Oct 2022 20:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A7C60ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15B9E1BF33A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D034C400CE
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 20:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D034C400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-h_-DkBJpeS for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 20:55:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81EFD4000B
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81EFD4000B
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 20:55:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2506320005;
 Tue, 25 Oct 2022 20:55:35 +0000 (UTC)
Date: Tue, 25 Oct 2022 22:55:33 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221025225533.3aa6c869@windsurf>
In-Reply-To: <20221020185459.28407-1-bernd.kuhls@t-online.de>
References: <20221020185459.28407-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666731335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1JtLyMlKv86LQNnE3qiM9NvcfBbbU5yJpe1IcFGVlw=;
 b=kqrKSSgGLG0+e8faINEEu4qIxTmzhwjSCg47j1m2BXufrnoqcxRAovLvN6PWk/ie/OzZ9Y
 ecQFp+ZFA2FxeUp2LtBUrzlOZJUrYZpyW6nj9grjnPsop09b1sKtkIn/V77Q606e/x9HMr
 uD7Q6OHNcTFdObDHl6np+dDz99lS+wyUx3abG0e+fw3zJGrDsnRZLyRIZz6MJXjT6uZUVc
 BgEapV48d4RnKUoiYgZtJNapbh4lrjVvlmyE1ZYRtQ2GxpVFhAaF27aPEefvacwxArlSez
 fnuFbswMHazH0SicSo1C2Xr/RZo9tmdeXkrZhNZm5f8IigA7MwpO+GUUh1t5bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kqrKSSgG
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.2.2
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
Cc: Romain Naour <romain.naour@gmail.com>, "Yann E
 . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 20 Oct 2022 20:54:59 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-October/000689.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-October/000688.html
> https://lists.freedesktop.org/archives/mesa-announce/2022-September/000687.html
> https://www.phoronix.com/news/Mesa-22.2-Released
> 
> Removed patches included in upstream release, renumbered remaining
> patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |   2 +-
>  ...rt-isinf-for-uclibc-based-toolchains.patch |  30 -----
>  ...-proper-value-for-LIBCLC_INCLUDEDIR.patch} |   0
>  ...ion-to-disable-optional-neon-suppor.patch} |   0
>  ...-Include-stddef.h-to-fix-build-erro.patch} |   0
>  ...uild.patch => 0004-Fix-uClibc-build.patch} |   0
>  ...-fix-build-on-32-bit-architectures-u.patch |  43 ------
>  ...emove-needless-c99-compat-h-includes.patch | 126 ------------------
>  .../0007-include-drop-c11-compat-h.patch      | 100 --------------
>  package/mesa3d/mesa3d.hash                    |   8 +-
>  package/mesa3d/mesa3d.mk                      |   2 +-
>  11 files changed, 6 insertions(+), 305 deletions(-)
>  delete mode 100644 package/mesa3d/0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch
>  rename package/mesa3d/{0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch => 0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch} (100%)
>  rename package/mesa3d/{0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (100%)
>  rename package/mesa3d/{0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch => 0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch} (100%)
>  rename package/mesa3d/{0008-Fix-uClibc-build.patch => 0004-Fix-uClibc-build.patch} (100%)
>  delete mode 100644 package/mesa3d/0005-src-util-futex.h-fix-build-on-32-bit-architectures-u.patch
>  delete mode 100644 package/mesa3d/0006-util-remove-needless-c99-compat-h-includes.patch
>  delete mode 100644 package/mesa3d/0007-include-drop-c11-compat-h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
