Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44059C54E5D
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 07:06:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 191C640AF9;
	Tue, 19 Mar 2024 07:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQiEPb2SlCj8; Tue, 19 Mar 2024 07:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 015D340B0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 015D340B0D;
	Tue, 19 Mar 2024 07:06:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 259A71BF310
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1313460A38
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 07:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvsQQr8X_hOa for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 07:06:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 29CD36088C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CD36088C
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 29CD36088C
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 07:06:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41462295004so4808265e9.0
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 00:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710831971; x=1711436771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WIcaxdPJt25XMO1ZBRE44ugloipRTvipSMze9jistQ0=;
 b=C7QC6+HsjzHILWpEomKrgfnK2TW+Zo0xnMzQ2g5WikY4uQzYZDQymct7f4rQ4RPlNE
 ZpJqbnsIPNTai6b4cBjsYdvpMNVbrzLQ2yRiUiVGGl4BCxdxRnPpHxEdknBQgduI1JZ+
 O11y2iOXUoQcurxeeKT6rd59sdgBKjwi5Pv81zASJvBL6e4tnZw8DvF7cp9cizFRY7cS
 fdzXd+oGqhClq4uhUGaOnzIFp3dAHkaMHxfZrannF07DKTXRxb1YLW899DAN2RPnxso1
 6w1k99jJjz2xHxAx2HJlJg92tWUuJojGGRFtisL2+N0HiY5VO2fnRO8GosM6eneYvEWy
 GcOw==
X-Gm-Message-State: AOJu0YwzC1lIUjoBDNiOlAUwwzGhsytDSrhZ5rtmc0q8YWpxO0BNj684
 Lsd7+7B0E/EEodLEDZoT7AkVG5fWhoH/UYTmio+6YknZhDWdw/+8yzR1L1o+/iB37lEwnOPeFks
 9iME=
X-Google-Smtp-Source: AGHT+IHT0g+TB/7gLY7jMQK2zlBq8Gn7pzW+JfoVRVmDpm9lzVFJMI4AJkGjTZf2+4h8tDhcgwD2Ew==
X-Received: by 2002:a05:6000:ecd:b0:33e:c521:7c33 with SMTP id
 ea13-20020a0560000ecd00b0033ec5217c33mr9889457wrb.49.1710831970737; 
 Tue, 19 Mar 2024 00:06:10 -0700 (PDT)
Received: from localhost.localdomain (59.178-181-91.adsl-dyn.isp.belgacom.be.
 [91.181.178.59]) by smtp.gmail.com with ESMTPSA id
 q15-20020adff78f000000b0033e192a5852sm11583865wrp.30.2024.03.19.00.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 00:06:10 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Tue, 19 Mar 2024 08:05:53 +0100
Message-ID: <20240319070554.1323606-2-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
References: <20240319070554.1323606-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710831971; x=1711436771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WIcaxdPJt25XMO1ZBRE44ugloipRTvipSMze9jistQ0=;
 b=YKztnrd4UoZP9MGZXdk09NMUwdpTMh6tyVC62raocQ5DlxPIJXQeHGtH+Oo9ktp7+9
 WJtZ5aNmcUmUC19+XeM/Us99uze5B0e5fdJ0TaxeDnbwZAl9ENruBx8yZXTpIQWLQX8N
 a1OOhDW93V0fTpOy0Wwk0HW7BhirFBCr4OAOCPoj+RwyPcTdPJ7rXzsUOLb5abvX2Gik
 NC5iup5iJ1xmi7y/NQDEvW+kRMSFNU8wr414AMoidWa20yYMj3sxJhGemBVK0FegnkIQ
 zBBKQgtNhqnRoeriFOefgQm9lqkitL0GWtUyKo+Hkrfleog91EPgzsBHEDYpkGoclgRf
 8HLA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=YKztnrd4
Subject: [Buildroot] [PATCH v3 2/3] configs/avenger96: bump Linux version to
 6.6.21LTS
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

This patch upgrades Kernel version to 6.6.21 LTS on avenger96 board.
Beside that, In accorcance with the kernel 6.5rc1 commit
724ba6751532 ("ARM: dts: Move .dts filesto vendor sub-directories")
the device tree path also has been modified to point the device tree in
the proper location.
As another change, to be compatible with the changes in the commit
3108eb2e8aa7 ("mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS") with the
default root append (mmcblk1p4) in 'extlinux.conf' file in the
overlay directory of the board, the rootfs was not possible to be
detected. This file also modified to point to the proper mmc block.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>

---
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
index 82702bcfc7..98a71a0f25 100644
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
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
