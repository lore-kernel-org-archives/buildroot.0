Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 22:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F4D81446;
	Mon,  9 May 2022 22:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ga3YS0576sq8; Mon,  9 May 2022 22:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D980281386;
	Mon,  9 May 2022 22:11:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 501ED1BF36B
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E7F381386
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 22:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNMWkqtZp4PB for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 22:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE1048137A
 for <buildroot@buildroot.org>; Mon,  9 May 2022 22:11:15 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r1so16700960oie.4
 for <buildroot@buildroot.org>; Mon, 09 May 2022 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o1Z+6B3bL/5PICLsmE0ReA+jzGMJhKtyDCNF4v2QBY=;
 b=RkYqBKCjzvhPHEtIuaUhNLzHTszcx8SsAnoyqlfifsr7sDbWceu2zOB+t5iRmLvdEK
 e+6eKM+7vs2mcvISUxNkyVX1aTCWTD4A+5pide+TUmO3hXYdSjirVgGFYZEZsAMmq4jK
 6I2VXfT6tpfUM+TTA9aIcSj8H2OusIkOmowWfxxto64szXhtqrm62PGxVKID7ubNEQJt
 EUsNWQtoI03bsMaruwH+I3NUPkqwIRU0FY4wNMbHSnCmCzjqlnrRJltwcGwA2N+C8gdV
 ITFARbQg77FYm/N+W+qXIzwXqDZNNowznCSv1QYv4NCx5AObVbFWlPPiKqkaU7kkqZ7W
 gUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6o1Z+6B3bL/5PICLsmE0ReA+jzGMJhKtyDCNF4v2QBY=;
 b=CrypdMlwEy31NfFSuPP9d81GTCS1N1+kvYexUWDepcEI4/C8KsD0sD8HZCOme2BRba
 PHreSjkCav+ie3B1qaAlP/+lk1Ur3ZwpmpLdK16tV69zMlNG5NpkoZ+D/sg97Z9CJESH
 oCZVI2p71P7+5A8Ra5mpQRfDE2YLPigpEpZArY7Yx4GGLHsew6VSyF2o0gp6c78uR3Yw
 USTCXPT7OQEzy0iP0CZ4xxi+Mr4KwXxfQs987jtKTaw0DLNdjsn3H9Sh2DNqAmSXJ5HY
 6dAvA+i1Av6w74W/E8AzQSHVxHE4Aa8CojPW4CovAWIrLs3x1wfrRwulPT6XFgZ4pEGZ
 0Ilg==
X-Gm-Message-State: AOAM531mtvKpbLGJfQPkXVV/ltutphnySPYOmrQzCm4jn36b1ieed5SV
 +KWbbskn7XTsYKvM8Oni3oZRiv/Qfu0=
X-Google-Smtp-Source: ABdhPJxFrcd3gPLgV7F77hV/U2uNqMHLuCX54EnR0UIBB5M9LnIohyjPWft0b+ZlN5LbnCuNKpxhiQ==
X-Received: by 2002:a05:6808:1250:b0:2da:39df:1f92 with SMTP id
 o16-20020a056808125000b002da39df1f92mr12185638oiv.27.1652134274683; 
 Mon, 09 May 2022 15:11:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-126-237.hlrn.qwest.net.
 [71.218.126.237]) by smtp.gmail.com with ESMTPSA id
 c22-20020a544e96000000b00325cda1ff96sm4812077oiy.21.2022.05.09.15.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:11:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 16:10:54 -0600
Message-Id: <20220509221055.335263-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-maturin: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is pep517 pyo3 build backend that's an alternative to
python-setuptools-rust.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-Fix-invalid-pyproject.toml.patch     | 62 +++++++++++++++++++
 package/python-maturin/python-maturin.hash    |  5 ++
 package/python-maturin/python-maturin.mk      | 20 ++++++
 3 files changed, 87 insertions(+)
 create mode 100644 package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
 create mode 100644 package/python-maturin/python-maturin.hash
 create mode 100644 package/python-maturin/python-maturin.mk

diff --git a/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
new file mode 100644
index 0000000000..7d227fea18
--- /dev/null
+++ b/package/python-maturin/0001-Fix-invalid-pyproject.toml.patch
@@ -0,0 +1,62 @@
+From 9ad69941d02e494d45ee67f3bcccc83c0bb4cdcd Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 9 May 2022 14:37:36 -0600
+Subject: [PATCH] Fix invalid pyproject.toml
+
+These attributes should be marked dynamic.
+
+Fixes:
+configuration error: `project` must contain ['version'] properties
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`description = 'Build and publish crates with pyo3, rust-cpython and cffi bindings as well as rust binaries as python packages'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'description' is listed as `dynamic`.
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`license = 'MIT OR Apache-2.0'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'license' is listed as `dynamic`.
+
+Fixes:
+The following seems to be defined outside of `pyproject.toml`:
+
+`authors = 'konstin'`
+
+According to the spec (see the link bellow), however, setuptools CANNOT
+consider this value unless 'authors' is listed as `dynamic`.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/PyO3/maturin/pull/908]
+---
+ pyproject.toml | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 207ceb7..329faae 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -13,6 +13,13 @@ classifiers = [
+     "Programming Language :: Python :: Implementation :: PyPy",
+ ]
+ dependencies = ["tomli>=1.1.0 ; python_version<'3.11'"]
++dynamic = [
++    "authors",
++    "description",
++    "license",
++    "readme",
++    "version"
++]
+ 
+ [project.optional-dependencies]
+ zig = [
+-- 
+2.25.1
+
diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
new file mode 100644
index 0000000000..e9ba83e78e
--- /dev/null
+++ b/package/python-maturin/python-maturin.hash
@@ -0,0 +1,5 @@
+# Locally calculated after vendoring
+sha256  092db51dfd1479e3abfc8eef4b109b6ab504481959e383090827e2024f09aab3  maturin-0.12.15.tar.gz
+# Locally computed sha256 checksums
+sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
+sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
new file mode 100644
index 0000000000..f6daabc008
--- /dev/null
+++ b/package/python-maturin/python-maturin.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-maturin
+#
+################################################################################
+
+PYTHON_MATURIN_VERSION = 0.12.15
+PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/30/4d/b8a32e0bd711f7905fa8f10487be7dbf9992c5b5b3bfa8734abf2487d967
+PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
+PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
+HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli host-rustc
+HOST_PYTHON_MATURIN_ENV = $(HOST_PKG_CARGO_ENV)
+# We need to vendor the Cargo crates at download time
+PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
+PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
+HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
