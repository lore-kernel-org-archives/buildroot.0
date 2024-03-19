Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAF9C54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 12:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E35C4071D;
	Tue, 19 Mar 2024 12:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lufqE89wGFrI; Tue, 19 Mar 2024 12:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27FA34071E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27FA34071E;
	Tue, 19 Mar 2024 12:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8D61BF406
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA0FB40703
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 12:24:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49iLNPO8dE9P for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 12:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2897406D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2897406D3
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2897406D3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 12:24:00 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56ba0f45717so102896a12.3
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 05:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710851039; x=1711455839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dKvJNPrgVhBgWy32uKlhdiUC8m97CF6D4FM6CTOgyg=;
 b=WBM9trnXTmeo24RcBm1MhMbT4zWrg7L7lel/C9GxHi5NRAbwXIDBbjv4fJIJYwedZL
 IxYSSeNwPGf32iwKAXTQc4nnG5hiu6F3O1oPOg9ijv97h7dKsKql5MR+phIK+EeFqrs4
 6amx/cDs85Pablil/3yxRvnF9VaFLOV07BrbhhmbRp9h4s9C0SCVXfKYHGX57fu3jVDQ
 dY1Oa6/X2swVq96dMoCJp5L0rR+uFzPergZMyNBwFRk2qo+SYetb36sMUsf6EKo6z3UA
 N3RfxSrdUTygQ1lSDO7gY6Qh5qjmUOlelmnLlBiOUxcaq0x8XbIAHEFkdV2IRemg3Mss
 wQjg==
X-Gm-Message-State: AOJu0YwIEggHjYQli/20bDdYOnPgV8+vW4LAotDinyoEYATrAuEakEHb
 E68bCGwZvVH9amU9ULJ7xGhp6299Av1DlEvBnEDxhRbxIcGFX3+bbs0iXzMQfwI+G9Rpjw/g5vW
 iGf4=
X-Google-Smtp-Source: AGHT+IG1fF7/uCZWVtYP31iC2TM2oqFlawpvRsJxhSo66ZKi+w7EkHYd2KZ4HgkCFJnFqLBeyNUWDg==
X-Received: by 2002:a05:6402:3812:b0:56b:9925:378 with SMTP id
 es18-20020a056402381200b0056b99250378mr745905edb.42.1710851038742; 
 Tue, 19 Mar 2024 05:23:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:8b20:c100:2e31:96e9:7843:4bd2])
 by smtp.gmail.com with ESMTPSA id
 cs4-20020a0564020c4400b00568a1ce4562sm5551524edb.25.2024.03.19.05.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 05:23:58 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 13:23:43 +0100
Message-ID: <20240319122344.3107639-2-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
References: <20240319122344.3107639-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710851039; x=1711455839; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dKvJNPrgVhBgWy32uKlhdiUC8m97CF6D4FM6CTOgyg=;
 b=ElFxD0r0tMnn+1hMNBjrl0PDV9iAAcM0oQ8yIZsLSau04uyfvoyuIiMEQHp3jtdDDC
 JP47IjjA0BlB/Z9/4RjO2qGToHhP1Hcowc2tSzG0KbensbochnRPiaFItuO2pmNK83Y8
 UE5qW/LeEJcuhERDuJuOOiuu5juBldKDISL/NvViF6rSjVRiLFbA93mWyvyFENnRAm1x
 7xhjMPTM/gOOvzlAkS8x0r22eulyvxQRoeFbXnqY5yk5kYE7Vmo80jtXJCIsblCPR+1K
 pgvnyYmnEobGl6rwPqxWKFfgTX3Tw/ej90brIzE/FyVn5kkRCLe0YzmoLqwT8S7nskyw
 Up9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=ElFxD0r0
Subject: [Buildroot] [PATCH v4 2/3] configs/avenger96_defconfig: bump Linux
 version to 6.6.22 LTS
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades Kernel version to 6.6.22 LTS on avenger96 board.
Beside that, In accordance with the kernel 6.5rc1 commit
724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
the device tree path also has been modified to point the device tree in
the proper location.

As another change, due to commit 3108eb2e8aa7
("mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS"), the order of SD card and
eMMC probing has swapped. The SD card is now mmcblk0 instead of
mmcblk1. Thus, the default root append (mmcblk1p4) in 'extlinux.conf'
file in the overlay directory of the board is changed, otherwise the
rootfs was not possible to be detected.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
Changes v3 -> v4:
  - Upgrade Linux version (suggested by Arnout)
  - Modify commit message (suggested by Arnout)
  - Modift commit title
Changes v2 -> v3:
  - Update the commit to document the reason of changes (suggested by
    Peter)
Changes v1 -> v2:
  - Remove uboot changes from Linux patch to Uboot (suggested by Peter)
  - Fix the kernel header version for the toolchain.(suggested by Peter)

---
 board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/avenger96_defconfig                               | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
index 5d506b3dae..7d6d7f8a44 100644
--- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
+++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
-  append root=/dev/mmcblk1p4 rootwait
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 82702bcfc7..218955fc02 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 
 # Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
@@ -13,10 +13,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.22"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
