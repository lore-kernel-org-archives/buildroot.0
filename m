Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2014B606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CBsa7+ge
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3524810DD;
	Tue, 20 Oct 2026 10:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPGKheRowvKk; Tue, 20 Oct 2026 10:21:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F745810C1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792491689;
	b=dPTSyPHvpWKaM9V1l/SXEAXu4KY9hlCy9KgB6R6D8PWDgyofwUgUAnllUZ/vzaAuPySm
	 Yz/IAYrgaKdv8KUSA0alQQb0Kx7X4gtjG/yE/3KjYPrJG/BMgGdgAOdHc3WVMert/2NY6
	 YHRts7wzYxnyjH+LVWpLxnKk0MOlM/1qxwxG8P5K7MOUJDKbkIbK9HBT6ncV3ciZSjlmj
	 H2uBZqVUTSqV/Cqp1MNR19M0OzX5LnhyxLJpb5d+MK1LU8tNcliJqamgbywJNRJ0ngHt0
	 wb1sXJJK3dhep6FlOK2uDHLhxA5GWbGzFE4Rh8Kim3MgyJ8sCJKcTS6l60AxAF9+9xA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792491689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=1tucOV6TJks31C2LSWUlWxokkHJptghyeCIrK/H6fTk=;
	b=G0MdCf1Kudjr3+I2xR3e32YVMKaMeW/vE6al0vq1Ce9FI7t1qme/Bz7hrqiavrud1P+N
	 lVMY9RHhB6pBiuf8UlcrIIdfA8NuDqIPPotOesit9oK2oA1ETnxILuASwVUKyMcVIzxsI
	 BV+GwtOU++upihha1QqdmN0EYONtSpKo+MamhfvG8nqJCL9+59d9pLHjjsBCuUgIMg76N
	 aFoqj8UyWsQWiFtErT8dRmWt75Ie3gp5LvgIDCF7dP6zOmyDcXNz25ctNhr0MbcZf0CFt
	 fZnOQiuvNAaS+X7hBwV710k0pbhm6cXd3jxxZs7Uf9TccxDBYwM5vTeLWwRbhITh06w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792491689;
	bh=1tucOV6TJks31C2LSWUlWxokkHJptghyeCIrK/H6fTk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CBsa7+ge9PhPYUJZtlDgbVa/tS256ytONZV3PBRICRN7tr6KpItxHTyRrBwuzF/wB
	 B66iO+Tq2IzqVpvaldxeepIc/kCQPyMNoSS26Qk0rg4G/vycqa9xUew+KxuydF6tXf
	 JGdkw7fEz+2hnCJOzu20emZmZ1qnoARd0UcxSQYalsqxKVWnQTvIYkOw2axosroDRL
	 7+NsvvvEp3EvolKkV0wtfXcoZZx+Zz+o4R3XFLjM78PEGcXHoyDdnwdFLpE9q1e8N2
	 E/bgXwUQD4j9uOoAxEsmRKLcPP7X/ZFabVJ8r8c+dafuOkETlk+eHRZgS6rKE7qJ4t
	 bqUTCnCRA0jXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F745810C1;
	Tue, 20 Oct 2026 10:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 86C733A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7897C40783
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afxy7JjfrLDf for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 10:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D5DA940741
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792491686;
 b=WNC4h2628HghrkO83YznL8aZmAm/Xc8Xx+Konipe2sy7GWeiZCJC69h2D3s5bqITcopK
 GsYwVnh/vd5kq3R/4USqwTCGjewfpoy2AHxJfHYJdXBSGRjK0xRjjOLs138eZ5PfajtAO
 TVi2XLdtFOIAk+UpV83jnSDhnJ2ZEscD7eA/KHUcFOENBhhK83EaV1vfq5R8eYDwiDN0N
 cp8y/ifZc/vnB1PTS0j5J0K2sRVH1OkP8YZH/BJCWcGj84A+MkAVsuBiSKEdx0aSqQI+B
 JcvsCd9xupbUKKWlpuSxSJJ639/CQSRiONzO7SfUn08xtyujYgHUNG5RdW8hHBMVkzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792491686;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=JECyMBvWS6y/7ZUxq0lXmHDkx+PJTuFboFrV9nJM9EQ=;
 b=LJ0SGHo4UcdXMiKqUYoxiAq5j34VqDY1O2KDp8lt+VZcunG3w/34WmWd/nEMKdY5lCIy
 6XcaE+8BQX4ZDWJDHtiKC3GclwD9GdtOJJd1uUYPsdgqwMw8uzVqTqJRgn9CcT1Qi3htQ
 DPJScP3XnxH/mBkntjy8a3nF5wd8uNIODgLEnDrq/ZBuam2SY6PhsAELoJIvmmDbG38mE
 yD9MaiMIqEGyxXS00xnRhJXVhgx6r7ZBobFsxiiR4VfSt7Xh3tf+JWakqwL3rsv5ib+aE
 Cj4R7WlExgBimczO6ixZyGGrCzNSUSXJdzSeNhTP0mQnnsId86ZCP6n257VzkSzqEMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5DA940741
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 10:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD2D599716; Tue, 20 Oct 2026 10:20:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 12:17:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 874aba9eba6799b6bd033bac73e35af8970fde3a
X-Git-Newrev: 3e2e370316f3b3e5cf8714dfc230a57ef3f7802a
X-Patchwork-Hint: ignore
Message-Id: <20261020102003.DD2D599716@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beaglebone: bump Linux to 6.18.56
 and U-Boot to 2026.10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3e2e370316f3b3e5cf8714dfc230a57ef3f7802a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The patch bumps the Linux kernel to version 6.18.56 and U-Boot to
version 2026.10.

Tested on beaglebone black.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 00eecaae3b..248ebc09ad 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://cdn.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
+sha256  4633bbda2ab95eaf2a7af4041236451d6759c72e6946265531af4b3aacefbf89  linux-6.18.56.tar.xz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index ff6e4ed2e2..66c72d3afd 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 1bae3e3bf8..134ec3fe0c 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.56"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless ti/omap/am335x-bonegreen-eco"
@@ -27,7 +27,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
