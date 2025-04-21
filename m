Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB65C369C2
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 11:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 064DA60AB9;
	Mon, 21 Apr 2025 11:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFBg3E3I81Rf; Mon, 21 Apr 2025 11:09:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4074260ABC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4074260ABC;
	Mon, 21 Apr 2025 11:09:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88D2B1A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84D6940B4C
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0FPdY05HCMVV for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 11:09:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EF21C400DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF21C400DD
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF21C400DD
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:09:45 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-227914acd20so38047945ad.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 04:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745233785; x=1745838585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+6RT78UrEDoIaVp1M1CeR3v87muge90PjWgL0QTVimg=;
 b=R1fElyrE0VyMCxLn3YYVj+ECzVucihPlIkplSQbO9SJSXwqHBFPB2XELpIbVAvU3X8
 IGb75xgD6D38u6n5QkwJ3HcsYI28VmBCXSRLH2e8H58uQMfNKJ0J1nF9JaQYajiaT+3y
 YMyiaxQY/GTlW4wtw9Wb5Ppim8yjp8YrQvE8CjlqmX25UsrhbnIEfwUPqf8WVjwGNX+8
 GvWvoB2rdm6Ow82HdpKOOnnHeQ8q86pOJpXddzL4wvepTDaDDk/NoZK/2juZcPQyIhIF
 HjJ5IkUP8Jwn+u4ZzsKYsag+qk8gwrQydOjV6R/c89aYJhtzHSCtxMUIgcAL51XHF8Nl
 dMmg==
X-Gm-Message-State: AOJu0YwVS6BkOlHH1+8HjWZrXsJd1YXKb1IOLnIMvqp3vHFx+mLp2eLa
 RG8OrpdSf3vySgKpjKKtwOREe24DrtLx//3TgEms32msdP6ltnJnVH8pwg==
X-Gm-Gg: ASbGncvr7c8PVijX6rfObDXlxfDpyGSykpxKpf61zELUcX3EiPWKjhnlV4lKewh+H9U
 1YgD0FCteATrkg71rbsVi/lwhcRDHahrd62bTtaWc659DxI6uczyUb9dsI7vkOLYWU4AlXaPDPK
 2VBFEiQU0ZT1eNLuzZVwzLrSrtLpDfS5vlT1NdueZtnY+31zBX47Mm0L1x+RKuE8VW6xOigNiQf
 Z1D2qpJgy2mUaOnAFMQ+gvsyi+chnbWSa7/qag7BrKb1qssYruqgrR8B59MpZ6HYl7MiG/ETOgb
 hwBlGfcSOgBb7/WlTpY2RiTkwd6j1BgUIbOtVr/QM54i9QCi
X-Google-Smtp-Source: AGHT+IGdPYcyuvBxSzsbRpHunMPOrOyp5F6pMV8ep5usVD8mteAkG+uW3O0oRAIJvJu9YEJ4siJrxg==
X-Received: by 2002:a17:903:2311:b0:223:517a:d4ed with SMTP id
 d9443c01a7336-22c53e86723mr144819395ad.15.1745233784709; 
 Mon, 21 Apr 2025 04:09:44 -0700 (PDT)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c50fe0976sm63046185ad.245.2025.04.21.04.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Apr 2025 04:09:44 -0700 (PDT)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Mon, 21 Apr 2025 19:09:33 +0800
Message-ID: <20250421110935.6973-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745233785; x=1745838585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+6RT78UrEDoIaVp1M1CeR3v87muge90PjWgL0QTVimg=;
 b=SaXhnX3jVIPStxFdzpcCP6hoP2PxEMyH6eijrRDQmD3etMZKNQAJ6dP7D8InHvnX5C
 DL3GfhP1k6VNwDg1TBF9Ubf0/cMhPMWaZb9ZlQAxRMmGxqcCM9T6ELFWLVBi0Pme+ERz
 fd7Lwjqu1TLrD18a8VPXeY90HecpCXj0kRAMWLU+wMLtCrsP/D4cyEZzZsukEhukzfru
 a7DCnC/b8EkIpq7nGe0PaB89B7fKPWCTlC68SAZj/JcddlR5Nv85NUbxMKOz/aagrqc9
 jfV0YPJ60NOupBRidTcoImgqvPAcM986dhnETAZ86qkccp6MOppzbzAjV96+pxbReY8L
 SPVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SaXhnX3j
Subject: [Buildroot] [PATCH] configs/cubieboard2: bump Linux to 6.12.24 and
 U-Boot to 2025.04
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/cubietech/cubieboard2/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard2/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard2_defconfig                        | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/cubietech/cubieboard2/patches/linux/linux.hash b/board/cubietech/cubieboard2/patches/linux/linux.hash
index 2e30d90bb1..1213da86b1 100644
--- a/board/cubietech/cubieboard2/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard2/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9423f4bfb4d875417e39cb0b017b5499fea47da56119f0cd28a201735d898f14  linux-6.12.14.tar.xz
+sha256  643142c1b5991560dd12f950825cc19e4497b95b82641918ecff1177f4130c1d  linux-6.12.24.tar.xz
diff --git a/board/cubietech/cubieboard2/patches/uboot/uboot.hash b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
index 50674352d7..80ea21b7cb 100644
--- a/board/cubietech/cubieboard2/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard2/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/cubieboard2_defconfig b/configs/cubieboard2_defconfig
index 6161e3a559..180677923a 100644
--- a/configs/cubieboard2_defconfig
+++ b/configs/cubieboard2_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard2/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.24"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun7i-a20-cubieboard2"
@@ -19,7 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
