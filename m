Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D429CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 22:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F60A60BF9;
	Sat, 26 Mar 2022 22:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIHxdT0be9kG; Sat, 26 Mar 2022 22:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3687560BB1;
	Sat, 26 Mar 2022 22:07:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1C31BF3EE
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 22:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C3E781C81
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 22:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYHiO70jZx3n for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 22:07:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C64A181C6F
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 22:07:33 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w21so10688406wra.2
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/924nRKkLbcSKyEBS7EwcZfYlV/Z/Gd7v8CjZdDAfgo=;
 b=Al72QW//kS/xs+E2aJrDAX4zOFfbMM77m/DXfhAi2hgkBAJG5SKOiVAc1B6YQUXOdb
 PurdvXq0jwK6n+ld1qc017vaq+X9FUInecE24jeLCY82PORDXfWWUOKlb2KqUlc9063T
 BVw1kJUcRj+hfTGHT4gAQwfoVWLhngR4xDJeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/924nRKkLbcSKyEBS7EwcZfYlV/Z/Gd7v8CjZdDAfgo=;
 b=1WX5RLQfa6Qp7rMTf4PE6CsFPJGcs2DNXPGKkT0O/oWcvD5DtkeA74N9eRZ7cZChHH
 M3djphIri+VJdimB6uaVKMaujZgFzbfm/ZI/ZzDDVUe7A9cmja3iyTColNUekCqrH3fY
 g6E1nR//EwHYcwK2Z8eec+CVelOe4m+mBc0e89WGqme1cBGperGDAnCY2klq8KDRE449
 ifCtaWpDKBPChnuNoUuzVDQpBpuLO2G1lkyQcMUk/gzAa6C2Jb/RLPkCrZyhlfzYyzpl
 MMIrWUhLxUm1//G4euGtuk4xcgsnUrWzpvYAaHeF2T41rw7O2ixvE6+9lG+a9/vK0K0m
 vkzw==
X-Gm-Message-State: AOAM531doXGIbBTK8HLK/IIR8VCHiMsb8sJxzPc/6dKRqemXhy+/Sobn
 s8PMauJFzddC1ZAqZDcJpj1WL4hcCgoZTA==
X-Google-Smtp-Source: ABdhPJy2J45yFbQkNBuqBtirSUNAkLhCNlCUtxWttNz8xYNyU5SJtRZJaK+Fb4cKu3jkJNR+YH7rag==
X-Received: by 2002:a5d:6812:0:b0:203:f854:c380 with SMTP id
 w18-20020a5d6812000000b00203f854c380mr14817853wru.235.1648332451916; 
 Sat, 26 Mar 2022 15:07:31 -0700 (PDT)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42]) by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm9351967wmp.44.2022.03.26.15.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 15:07:31 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 26 Mar 2022 23:07:27 +0100
Message-Id: <20220326220727.827332-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libdill is a C library that makes writing structured concurrent programs
easy.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1-v2:
Better configuration options handling:
libdill build can actually be customized only when using configure
indeed cmake doesn't offer the same configuration option,

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libdill/Config.in    |  7 +++++++
 package/libdill/libdill.hash |  3 +++
 package/libdill/libdill.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/libdill/Config.in
 create mode 100644 package/libdill/libdill.hash
 create mode 100644 package/libdill/libdill.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 70d71186ed..9410944584 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -167,6 +167,7 @@ F:	package/i2c-tools/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
+F:	package/libdill/
 F:	package/mender/
 F:	package/mender-artifact/
 F:	package/mono/
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..47f84a08dc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1968,6 +1968,7 @@ menu "Other"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
 	source "package/libdaemon/Config.in"
+	source "package/libdill/Config.in"
 	source "package/libeastl/Config.in"
 	source "package/libee/Config.in"
 	source "package/libev/Config.in"
diff --git a/package/libdill/Config.in b/package/libdill/Config.in
new file mode 100644
index 0000000000..0e6757b809
--- /dev/null
+++ b/package/libdill/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDILL
+	bool "libdill"
+	help
+	  Libdill is a C library that makes writing structured concurrent
+	  programs easy.
+
+	  http://libdill.org
diff --git a/package/libdill/libdill.hash b/package/libdill/libdill.hash
new file mode 100644
index 0000000000..4a1fb91a57
--- /dev/null
+++ b/package/libdill/libdill.hash
@@ -0,0 +1,3 @@
+# sha256 locally computed
+sha256  6df7527e8f1e91f5106c21c5bfeaa69eee470bec476c74585143e3e439864404  libdill-fa01648cf2a8d06e53c965b45eeacfb3ac57bd04.tar.gz
+sha256  3f78d9c42c8919cb6dc63e51de17b9eb40a49d9cdd876ce59e77392721e8c2c6  COPYING
diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
new file mode 100644
index 0000000000..8efe1ff356
--- /dev/null
+++ b/package/libdill/libdill.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libdill
+#
+################################################################################
+
+LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
+LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
+LIBDILL_LICENSE = MIT
+LIBDILL_LICENSE_FILES = COPYING
+LIBDILL_CPE_ID_VENDOR = libdill
+LIBDILL_CPE_ID_PRODUCT = libdill
+LIBDILL_INSTALL_STAGING = YES
+LIBDILL_AUTORECONF = YES
+
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBDILL_CONF_OPTS += --disable-threads
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBDILL_DEPENDENCIES = openssl
+LIBDILL_CONF_OPTS += --enable-tls
+endif
+
+$(eval $(autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
