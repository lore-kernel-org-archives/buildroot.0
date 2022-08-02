Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E804C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 20:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 382978188A;
	Tue,  2 Aug 2022 20:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 382978188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaadMqmsFmGr; Tue,  2 Aug 2022 20:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D03B8186B;
	Tue,  2 Aug 2022 20:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D03B8186B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53B491BF9B5
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A95760E1B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 20:22:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A95760E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBBSzRY7LDdR for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 20:22:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83DD560BD8
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83DD560BD8
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 20:22:08 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id w29so11206065qtv.9
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 13:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=efWheBe2PE4+YCofMo6AQqgK+S+WE21l61fstESzfrM=;
 b=zOxr7/uFCq6iqV+yVIr0ZDIIOLKEN2eWKaDDf5tnbE2QTZs4a4S6me/1NUNl9eJSgL
 mWaIqwciE8xRhS835OxWja+3dPQv5tAdWyN9QpQzVe+kMTNO2/yM30sYgmi0/xysoCj9
 vAJ0WttOvmYHER69aexIL8SM5J/f0RY7FD7BAmnYV58P2ShUOOG1JHy3LjJPWclDYQuA
 m+75dxzPV7TXbCU12yHA32emZIHbF4v51K1x+8/BGIl5DvexgoY2gINWRVFXdJv0WLcL
 C46iw7UwAZbY1guCMLBGh4VyTmAFav7/I3aKTgaSlhAY36PJqOxa1m4kALQLeRCF9oDa
 C4Sw==
X-Gm-Message-State: AJIora9lZWjyAwnmu2jMX+LX12Nocm3w15zekFrjlrjjRABIMSZ1srFM
 u2Wz0mkMukVIp6dTyg//gE02TCMQvYqr0Q==
X-Google-Smtp-Source: AGRyM1ugVojImclSzD0g5bYoHSGtcxHsHxEc6F/h98WVVc79lH8CRs5Ck1dFu5je2dkWAQWTwJzWmQ==
X-Received: by 2002:a05:622a:1a98:b0:31e:f301:7490 with SMTP id
 s24-20020a05622a1a9800b0031ef3017490mr20040674qtc.310.1659471727314; 
 Tue, 02 Aug 2022 13:22:07 -0700 (PDT)
Received: from hefring.. ([50.212.55.89]) by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a448e00b006b6757a11fcsm11661660qkp.36.2022.08.02.13.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 13:22:06 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
X-Google-Original-From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 16:21:40 -0400
Message-Id: <20220802202142.1770838-3-Ben.Wolsieffer@hefring.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
References: <20220802202142.1770838-1-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=efWheBe2PE4+YCofMo6AQqgK+S+WE21l61fstESzfrM=;
 b=g1TMcgVJF0C6nVoLw0JxpHpNXTXjmNIO+Os6fVUYY8w29Pz43od8Zf408liZHA+XFH
 NMagOua7VptFrexl/0GVwXOXUAil/WED7KB2AVo5R4er09oMqaAryNIi6l3lZwmNfOUZ
 rSHnnRKBdTf7pWCxMgRtCqxTlOV0mvDL7/6304zUfH5bFOWBiYqjiHg8nOF7cwYI4eoD
 Fzr4/92/3g5TVklscHRpKbLrzRT931o8OCk7yE+faS23SGTu9iqq8cjyrqq+ixdrY7E1
 pPl4kiv00T13YZn0KPE3ITFNcDQMk/IbD+aWScGP8MbJEO8c5aMaRi7eC/AqUo4k2ObD
 ImEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=hefring-com.20210112.gappssmtp.com
 header.i=@hefring-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=g1TMcgVJ
Subject: [Buildroot] [PATCH v2 2/4] arch/arm: add support for FDPIC
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
This patch enables support for building a toolchain that produces FDPIC
binaries.

The target name for an FDPIC toolchain must be
arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
and requires a special case.

According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
available on all ARM platforms, not just no-MMU.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
---
 arch/Config.in      | 1 +
 package/Makefile.in | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index c5d481b9e5..8dab58cf04 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -39,6 +39,7 @@ config BR2_arceb
 
 config BR2_arm
 	bool "ARM (little endian)"
+	select BR2_ARCH_HAS_FDPIC_SUPPORT
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
 	help
 	  ARM is a 32-bit reduced instruction set computer (RISC)
diff --git a/package/Makefile.in b/package/Makefile.in
index ff60f85092..81a7028275 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -37,7 +37,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
 endif
 
 # Compute GNU_TARGET_NAME
+# FDPIC on ARM requires a special target name: it has no OS field and must
+# use the suffix -uclinuxfdpiceabi.
+ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
+GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi
+else
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
+endif
 
 # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
 # the regular linux name.
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
