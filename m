Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C55EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 03:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD6F9405DF;
	Fri, 21 Jul 2023 03:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD6F9405DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ddr3Z5DDqmN; Fri, 21 Jul 2023 03:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B456A40320;
	Fri, 21 Jul 2023 03:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B456A40320
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D9ED41BF329
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 03:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3675607A4
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 03:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3675607A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyGZBxtfV3cy for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 03:21:16 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28EFC60736
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 03:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EFC60736
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1b89600a37fso9819825ad.2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689909675; x=1690514475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MuDhMO5/YmdeadrypWTM7Y4acQV7qysDAEPXh5gSmdc=;
 b=i7eEeH9XtcLZhne1gb/y8O23cnuKshV7WZjYWBTMOdq12uTeO0LkUuylvYrvtY2VEa
 iQT8ZGlsQShAP5O9b9o01sAvY0SiP8iLzwsKaCwKX7ydUDEU1MomVvI1opbC/1j3xYnN
 gU170wreqpJki2XDHEygYLHAKYCjLJHvj0FbssjTFSWzQznvHJk7lSFN1nAG39cNs7bb
 2oUt27B8fp6FHLivzjUYmE05wUZYFLcukQOpGThSFAR+Q3cBLJXl+cRLdFxJsmNXks7B
 NY+Iw5KBzATxpSBoZdbQpW42pjN1rApCsLYzAhp1FJhpuJ/v1dtW95aD8tRFApHW2qfE
 oA4A==
X-Gm-Message-State: ABy/qLZggN3M1p8r45q7bQsW/1Z5KML4+3T0aVZRWgb+v21vrgmANri/
 kOo6HQs5csPFl4NlLAdffdk9MYIk6CcWERDQ
X-Google-Smtp-Source: APBJJlFtC8FkZH0kWjN1J+NFAaf3hYkDK2RFJePo0zTuTT3Rtgb3jioi0FerA6TXY+20e3dz0upaWg==
X-Received: by 2002:a17:902:ec01:b0:1b9:e8d9:7e42 with SMTP id
 l1-20020a170902ec0100b001b9e8d97e42mr567747pld.69.1689909675179; 
 Thu, 20 Jul 2023 20:21:15 -0700 (PDT)
Received: from toolbox.wdc.com
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a170903018f00b001b9df74bac6sm2145135plg.260.2023.07.20.20.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 20:21:14 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 13:21:02 +1000
Message-Id: <20230721032102.782318-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230721032102.782318-1-alistair.francis@wdc.com>
References: <20230721032102.782318-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689909675; x=1690514475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MuDhMO5/YmdeadrypWTM7Y4acQV7qysDAEPXh5gSmdc=;
 b=dALkK4OXbUxWDjRqEaOfRjPQVH5S3TN1RdyfqSEnFwT7JUvPtYI7a9stJM5+9aX2hH
 TtW73JKCNN+eX3edwUsnJLJFeqjSk+ijR00Oe6GqWyGK0vUgxnKHSxjmmMEvvaFPaRrP
 gDhkyf3Nfmbo6YJDvPnTmSkZ84JE03pANRYSANYm4aC0E7Px2xlfOLItl0H8bQhIB8Lc
 /aWbzzW89BqETJIDoA18OwTW6F+//WG2nhwNc4xfbbSm14rNbY0hrYIOTPbTSiNzC3lB
 a9UKKgcFQr0F2v7jNyH8+At/rIDUlyTc/exBjKAZq7BPNXgGEK+/kP/YSHXS04dHOHHb
 XPow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dALkK4OX
Subject: [Buildroot] [PATCH 2/2] package/libspdm: Initial commit
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/Config.in            |  1 +
 package/libspdm/Config.in    |  8 ++++
 package/libspdm/libspdm.hash |  3 ++
 package/libspdm/libspdm.mk   | 75 ++++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+)
 create mode 100644 package/libspdm/Config.in
 create mode 100644 package/libspdm/libspdm.hash
 create mode 100644 package/libspdm/libspdm.mk

diff --git a/package/Config.in b/package/Config.in
index 601922aad5..8384654616 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -192,6 +192,7 @@ menu "Development tools"
 	source "package/jo/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
+	source "package/libspdm/Config.in"
 	source "package/make/Config.in"
 	source "package/mawk/Config.in"
 	source "package/patch/Config.in"
diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
new file mode 100644
index 0000000000..3051fc8c59
--- /dev/null
+++ b/package/libspdm/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBSPDM
+	bool "libspdm"
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  libspdm is a sample implementation that follows
+	  the DMTF SPDM specifications
+
+	  https://github.com/DMTF/libspdm
diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
new file mode 100644
index 0000000000..d06af29397
--- /dev/null
+++ b/package/libspdm/libspdm.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3a40daa59f32843062c3d2699acee09bd0ee217eb8ebf0378ae12b60b6db0636  libspdm-3.0.0.tar.gz
+sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  LICENSE.md
diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
new file mode 100644
index 0000000000..1f8012f599
--- /dev/null
+++ b/package/libspdm/libspdm.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# libspdm
+#
+################################################################################
+
+LIBSPDM_VERSION = 3.0.0
+LIBSPDM_SITE = $(call github,DMTF,libspdm,$(LIBSPDM_VERSION))
+LIBSPDM_LICENSE = BSD-3-Clause
+LIBSPDM_LICENSE_FILES = LICENSE.md
+
+LIBSPDM_INSTALL_STAGING = YES
+LIBSPDM_INSTALL_TARGET = YES
+
+LIBSPDM_DEPENDENCIES += openssl
+
+ifeq ($(BR2_arcle)$(BR2_arceb),y)
+LIBSPDM_TARGET_CPU_FAMILY = arc
+else ifeq ($(BR2_arm)$(BR2_armeb),y)
+LIBSPDM_TARGET_CPU_FAMILY = arm
+else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
+LIBSPDM_TARGET_CPU_FAMILY = aarch64
+else ifeq ($(BR2_i386),y)
+LIBSPDM_TARGET_CPU_FAMILY = ia32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_32),yy)
+LIBSPDM_TARGET_CPU_FAMILY = riscv32
+else ifeq ($(BR2_riscv)$(BR2_RISCV_64),yy)
+LIBSPDM_TARGET_CPU_FAMILY = riscv64
+else ifeq ($(BR2_x86_64),y)
+LIBSPDM_TARGET_CPU_FAMILY = x64
+else
+LIBSPDM_TARGET_CPU_FAMILY = $(ARCH)
+endif
+
+LIBSPDM_CONF_OPTS = \
+	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
+	-DTOOLCHAIN=NONE \
+	-DTARGET=Release \
+	-DCRYPTO=openssl \
+	-DENABLE_BINARY_BUILD=1 \
+	-DCOMPILED_LIBCRYPTO_PATH=/usr/lib/ \
+	-DCOMPILED_LIBSSL_PATH=/usr/lib/ \
+	-DDISABLE_TESTS=1 \
+	-DLINK_FLAGS=$(STAGING_DIR)
+
+define LIBSPDM_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/* $(STAGING_DIR)/usr/lib/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/library
+	$(INSTALL) -D -m 0755 $(@D)/include/library/* $(STAGING_DIR)/usr/include/library
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/internal
+	$(INSTALL) -D -m 0755 $(@D)/include/internal/*.h $(STAGING_DIR)/usr/include/internal/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/hal/library/cryptlib
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/hal/library/requester
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/hal/library/responder
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/*.h $(STAGING_DIR)/usr/include/hal/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/*.h $(STAGING_DIR)/usr/include/hal/library/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/cryptlib/* $(STAGING_DIR)/usr/include/hal/library/cryptlib/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/requester/* $(STAGING_DIR)/usr/include/hal/library/requester/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/responder/* $(STAGING_DIR)/usr/include/hal/library/responder/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/industry_standard
+	$(INSTALL) -D -m 0755 $(@D)/include/industry_standard/* $(STAGING_DIR)/usr/include/industry_standard
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/os_stub/spdm_crypt_ext_lib
+	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/os_stub/spdm_crypt_ext_lib
+endef
+
+define LIBSPDM_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/* $(TARGET_DIR)/usr/lib/
+endef
+
+$(eval $(cmake-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
