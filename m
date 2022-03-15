Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A04C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFFF402EE;
	Tue, 15 Mar 2022 21:18:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sqq1zdjlODXI; Tue, 15 Mar 2022 21:18:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 834D440256;
	Tue, 15 Mar 2022 21:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 63A051BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FE7160B83
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9R6n3VIz9Z6h for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A7F9960B02
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:18:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j17so410124wrc.0
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Su3ze0dL5ExBlCW3yHPeuFnp+mUagnaLxyjZo90QYok=;
 b=KI6/PGWRE3iqnUuhtEoSgzE1jCqARypvqmFxdVD/JpMWOgqnvGk9HbMPiUJ06Cs6Cu
 ykEAZhS4FeigOf0PGJ3A3y/Ww/MjyTYXCPls2vfwMj3W8t9pwzk2UuuCqxGoR8NjNqOU
 JVN/3hDeIpbLcCnDXI2z3cXYxf89/jz+bxXBoWMLX4e6eSm4U8XneBQcpFrk6XMyuaaz
 MuTjde2GB+XG0w4mHVv/fctIDn7tTNzaZizUKdGNdJGNhY3MpfRpi3X34OelH5rwcYPu
 /gmjU5+LXK5W/1Sq1MCapWqZa7S9cbD+uxUGPNZQie0fdYK4VEbh25ITwxY3PK8LZmzy
 E0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Su3ze0dL5ExBlCW3yHPeuFnp+mUagnaLxyjZo90QYok=;
 b=MZpH6EAyuRLTLfFJyAiuaxmv67z/LuAOOrDDQfXsCsDvCaPbERcF2DvOHikj0CsYwQ
 rVC0Hi4Ty1I9uHWg3c4UiBGdt3sFG6i0lBqiMqB6XpkVGYU4azHc145RGe80P0VN2c5w
 rXyT+d2nHVgF6y4ZxtBCSejLNALFoBss5rU08dNjTlylEXV7yrPJJSwJmAKW+yALwbb4
 NodnHL0Wif/JlswvK06xnf9elUAo4jvGNbDEPK7PFN8Rs4fGCt+8JpwotnRWK01ho4MF
 iewTVaVjYDsvRWUdAQAw4rw6Fwx+e1OE0fh/UWmeJF0hNh7CNgI+yyJtF5Jevqie/9zS
 93LA==
X-Gm-Message-State: AOAM532xrB+qWRpfWoxmZdxZChgM0cRwajXhROtA6tDTCHOHimu0bD64
 UMPRhFciUnW/udFoby24nssC4hsvVEI=
X-Google-Smtp-Source: ABdhPJw59s36aumopq4Wkyg64zyfmw/CGKnen0TgpLK2xbw93GBz9tI5ZmJcix8InVsW4a03Tijk/A==
X-Received: by 2002:adf:902c:0:b0:1f0:4a72:feff with SMTP id
 h41-20020adf902c000000b001f04a72feffmr22614489wrh.190.1647379083673; 
 Tue, 15 Mar 2022 14:18:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b001e6114938a8sm74393wrs.56.2022.03.15.14.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 14:18:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:16:53 +0100
Message-Id: <20220315211653.2297582-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315211653.2297582-1-fontaine.fabrice@gmail.com>
References: <20220315211653.2297582-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/{avro-c,
 python-avro}: bump to version 1.11.0
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop avro-c patch (already in version)
- Drop python-avro patch (not needed anymore)

https://github.com/apache/avro/releases/tag/release-1.11.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...d-failure-without-a-C-compiler-again.patch | 34 --------------
 package/avro-c/avro-c.hash                    |  4 +-
 package/avro-c/avro-c.mk                      |  2 +-
 ...all-time-linting-and-imports-sorting.patch | 46 -------------------
 package/python-avro/python-avro.hash          |  4 +-
 package/python-avro/python-avro.mk            |  5 +-
 6 files changed, 8 insertions(+), 87 deletions(-)
 delete mode 100644 package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
 delete mode 100644 package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch

diff --git a/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch b/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
deleted file mode 100644
index 8f7e59cf62..0000000000
--- a/package/avro-c/0001-cmake-Build-failure-without-a-C-compiler-again.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8f5633a29b083a84876c00b88fba6d3e8dbbf1a8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 19 Jul 2020 09:35:09 +0200
-Subject: [PATCH] cmake: Build failure without a C++ compiler (again)
-
-avro-c fails to build (again) without a C++ compiler because commit
-664c2fc7fba19709c1f974055f9cf4c8a799e108 reverted the change made by
-commit 414a51fdc1856083bb16851f09a4c61a48796132
-
-Fixes:
- - http://autobuild.buildroot.org/results/cfa91db53cf5502cbb6f902d1e7ad6397c8d70fd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://issues.apache.org/jira/browse/AVRO-2898]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c8d7aaf..aa923e18 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # under the License.
- #
- cmake_minimum_required(VERSION 3.1)
--project(AvroC)
-+project(AvroC C)
- enable_testing()
- 
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
--- 
-2.27.0
-
diff --git a/package/avro-c/avro-c.hash b/package/avro-c/avro-c.hash
index c4fd7d3f57..7a4a6f7aca 100644
--- a/package/avro-c/avro-c.hash
+++ b/package/avro-c/avro-c.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.10.0/c/avro-c-1.10.0.tar.gz.sha512
-sha512  2e64926b214fd996abf0553572ec6f46b312cf84df17149d1a7e89f4033b63cc34fabef62b98d727799a8a5d452ac9254e275bdea4bf894e9e1e4588bc5dfc9b  avro-c-1.10.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.0/c/avro-c-1.11.0.tar.gz.sha512
+sha512  5369ec11832e0ce1aa0181d594f657bae82ab5fb317ec1bee5ba190de9ed42956b425a5bf7e423940e8f871a54ae1246b92db2ce8562f270b4a05523ec4b60ae  avro-c-1.11.0.tar.gz
 
 # License files
 sha256  d62488d6ba17132e92c23c03c80bfedc848267f96ab36489fec860f76cf6819a  LICENSE
diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index ee6e864161..262a0fee5f 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AVRO_C_VERSION = 1.10.0
+AVRO_C_VERSION = 1.11.0
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
 AVRO_C_LICENSE_FILES = LICENSE
diff --git a/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch b/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
deleted file mode 100644
index 41231e923d..0000000000
--- a/package/python-avro/0001-drop-install-time-linting-and-imports-sorting.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3446a4af8474cd863efddeae7f3e5dd3f9b8e25e Mon Sep 17 00:00:00 2001
-From: Titouan Christophe <titouan.christophe@railnova.eu>
-Date: Mon, 17 Feb 2020 15:12:13 +0100
-Subject: [PATCH] drop install time linting and imports sorting
-
-Since the 1.9.2 release, the setup script is also performing code linting
-tasks, which require additional python libraries.
-
-These linting tasks are not needed anyway, since they are intended to prepare
-the code for distribution, but the Buildroot package is already using a
-distributed version. We therefore simply remove them.
-
-Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
----
- setup.cfg | 2 --
- setup.py  | 1 -
- 2 files changed, 3 deletions(-)
-
-diff --git a/setup.cfg b/setup.cfg
-index 7b5de18..d46a36e 100644
---- a/setup.cfg
-+++ b/setup.cfg
-@@ -25,8 +25,6 @@ package_dir =
- include_package_data = true
- packages = avro
- setup_requires = 
--	isort
--	pycodestyle
- install_requires = 
- zip_safe = true
- scripts = 
-diff --git a/setup.py b/setup.py
-index f6297bb..91d3287 100755
---- a/setup.py
-+++ b/setup.py
-@@ -164,7 +164,6 @@ def main():
-     setuptools.setup(cmdclass={
-         "clean": CleanCommand,
-         "generate_interop_data": GenerateInteropDataCommand,
--        "lint": LintCommand,
-     })
- 
- 
--- 
-2.24.1
-
diff --git a/package/python-avro/python-avro.hash b/package/python-avro/python-avro.hash
index 2428be96e5..d752fa8ae6 100644
--- a/package/python-avro/python-avro.hash
+++ b/package/python-avro/python-avro.hash
@@ -1,5 +1,5 @@
-# From https://downloads.apache.org/avro/avro-1.10.0/py3/avro-python3-1.10.0.tar.gz.sha512
-sha512  fb41f9227d2410c29cde10d7573aebbc142c2bf3f5945a1aaffdeac8b4b5ec690b0befdfc813a8762289dbbb7fc4e1be1564ba0c69d03092b84d8e938d6156f6  avro-python3-1.10.0.tar.gz
+# From https://downloads.apache.org/avro/avro-1.11.0/py/avro-1.11.0.tar.gz.sha512
+sha512  8af67deb33b9990b74ffd7ab5c3c55e13a649070b4623c7bbe2b278287fd0929e57ed6d0344f9e93f3eb79663b43f75891d0810812349dfaecce65fdd9b44e93  avro-1.11.0.tar.gz
 
 # License files
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  avro/LICENSE
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index dd6008b1ba..0c4c431777 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -5,8 +5,9 @@
 ################################################################################
 
 PYTHON_AVRO_VERSION = $(AVRO_C_VERSION)
-PYTHON_AVRO_SITE = https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py3
-PYTHON_AVRO_SOURCE = avro-python3-$(PYTHON_AVRO_VERSION).tar.gz
+PYTHON_AVRO_SITE = \
+	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
+PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
 PYTHON_AVRO_LICENSE = Apache-2.0
 PYTHON_AVRO_LICENSE_FILES = avro/LICENSE
 PYTHON_AVRO_SETUP_TYPE = setuptools
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
