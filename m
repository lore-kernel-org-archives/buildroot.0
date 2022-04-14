Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB993C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CA44409F5;
	Thu, 14 Apr 2022 19:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G2FivnvBDl95; Thu, 14 Apr 2022 19:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA414093F;
	Thu, 14 Apr 2022 19:40:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D42601BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCEF040935
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:40:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGF9n1qXyLhh for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34CF94091F
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:40:18 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso6645932pjj.2
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=threespeedlogic-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ydnaz5t41q1axe0JwpeZQCNLH76Dq1qpmLiBR7PDd4=;
 b=MFV7bG+soqqp76qxFGmBjBjUQUUIJ/W2S8cmHa9PC85JJvwatp6YhC9gFpUAx0Btnl
 qIL5KqbUzUb18djjExW1cSc3hD6PGe6APIY3n8apWRS2GowoeP8+GxGncljPsg/KhrVO
 ShCEjB1BCdFy3eWzIPYx7j9A6z6q0rTHzMre/VBEAk8ELcrlnjfQdC0ywqiTXo4mTA5P
 UyheJJ4wYQzipNJhPgfJWiM7fZolaBnvddLmJmguMLpqf1UhIZ86XfWHUQngAA1tJQjw
 D3L+5Ngjeukj+5RpRuo11CBaZKvoABbOG4g7d2Qo+eKXc72MzXNBvuW/dJqYCCin0lg8
 lzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+Ydnaz5t41q1axe0JwpeZQCNLH76Dq1qpmLiBR7PDd4=;
 b=u+dhrvBQyvzvJy/1/ssKtNYk1SVXfnMwh9n1VT2kTxTq3j/rKjmJDSN5ksBE8bcDZZ
 ym3cG6cgt8csV7ScAnnGv4nzPUDqEvuHI8O+V7Lm+31OBZeauwTPlkmJpBHSOkToyXaa
 hO1cogqAsERHX0+FbUboHvB7RVhrHfnlekBdpMoWiUxulDOu55jH/Sc+lJ2vkLOsZqJt
 jl7hWFE/5gcDT0wV6FaI9qc91VZrrrd0g4D3vSlVcnPDW9NURKA15MPQjg26HG4ppJsh
 xAkECpQ/W3ydhP8UQrENQr6n27jubGLNdbm+uIe0i5Ntl8ymnQsoU/fUXlCk8kG4ydG6
 R8gg==
X-Gm-Message-State: AOAM530W65wd0NvVqxDg6lVonM7liGf/grweCTdNgnPup9tk98FppLPQ
 3hO8QCfS3jSBFNjhId8hvNF3+enSQmmKJ8L2
X-Google-Smtp-Source: ABdhPJxjKPmtDuO+6EhTtsvzFvakeY5AaEcLEuArR9iXdek/WkokQdhPP+wb+sqtJ57VXKQwDQk1Vw==
X-Received: by 2002:a17:90a:b307:b0:1bd:37f3:f0fc with SMTP id
 d7-20020a17090ab30700b001bd37f3f0fcmr187017pjr.132.1649965217386; 
 Thu, 14 Apr 2022 12:40:17 -0700 (PDT)
Received: from localhost.localdomain ([104.246.196.44])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a635c53000000b0039dc2ea9876sm2532969pgm.49.2022.04.14.12.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 12:40:17 -0700 (PDT)
From: Graeme Smecher <gsmecher@threespeedlogic.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 12:40:11 -0700
Message-Id: <20220414194011.2044427-1-gsmecher@threespeedlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Adds python-orjson support.
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
Cc: Graeme Smecher <gsmecher@threespeedlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/Config.in                        |  1 +
 package/python-orjson/Config.in          | 12 ++++++++++
 package/python-orjson/python-orjson.hash |  3 +++
 package/python-orjson/python-orjson.mk   | 28 ++++++++++++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 package/python-orjson/Config.in
 create mode 100644 package/python-orjson/python-orjson.hash
 create mode 100644 package/python-orjson/python-orjson.mk

diff --git a/package/Config.in b/package/Config.in
index 86a1c59696..db0e37b7f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1122,6 +1122,7 @@ menu "External python modules"
 	source "package/python-numpy/Config.in"
 	source "package/python-oauthlib/Config.in"
 	source "package/python-opcua-asyncio/Config.in"
+	source "package/python-orjson/Config.in"
 	source "package/python-packaging/Config.in"
 	source "package/python-paho-mqtt/Config.in"
 	source "package/python-pam/Config.in"
diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
new file mode 100644
index 0000000000..fa96eee57d
--- /dev/null
+++ b/package/python-orjson/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_ORJSON
+	bool "python-orjson"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	help
+	  orjson is a fast, correct JSON library for Python. It benchmarks as
+	  the fastest Python library for JSON and is more correct than the
+	  standard json library or other third-party libraries. It serializes
+	  dataclass, datetime, numpy, and UUID instances natively.
+
+	  https://github.com/ijl/orjson
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
new file mode 100644
index 0000000000..158099c174
--- /dev/null
+++ b/package/python-orjson/python-orjson.hash
@@ -0,0 +1,3 @@
+sha256  4713b120ad86b1b273f5952cbf9578c13d0f453064bd26d823e04a10c84824e6  3.6.7.tar.gz
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
+sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
new file mode 100644
index 0000000000..91ead3b170
--- /dev/null
+++ b/package/python-orjson/python-orjson.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# python-orjson
+#
+################################################################################
+
+PYTHON_ORJSON_VERSION = 3.6.7
+PYTHON_ORJSON_SOURCE = $(PYTHON_ORJSON_VERSION).tar.gz
+PYTHON_ORJSON_SITE = https://github.com/ijl/orjson/archive/refs/tags
+PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
+PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+PYTHON_ORJSON_DEPENDENCIES = host-python-cffi host-rustc
+PYTHON_ORJSON_CARGO_ENV = \
+	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
+
+# Vendor the Cargo crates at download time
+PYTHON_ORJSON_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_ORJSON_DOWNLOAD_DEPENDENCIES = host-rustc
+PYTHON_ORJSON_DL_ENV = BR_CARGO_MANIFEST_PATH=Cargo.toml
+
+# orjson uses "maturin" to generate distribution packages - rather than teach
+# buildroot how to understand this, we reach in and install directly.
+define PYTHON_ORJSON_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/liborjson.so \
+		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/orjson.so
+endef
+
+$(eval $(cargo-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
