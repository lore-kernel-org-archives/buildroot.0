Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80B9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 03:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79E1D4026F;
	Sun,  9 Jan 2022 03:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbGEIFWbrGmg; Sun,  9 Jan 2022 03:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63C99402DC;
	Sun,  9 Jan 2022 03:59:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DD3871BF20D
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE1B78174C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 03:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aOg4AzxFL3um for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 03:59:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D755381656
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 03:59:39 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id y18so12902770iob.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 19:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFJg3j+EkzrkBJ/fJWOxWSVibLxafzo2ryRCQzxjfPU=;
 b=V4g04Ur1wRn2JfbuuxyDZHAY430k2OJkEEaQHoe+hlwhAzmikoCI7layksLt0WcP0t
 /O3faGl4Voyk9ibewv7LlwUVAqdviq2KD45Gp/nMBsOZHOh/hfX1RZ8HPTkxna/hZYuD
 0NzqsxFOwjewWLY9iCcX1eMWbcDIcHde40gHyhBeIPSGPMO+vTXlnQlSWdWpoO/Ug25R
 /ekHR/dOwLXTj8OAn2wGmoTIL8GCx7tMnBzSYhjOnECZM3TiXDK4gxUdD6V3JImXlUNa
 8RwXQRag/LYK0fM5vq5Q53eTClI5Bnix9kmEL5YnfWFs4NPxG5awkTIcJeCWMadvUAtR
 tjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aFJg3j+EkzrkBJ/fJWOxWSVibLxafzo2ryRCQzxjfPU=;
 b=LqV7eoZumDZXvZw0Vy5sDdQfj3yYJa7pgyOfXE67omQg8WGXRfz2EyKNg7Jrq6PW+f
 Taz3re5OjvIJRYHtz8BO1WZLyHKc4GRMe+yxHvjpsvAbZWtI4EekOQO/MDT7a/c/IUiJ
 d3fJmv+aJ6V/CkyDtDkRn4Jugi6QWnri2z6LaEzkQsC7keshskeqiuPGaIi4tn8hOz6m
 K6UB8zYCl9hkbj1yCCNcGIGRoGG2fvjU2a7aBx4P/az1C/DqkuoTJL1mwI0CE1XZ7Aa9
 vItJ2qFSW1OcFMo8LCxpFPDtA1X+f85P6WO9HdGHR9yAVD0ERhWVZwWbmJpqVdPN5m+Z
 L38Q==
X-Gm-Message-State: AOAM5312Ne2SO/r4vq0goco+L21qYaQ+ifcm+ItJfUez3FYtGrDD7XSE
 ZsC/21b3KXAaiLDBHtc3sVP3ycTzCE8=
X-Google-Smtp-Source: ABdhPJwalPoCUZH7uboYOfLPVXgFfiwbkS486FkGeOIQ+n0WOdm9UlX+iekhHsrClaqgWZOqkQqu2Q==
X-Received: by 2002:a05:6638:6:: with SMTP id
 z6mr33062895jao.182.1641700778807; 
 Sat, 08 Jan 2022 19:59:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id m14sm2052014iov.14.2022.01.08.19.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 19:59:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 20:59:35 -0700
Message-Id: <20220109035935.2698421-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/python-argon2-cffi-bindings: new
 package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - rebase on master
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/python-argon2-cffi-bindings/Config.in | 11 ++++++++
 .../python-argon2-cffi-bindings.hash          |  5 ++++
 .../python-argon2-cffi-bindings.mk            | 25 +++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/python-argon2-cffi-bindings/Config.in
 create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
 create mode 100644 package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b544cae6b..c5186e029a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1291,6 +1291,7 @@ F:	package/python-aiorwlock/
 F:	package/python-aiosignal/
 F:	package/python-aiozipkin/
 F:	package/python-argon2-cffi/
+F:	package/python-argon2-cffi-bindings/
 F:	package/python-async-lru/
 F:	package/python-async-timeout/
 F:	package/python-bidict/
diff --git a/package/Config.in b/package/Config.in
index 378d6e8c0c..bc2113765b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -925,6 +925,7 @@ menu "External python modules"
 	source "package/python-ansicolors/Config.in"
 	source "package/python-argh/Config.in"
 	source "package/python-argon2-cffi/Config.in"
+	source "package/python-argon2-cffi-bindings/Config.in"
 	source "package/python-arrow/Config.in"
 	source "package/python-asgiref/Config.in"
 	source "package/python-asn1crypto/Config.in"
diff --git a/package/python-argon2-cffi-bindings/Config.in b/package/python-argon2-cffi-bindings/Config.in
new file mode 100644
index 0000000000..3d409759e0
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_ARGON2_CFFI_BINDINGS
+	bool "python-argon2-cffi-bindings"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU # libargon2
+	depends on !BR2_STATIC_LIBS # libargon2
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  Low-level CFFI bindings for Argon2.
+
+	  https://github.com/hynek/argon2-cffi-bindings
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
new file mode 100644
index 0000000000..e088d3dad1
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/argon2-cffi-bindings/json
+md5  f1591e1af7dea9ef3e5b982e2c196c1d  argon2-cffi-bindings-21.2.0.tar.gz
+sha256  bb89ceffa6c791807d1305ceb77dbfacc5aa499891d2c55661c6459651fc39e3  argon2-cffi-bindings-21.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  9c158d4f433627f48ac24b6b4d37970afe4172514673c5318014d7cca157c6df  LICENSE
diff --git a/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
new file mode 100644
index 0000000000..f0d71e803a
--- /dev/null
+++ b/package/python-argon2-cffi-bindings/python-argon2-cffi-bindings.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-argon2-cffi-bindings
+#
+################################################################################
+
+PYTHON_ARGON2_CFFI_BINDINGS_VERSION = 21.2.0
+PYTHON_ARGON2_CFFI_BINDINGS_SOURCE = argon2-cffi-bindings-$(PYTHON_ARGON2_CFFI_BINDINGS_VERSION).tar.gz
+PYTHON_ARGON2_CFFI_BINDINGS_SITE = https://files.pythonhosted.org/packages/b9/e9/184b8ccce6683b0aa2fbb7ba5683ea4b9c5763f1356347f1312c32e3c66e
+PYTHON_ARGON2_CFFI_BINDINGS_SETUP_TYPE = setuptools
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE = MIT
+PYTHON_ARGON2_CFFI_BINDINGS_LICENSE_FILES = LICENSE
+PYTHON_ARGON2_CFFI_BINDINGS_DEPENDENCIES = \
+	host-python-cffi \
+	host-python-setuptools-scm \
+	libargon2
+PYTHON_ARGON2_CFFI_BINDINGS_ENV = ARGON2_CFFI_USE_SYSTEM=1
+
+ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=1
+else
+PYTHON_ARGON2_CFFI_BINDINGS_ENV += ARGON2_CFFI_USE_SSE2=0
+endif
+
+$(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
