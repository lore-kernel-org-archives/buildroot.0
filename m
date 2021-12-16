Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA88C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 22:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0E441793;
	Thu, 16 Dec 2021 22:27:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRkOr_yZKoqP; Thu, 16 Dec 2021 22:27:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF9A141769;
	Thu, 16 Dec 2021 22:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 810971BF29D
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7057461032
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 22:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pI8qIrfIdwit for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 22:27:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF8C261063
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 22:26:59 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t26so614241wrb.4
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 14:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbc437Ntdd9kohrvAG+zkqiGZeUOWbg1nYOIVRYTKiQ=;
 b=QUpYc+ca4JOO/R/f1FZ7Fr3eSYap+3SAM+ou2SAIcknWDHUlFReYJCoRUY0zyWITR5
 sWQcmuxQsefn7Je4FWZcuUrtBNVIq6+ucyciZ3pqXzt1B8xFenDE+NPw/LsCPK6VQIYf
 68P6JThRBrnpCDQ5p5d1DtES9CDYoBwBwfat6mv3+AS4NMK6sp+c4E108Nl/Rc50EPz/
 ttSLNrHgLvdbij6Q0/eFDFTSc3JSrL1Idjrx1eOZCRVMjGJM0DtOLLq0y0vOLFiIgTt1
 cJEkc+ajOa+RQDGHBpH1in/e6vdlo1+ZAXFRpHGbwGx0QVwTnMHDgbFEWkCcmZCgHf/T
 j5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fbc437Ntdd9kohrvAG+zkqiGZeUOWbg1nYOIVRYTKiQ=;
 b=fmJa7belekPGvJyOzHEHR2cepb3MVpniFUQTsjv3cNvlWOTk1Da6WP9xmgYRJA1OzE
 UdPDGYWuEfmrT+pss5jUme7y05urXzCCT3SCEyXAI9NAg4NMBj/2c3PLh4+f6HWVXkd6
 f3QNsyXiNPIU3Ru4LjilFm36FK+2RwsXKYE8X//+0D6pdqpXRoQkvGfXb4ORQfR0bK0X
 JOX8e8KEEYg2uH8lXYckkpZKj0CR7MqleT61kv+AvGPWo82gVTl3cSVxxbCSRlc55Xka
 HFli/h9xIcMCpiRPshtiUVaynZ4uP6z0uJ4mkit/FR4BoMgZmBV2yYNkjm0RX/SRg9uM
 BBEQ==
X-Gm-Message-State: AOAM531FVPFGt6uH/G1SfE/QwSf+w+k28am+4f9G2CXVmlDc1FbFO448
 2z08sjGNdjp7sovKvUhdRQaQpbotJTfXoQ==
X-Google-Smtp-Source: ABdhPJzOrwmSne+xpAyiwnAWN7kQ6kS3ajEPfnu87W7W0sRFpGl29llub9gdsuKvFGfIuzQyI4y40Q==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr65031wrn.165.1639693617998;
 Thu, 16 Dec 2021 14:26:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id o12sm7871810wrc.85.2021.12.16.14.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:26:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 23:26:24 +0100
Message-Id: <20211216222624.1026887-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/frr: c-ares is optional,
 not mandatory
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-configure.ac-fix-enable_bmp-typo.patch | 29 +++++++++++++++++++
 package/frr/Config.in                         | 17 ++++++++++-
 package/frr/frr.mk                            | 16 ++++++++--
 3 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 package/frr/0001-configure.ac-fix-enable_bmp-typo.patch

diff --git a/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
new file mode 100644
index 0000000000..c8ce500dfc
--- /dev/null
+++ b/package/frr/0001-configure.ac-fix-enable_bmp-typo.patch
@@ -0,0 +1,29 @@
+From bacabf2476553d0e873b827359e1c8a4216c2f8c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 16 Dec 2021 20:10:26 +0100
+Subject: [PATCH] configure.ac: fix enable_bmp typo
+
+enable_bmp doesn't exist, use enable_bgp_bmp
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FRRouting/frr/pull/10236]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1bcc42ef8..c7a5f1286 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1806,7 +1806,7 @@ if test "$enable_bgp_vnc" != "no";then
+ fi
+ 
+ bgpd_bmp=false
+-case "${enable_bmp}" in
++case "${enable_bgp_bmp}" in
+   no)
+     ;;
+   yes)
+-- 
+2.33.0
+
diff --git a/package/frr/Config.in b/package/frr/Config.in
index 877b75b107..c2e9577a27 100644
--- a/package/frr/Config.in
+++ b/package/frr/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_FRR
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libyang
 	select BR2_PACKAGE_BASH
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBYANG
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_READLINE
@@ -19,6 +18,22 @@ config BR2_PACKAGE_FRR
 
 	  https://frrouting.org
 
+if BR2_PACKAGE_FRR
+
+config BR2_PACKAGE_FRR_BMP
+	bool "BMP protocol"
+	select BR2_PACKAGE_C_ARES
+	help
+	  Build BGP Monitoring Protocol daemon.
+
+config BR2_PACKAGE_FRR_NHRPD
+	bool "NHRPD protocol"
+	select BR2_PACKAGE_C_ARES
+	help
+	  Build Next Hop Routing Protocol daemon.
+
+endif
+
 comment "frr needs a toolchain w/ threads, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_USE_MMU
diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 97cc735935..3bd587a1cd 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -12,8 +12,8 @@ FRR_CPE_ID_VENDOR = linuxfoundation
 FRR_CPE_ID_PRODUCT = free_range_routing
 FRR_AUTORECONF = YES
 
-FRR_DEPENDENCIES = host-frr readline json-c \
-	libyang libnl c-ares
+FRR_DEPENDENCIES = host-frr readline json-c libyang libnl \
+	$(if $(BR2_PACKAGE_C_ARES),c-ares)
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
@@ -35,6 +35,18 @@ FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 
 HOST_FRR_CONF_OPTS = --enable-clippy-only
 
+ifeq ($(BR2_PACKAGE_FRR_BMP),y)
+FRR_CONF_OPTS += --enable-bgp-bmp
+else
+FRR_CONF_OPTS += --disable-bgp-bmp
+endif
+
+ifeq ($(BR2_PACKAGE_FRR_NHRPD),y)
+FRR_CONF_OPTS += --enable-nhrpd
+else
+FRR_CONF_OPTS += --disable-nhrpd
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 FRR_DEPENDENCIES += libcap
 FRR_CONF_OPTS += --enable-capabilities
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
