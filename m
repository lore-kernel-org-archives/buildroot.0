Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6F9CC6B27
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 07:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8B380AC4;
	Wed, 14 Oct 2026 07:41:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmS5_DgDwRXD; Wed, 14 Oct 2026 07:41:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 57A5680A66
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791963670;
	b=k8IZNepQvs7zPsg1UFtB5fX4VvMN4tRoaulQ9EZ3BmONDqT227XKMPo29eXNuBxyAjG7
	 HDWOLKqlcBXlLB0JSagatxFyIZN5q8VxOLHq1i1N3g1cAdu0IWKPaW4o6+RUk+jPASZt8
	 w96yrDDKXMO+ldLDXXdMONDQO0V9w1G4ycULZ60617AP4PVmE0Rzf/loz5jtt1pFiUvsZ
	 b+aubaJ0IUnVtL6I/WI0SMvRJ33DlPosJKkMrvUyiMrOsBCOMBjS0DALoWZb/seqwAoJa
	 r9JLAwLa8KG/ZSx1zTjPGR4Q22esFJ4ntcQCH/cJg9q7s48iDRHugysTJJH2iY3bK5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791963670;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fKk5R3UFRerdxoBAGC9U1TyPV/0QPVq7dmpDx1MXBag=;
	b=YV4vlaHlOTMvSQuyah8FYWjThf4/Kn4/KLde2H6oQDVoQx0EEAabyF0i+myIbo8ZVC0a
	 pAjoXu5MAk1Vqxgee2vmFj922ciCHKz0YTSFfrTzRJHl/xjCGnHxTOiJeY+AUIW8NBQ9q
	 KsMDjOAMwaaiwMBxgDBhO+bBS2QHF2hwUlSncLO5VM+EzH68TgBXe9svzYbE7bZAgnBe6
	 LJJKAnitXAln84sedsOeMK5XyzYvcZRp3xDgMkseTxq0k2EEB2J2vZZK9o9Xkj4Zzr6H1
	 tTuXKu0YPpxEQplqRk/1pI+p3rb/e9OUTPsV1QJkVy+XHZVdQq3tuCOzlfVFJezMQOg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791963670;
	bh=fKk5R3UFRerdxoBAGC9U1TyPV/0QPVq7dmpDx1MXBag=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OOCJ3f9pFxTfe8/9jiHNQ17esfqe/BTwklJd96YGN/AUdOD3I5OT0+tXr6rWwNUqR
	 B1Bs8QIs96ui9KfiFk0/cjxHe/lF6hZQiVoDIZOsFw9Zq1gA+2mmSFOYDJTcoJwixi
	 TZugZrXWh6djvBxXpyTa4VMpHCxiBXbCjIQ79dfaRKccfuhmTJlszOAjhpfEhun+jZ
	 d5Nkxz8vL8hqLBBE2+xuIOg0SEMHk8m/ZKNIE11wGTo3gmNK7H5S2lEbMbudeyEome
	 Z4qscocC0GD/Ou08gqMnPyTPy2XmQsNkCldSaTcuOZhgbMKqOEF/tGbXL7vHm6tpVw
	 3v+ovKY1i1D3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A5680A66;
	Wed, 14 Oct 2026 07:41:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9AD272E0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 80D2D607CB
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YSXYUaSEXlCB for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 07:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5FFAB605CA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791963667;
 b=SJiAv0wvzBeteySqiKBRrpXSMntz3fklLxRNa8q/riVYrFh5FmMvWxgbGj/2ZTdDkWDl
 broViBYIgsOJ1H7A1Tm4a442dNMH1xobtGyEbFTM0PmfLOAEL06j0HiSGr9ofoip8/bI5
 xdj9YCbkR/CLSg/jFYFYv5+9WP05HYVGhn93Hbo4J+9DZkX11qhg1FDEWSFvA9R0BVoEy
 dBc+mT0m4bYCgS6tpXW8LhuACNI3rKqxJHr6l4JKJwb53xHB7YNRIw1sHElCL4kAOkP/3
 t39O3XhTF3uP3RbJBqTeey5abfzGRmU4zomibszhWb+4juxu1uPNe2QgIEb4wfdcthg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791963667;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=LlAjiHKmgzjJLu/hwqjJUrICGRM28WD24/gww8jyuE4=;
 b=L1DijE+qQQ9XgCHiEQeGleUuSWbfkFvTbALg5MGU9ShyZ3HWQ3gIjwYElST/nP8NI3jx
 V5WI+OkZGXu1VEB9zXC0AJrI5StTYTdPt2iKpG9vAWRWM8nBxDs3HGm62XmNymAaLV89k
 QOz8gCKSNdl4F1lgEK8Z3rCYKQRbmz6XLlGuezmmvYG6IRTHzsOQty8AMpJFjS8+/yO/7
 o4u+Dvqf6Sf5LLbhajahIK0nNb77ZQGIGNf0N6oaVquHN+GTjnEF9nY7NHT/s9WK1r+ft
 x1gjJpfOARmBZlSCm6e2lIpgbD6n54fMifakXj12ZPyVZDTyXYfR8Sb2di/+Nejg5AQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ctOkjKQL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ctOkjKQL
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FFAB605CA
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 07:41:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49ff680331aso6611475e9.3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1791963665; x=1792568465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=LlAjiHKmgzjJLu/hwqjJUrICGRM28WD24/gww8jyuE4=;
 b=ctOkjKQL0ga+i6vo/XiiPrwK8zE8Z22JYB22wcfzAV6kwJz0WE2d1eTts084BO0yxL
 XQIiApoUQx4LGOOQ3vS6Xxe1ts4YYpAn0eXGuZSGR96Dn0l+HsOwrfoWGVhS3MzTv8w+
 9O8AKKblCAnfQuY3+PSlYGwj8uxXowVl4jN2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791963665; x=1792568465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LlAjiHKmgzjJLu/hwqjJUrICGRM28WD24/gww8jyuE4=;
 b=AAuVPsYhovlxAXyAfm8e0CKbTJiLkxP2gRbb8lIYhZ52YL7a1/cNtQdyn4GzPntOSr
 QIAKeGzYTCH2XlTijad8tV8/WoC8oypNDTTaJeea5Vy2eBdxGyMFv5cgvBgWWnH2S3j6
 3xR/gIboGLkLmcV5q/CkMAZo8u4gPXYLVmCEIxjyFf+fmSrnCsMjX0VJMF5idexySdi/
 WW3shpz0gC7v7oNYazG+qhM63hlHTQnVr0T5pYHc7XR1TgVVkNf7l1oEsDwEmsIKk7G3
 e9yptXwbUMdi4PB/fuUoC+tKkFBZ7X2PyDwWl0Hr3RhmjV9bF3+WkQOXVPccPjh3JxGn
 pVfg==
X-Gm-Message-State: AFq9FYKZotFRYbqYZJZxDuFLOL5u/OTVZ2P0JOKXiadWnlUFOATfpWIz
 fnJuPZ6jU66nAjIofv6L4Tc0P14mBVUAjVh4bQClYj8sVxDGy4fIZIS4EJgns//StSbp2oNMkGa
 ijwDo
X-Gm-Gg: AYBFou3q6TkIv5Er05FmcdBvBEx3cFFK7ZuXI+AVqEUNK8WzTCUxpkSuP5aPpNeM++A
 op4qi9heVxRxdBuzpTPQJFTyWJE/5ijGwYhSVuXlsU8QC7cggAkZ95Lbl51mDJK1RXUXu0wYWyu
 3G6Dr59v3sC9UOAf64pakdd9Z4uiBxBJH17N6YQTd355ccwU6/kBD5zozD/qKAFe6Duzdq77DFj
 XR9eXBf/wmR6ze/fRbZfAsAW03wu2R127yzUTRvbfBQWmN5bvTozYz4U1n7ppd98CbqGhkNWGlS
 +adY2jN8ISLgvWzSok6VQE+nflHZvVHd5VfSDdx75Grlx2VAluu++/bkrLFKPensqIDP4gZoAv3
 HoLhBcI0r81nntIdJ5sFDWyPf24Mx3U39y90PfGaI0/MLYGY79rMpHcpenPvcPXkB3nmgiqMME4
 dv37HyJAmpyP6PosoM9JRNne0TpxWpzUbwcfSPwV50lgPHGeoetDZfuZGznvj0eYmgmmVsSBvPd
 WqdFnHUzfXNMxWkWFFO+S+bWTkoStmKIr4ehSoRflspnGV+r2a0yHVh4n8sr0DQEvg=
X-Received: by 2002:a05:600c:4504:b0:49c:fc6e:a3da with SMTP id
 5b1f17b1804b1-4a18e4a7839mr320687335e9.25.1791963664838; 
 Wed, 14 Oct 2026 00:41:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:ad64:a410:4d28:fa10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm375435815e9.5.2026.10.14.00.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 00:41:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof <bb@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 14 Oct 2026 09:41:01 +0200
Message-ID: <20261014074101.3674446-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] configs/ti_am62x_sk: bump U-Boot and Linux
 versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch bumps:

- U-Boot to version v2026.10
- Linux kernel to version 6.12.112 (LTS)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/ti/am62x-sk/patches/linux/linux.hash | 2 +-
 board/ti/am62x-sk/patches/uboot/uboot.hash | 2 +-
 configs/ti_am62x_sk_defconfig              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/ti/am62x-sk/patches/linux/linux.hash b/board/ti/am62x-sk/patches/linux/linux.hash
index 08483293cf69..e3e6d3913390 100644
--- a/board/ti/am62x-sk/patches/linux/linux.hash
+++ b/board/ti/am62x-sk/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  164dc9d1f6c93c61a15e1f071c48379b467f2b17c469cce7223471968208ed03  linux-6.12.112.tar.xz
diff --git a/board/ti/am62x-sk/patches/uboot/uboot.hash b/board/ti/am62x-sk/patches/uboot/uboot.hash
index ff6e4ed2e2f6..66c72d3afd51 100644
--- a/board/ti/am62x-sk/patches/uboot/uboot.hash
+++ b/board/ti/am62x-sk/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78e8bfc382fe388f9b55aa1daf8c563522a037779b5d4c349d1415e381f1243e  u-boot-2026.07.tar.bz2
+sha256  3f856da3cbbc93af51ff95fde18588a348b4a26723b01d9841e999d988481015  u-boot-2026.10.tar.bz2
diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
index ddabba238ff6..72df75511747 100644
--- a/configs/ti_am62x_sk_defconfig
+++ b/configs/ti_am62x_sk_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am625-sk.dtb -l am62x
 BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS="-c board/ti/am62x-sk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.95"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.112"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am625-sk"
@@ -28,12 +28,12 @@ BR2_TARGET_OPTEE_OS=y
 BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
 BR2_TARGET_TI_K3_R5_LOADER=y
 BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
-BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am62x_evm_a53"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
