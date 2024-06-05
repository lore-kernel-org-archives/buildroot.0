Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4FFC25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 23:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDFD5849C0;
	Wed,  5 Jun 2024 23:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hylGnG-oDRMQ; Wed,  5 Jun 2024 23:41:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC460849C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC460849C1;
	Wed,  5 Jun 2024 23:41:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 955B31BF5A5
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80796849C1
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 23:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcsF_lZ8HJOG for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 23:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74F0C849C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74F0C849C0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74F0C849C0
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 23:41:36 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7eb12b2bf78so17064739f.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 16:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717630895; x=1718235695;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FDWcLd/pf0f3WbcedvX+jKIsIRApqhK9rkkWieD6uBw=;
 b=gGwIgrL/hsjlXT7j7MYknmX4sH0+3EL7wMKcA/i2qaZiX57ZeTWG5SH6238UkTCURa
 v8O3E3Yk8IyVz+rv3exudM9b9JQ5HTbvxwMH7iYO5H6MznAGvyGbhmLCd14ydsRcibBP
 Hb3CuEm5c/IYNBg9Z3ZuGAhw1mMHlHM8PLSQSAx3zaqmCKVwN4do5inijpvkx8SlgLww
 kMwh5NX4KSC5FL6B8l7ZkLJO4Uynx2MX71f6pf2bzeNVgsMW+mRymV6eSLVTzEAWwYuF
 M33QTl6yAM2xqSsOKCVz4DzOWnBxgK9JYHwk6IVVLFurYykZD76IPLaE+ybA2q8H5B3K
 AlCA==
X-Gm-Message-State: AOJu0Yx1o+W69ko8aqaQf21WeVoh6lXXhefSi8Rdl5bqnuMya8Fer9CK
 L/cKARbq+usjZgW/lKr7qch8GUct2YI7znmZZFInVv4Ei2SHV27L65YGWV9C
X-Google-Smtp-Source: AGHT+IHpCQEMHEEAMi/4MrrhRIkchXcd/vL0mB7wfYNtARY8CU8ff13xq4d2BCJQ7xHokaFJG1DrSA==
X-Received: by 2002:a05:6602:6414:b0:7da:cbc2:7caa with SMTP id
 ca18e2360f4ac-7eb3c799448mr516475439f.9.1717630894925; 
 Wed, 05 Jun 2024 16:41:34 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-7eb4c47d534sm4871139f.34.2024.06.05.16.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 16:41:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 17:41:28 -0600
Message-Id: <20240605234131.3370484-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717630895; x=1718235695; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FDWcLd/pf0f3WbcedvX+jKIsIRApqhK9rkkWieD6uBw=;
 b=nBqSCEDY+MAuqi/b2JIgwDMyROQX7JgyfkB7THfCvWzYUUJC96wlQKjV30s5wwxucT
 OIHeSwbNXeSw2OhhkDMGyHFjxcb1T/WMdf7hGEJtr4ZEMxKdbjd4VZcJCMUukr3R5LB7
 Wn7SsprRQfNBz+irxA5J08xpm43ZB73aNJNwYxppyJPSBMctRTIsOAYmFnvsxo2WptAI
 1ZN9Nso/ES6D79laXlLJLaPSPQWj3UKiYtIEbT5ZC1T/hvt0lbsn5dMll/gqXMj0eNI6
 ylR7G/2DeMrrI3aB7bVxc9RfG05/Fp7oDYVgXskUdr9w02Tjwt5fqSdrDLeu/73HNT3e
 hXpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nBqSCEDY
Subject: [Buildroot] [PATCH 1/4] package/libjcat: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in            |  1 +
 package/libjcat/Config.in    | 15 +++++++++++++
 package/libjcat/libjcat.hash |  3 +++
 package/libjcat/libjcat.mk   | 43 ++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)
 create mode 100644 package/libjcat/Config.in
 create mode 100644 package/libjcat/libjcat.hash
 create mode 100644 package/libjcat/libjcat.mk

diff --git a/package/Config.in b/package/Config.in
index bfbec1c21d..9a948c5536 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1523,6 +1523,7 @@ endmenu
 menu "Compression and decompression"
 	source "package/libarchive/Config.in"
 	source "package/libdeflate/Config.in"
+	source "package/libjcat/Config.in"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
diff --git a/package/libjcat/Config.in b/package/libjcat/Config.in
new file mode 100644
index 0000000000..cf7bc334f5
--- /dev/null
+++ b/package/libjcat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_LIBJCAT
+	bool "libjcat"
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Library for reading and writing Jcat files.
+
+	  https://github.com/hughsie/libjcat
+
+comment "fwupd needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libjcat/libjcat.hash b/package/libjcat/libjcat.hash
new file mode 100644
index 0000000000..b6dc8d2f69
--- /dev/null
+++ b/package/libjcat/libjcat.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  a6232aeca3c3fab6dbb3bed06ec3832088b49a4b278a7119558d72be60ce921f  libjcat-0.2.1.tar.xz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  LICENSE
diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
new file mode 100644
index 0000000000..e13e5dbfb7
--- /dev/null
+++ b/package/libjcat/libjcat.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# libjcat
+#
+################################################################################
+
+LIBJCAT_VERSION = 0.2.1
+LIBJCAT_SITE = https://github.com/hughsie/libjcat/releases/download/$(LIBJCAT_VERSION)
+LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
+LIBJCAT_LICENSE = LGPL-2.1+
+LIBJCAT_LICENSE_FILES = LICENSE
+LIBJCAT_INSTALL_STAGING = YES
+LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2
+
+LIBJCAT_CONF_OPTS = \
+	-Dgtkdoc=false \
+	-Dtests=false \
+	-Ded25519=false \
+	-Dman=false \
+	-Dcli=true
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+LIBJCAT_DEPENDENCIES += host-vala gobject-introspection
+LIBJCAT_CONF_OPTS += -Dintrospection=true -Dvapi=true
+else
+LIBJCAT_CONF_OPTS += -Dintrospection=false -Dvapi=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPG_ERROR)$(BR2_PACKAGE_LIBGPGME),yy)
+LIBJCAT_DEPENDENCIES += libgpg-error libgpgme
+LIBJCAT_CONF_OPTS += -Dgpg=true
+else
+LIBJCAT_CONF_OPTS += -Dgpg=false
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBJCAT_DEPENDENCIES += gnutls
+LIBJCAT_CONF_OPTS += -Dpkcs7=true
+else
+LIBJCAT_CONF_OPTS += -Dpkcs7=false
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
