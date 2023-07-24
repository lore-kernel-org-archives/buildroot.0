Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B7AC001B0
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 01:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B85E60BDA;
	Mon, 24 Jul 2023 01:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B85E60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Hj_A45pMoeH; Mon, 24 Jul 2023 01:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BB7B60BE3;
	Mon, 24 Jul 2023 01:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BB7B60BE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE37C1BF4DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7CB5401F3
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 01:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7CB5401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMdp_oa-sdUT for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 01:48:46 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E2D44012E
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 01:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E2D44012E
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6bb14c05d77so2436591a34.2
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 18:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690163325; x=1690768125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d29BX1uUjk0MqhOTPvTDGZBmiqrkSA47QJts9HWKC2Y=;
 b=apdX1Ocyydu/WmmgP+j1T1VVbb3/uMSB9pRoyEbmik3TDAuJBl1idF9We66dpIGUT3
 f3fF+ksotN8eRWYVRgfhpIM0qCtxlX9Z+KiEn92QXAFV7B4adJg8SRqJ6RVCYBCmX8RF
 SnifQXNAk57oVKcBXiRipOUL8mawkckX75nwioZJw6sxA3NAGBqwa7dU6n04bNE6OdA5
 OFNg/L6/Ex+++fqE5WoVkVinrwvfjKeylTvMmVNWGk4/WbjFRcbhNsklcSY/7ButkkeK
 IIaM0KPJ+Lnf0K7P0FFxTw2sD2NdBzIBSDiNgyZokcz5fG42Fr8gLPXF5eaOU7mX1kNG
 ZNKw==
X-Gm-Message-State: ABy/qLZ0omf5BiXSpMDhFRj3EkoF8BIv+Nfh0d3WjcDin/HS77l/RWbj
 wAiyLa/rQOeMFUGUJpvg7xALVnJWRYkeoy1v
X-Google-Smtp-Source: APBJJlFd/Y6r3HgnFVdC9T8WFtD53wGX0+kTwT7oSYV/k6sgBdFBbEhoLW8+LVPBO4HYlJUPwvRxOA==
X-Received: by 2002:a05:6870:b290:b0:18b:1936:30ee with SMTP id
 c16-20020a056870b29000b0018b193630eemr9064377oao.56.1690163325355; 
 Sun, 23 Jul 2023 18:48:45 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 r24-20020a62e418000000b0064d74808738sm6475330pfh.214.2023.07.23.18.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jul 2023 18:48:44 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 11:48:32 +1000
Message-Id: <20230724014832.2207166-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230724014832.2207166-1-alistair.francis@wdc.com>
References: <20230724014832.2207166-1-alistair.francis@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690163325; x=1690768125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d29BX1uUjk0MqhOTPvTDGZBmiqrkSA47QJts9HWKC2Y=;
 b=l4M7IOuTr74zwsLG7n9+EptOyz/SThtjXDUkr7OHPvIv/Mih2AzXi65VzhUQdyT2Va
 d+/WsDxlhevHNw2jQ3dEuTPqGXNazVFy42RmeDxp6L+BLGw/4IWyEwki5Rk9kjZQKGnX
 9bdyu1M/dt0ak9+WpzldOGtaW57vca5pW3cUt2bWLzM2NlWiXGQHrMPimwWXp9LPRRyd
 lnSQcIgTOCDzMPLLfeXr5LOkoUmVzQUpwhpyAksCOV/Ytb8U64qC+JNA++A0L5F+mIVe
 r8PTEEL/iaMB703TQiQeHnikkrs0AHprQQyH716+81JDl1QFD9qnfn21jf/j0PI3/xFS
 gdMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l4M7IOuT
Subject: [Buildroot] [PATCH v2 2/2] package/libspdm: Initial commit
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
 package/libspdm/Config.in    | 20 ++++++++++++
 package/libspdm/libspdm.hash |  3 ++
 package/libspdm/libspdm.mk   | 59 ++++++++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 package/libspdm/Config.in
 create mode 100644 package/libspdm/libspdm.hash
 create mode 100644 package/libspdm/libspdm.mk

diff --git a/package/Config.in b/package/Config.in
index 1e551d17c4..bc7e54113c 100644
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
index 0000000000..b732662842
--- /dev/null
+++ b/package/libspdm/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_LIBSPDM
+	bool "libspdm"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	help
+	  libspdm is a sample implementation that follows
+	  the DMTF SPDM specifications
+
+	  https://github.com/DMTF/libspdm
+
+config BR2_PACKAGE_LIBSPDM_CPU_FAMILLY
+	string
+	default "arc" if BR2_arcle || BR2_arceb
+	default "arm" if BR2_arm || BR2_armeb
+	default "aarch64" if BR2_aarch64 || BR2_aarch64_be
+	default "ia32" if BR2_i386
+	default "riscv32" if BR2_riscv && BR2_RISCV_32
+	default "riscv64" if BR2_riscv && BR2_RISCV_64
+	default "x64" if BR2_x86_64
+	default BR2_ARCH  # Yes, this should work...\
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
index 0000000000..daf6639808
--- /dev/null
+++ b/package/libspdm/libspdm.mk
@@ -0,0 +1,59 @@
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
+LIBSPDM_TARGET_CPU_FAMILY = $(call qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILLY))
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
+	$(INSTALL) -m 0755 -t $(STAGING_DIR)/usr/lib/ $(@D)/lib/*
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/library
+	$(INSTALL) -D -m 0755 $(@D)/include/library/* $(STAGING_DIR)/usr/include/libspdm/library
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/internal
+	$(INSTALL) -D -m 0755 $(@D)/include/internal/*.h $(STAGING_DIR)/usr/include/libspdm/internal/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/cryptlib
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/requester
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/hal/library/responder
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/*.h $(STAGING_DIR)/usr/include/libspdm/hal/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/*.h $(STAGING_DIR)/usr/include/libspdm/hal/library/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/cryptlib/* $(STAGING_DIR)/usr/include/libspdm/hal/library/cryptlib/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/requester/* $(STAGING_DIR)/usr/include/libspdm/hal/library/requester/
+	$(INSTALL) -D -m 0755 $(@D)/include/hal/library/responder/* $(STAGING_DIR)/usr/include/libspdm/hal/library/responder/
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/industry_standard
+	$(INSTALL) -D -m 0755 $(@D)/include/industry_standard/* $(STAGING_DIR)/usr/include/libspdm/industry_standard
+
+	$(INSTALL) -d $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
+	$(INSTALL) -D -m 0755 $(@D)/os_stub/spdm_crypt_ext_lib/*.h $(STAGING_DIR)/usr/include/libspdm/os_stub/spdm_crypt_ext_lib
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
