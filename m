Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276ED3177F
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 18:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DA29408D5;
	Tue,  5 Nov 2024 18:26:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWHkWNHiEsvK; Tue,  5 Nov 2024 18:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C29BE408D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C29BE408D8;
	Tue,  5 Nov 2024 18:26:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58F033B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46D1780F93
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:26:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-1II-i_Ya-w for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 18:26:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5ECD480F65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5ECD480F65
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5ECD480F65
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 18:26:51 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83abf71f244so195065639f.1
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 10:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730831210; x=1731436010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNBiokoQiPSrAoSeKOF5Cw3tTcJ1jZeB/X9M4GwIQfk=;
 b=DGTS2miGywz7t5+PicrnYqMuXObJB4q9waexZuzmRTo3BxpaykMNrJZCaEmUdX715w
 PD98fVtYlD++lXu19zWLG0AAWPUj93Pgt0Lyh4rag8Ep15jIa7TizJArJpj1G+z/YJH9
 G9QnhL9/epNbjiVii2q4IS2S00JG1dk5B8P2iU6SGh/sSTfvwUhL6D7uCI5J+IuOk2Yn
 t5jlJwwix4KHi8z3gXStRjXt7/zDaUzfLzmyHVt9MEJ5UTfHEEjyt3bt2a5io+2d4EJA
 fXczpVUgtpnTVt/S35EL21sQmRQIy8awBO4zfkePuzFYHSYcdGkFNe/GcRfN/rbSKJ7O
 A0Ig==
X-Gm-Message-State: AOJu0Yxzd8N17khsoZXEkK+anQIJw3M7UIVOx4TxpHuYFiNJQM5ay2N3
 X9m3QTe3ILe10ZCYzlFCOf/lQdB5fJKqv5h1ldbfFe1XYEN/dMEmLse18g==
X-Google-Smtp-Source: AGHT+IGmSxtwKWit7V/NVF6txmmHKMOFnnSzduT+y3P1iqyWsV89CozJiOHJnXXvrSkOY8YnQGa9lg==
X-Received: by 2002:a05:6602:6c12:b0:803:5e55:ecb2 with SMTP id
 ca18e2360f4ac-83b64d8d7d0mr2358434539f.0.1730831210029; 
 Tue, 05 Nov 2024 10:26:50 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049a43efsm2523811173.128.2024.11.05.10.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 10:26:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 11:26:47 -0700
Message-Id: <20241105182647.1428325-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730831210; x=1731436010; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hNBiokoQiPSrAoSeKOF5Cw3tTcJ1jZeB/X9M4GwIQfk=;
 b=Q8Bkt7MwgbKTHQeYFx2ylYcETgz3c5f4EtcuFPHdwB84U8cC/y14HljjPKcHfpbJmU
 sozfGETB1u7u5Noceg2UPwxWEwirdH18vQG+A4pZZta8KamZ9PfWggb8X2ImFvtDuv+I
 4PMp7gmGhgQ/ajaQ/liZQFLxKSxhF0AH5GPzEyVg4G+o48pbe8MbLTNYiBANoQwfeP3A
 GPRot39S+10H/HHUgJvUAqtlNwMD055UJjOygECNJuu7KtevC39qrTcyb76t2myG9B2o
 pXCphVpZXqNJyt5fR/e6C5cIoOcgFpCy0NLbTRyYHz6OyXIKgJF+LjHrhcZuqfUl5lW8
 z44Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q8Bkt7Mw
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required patch which is now upstream.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .checkpackageignore                           |  1 -
 ...Fix-flit_core-build-requires-backend.patch | 32 -------------------
 package/python-aiohttp-remotes/Config.in      |  1 +
 .../python-aiohttp-remotes.hash               |  4 +--
 .../python-aiohttp-remotes.mk                 |  4 +--
 5 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index eceea28f0c..6c58046058 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1050,7 +1050,6 @@ package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.pat
 package/pulseaudio/S50pulseaudio lib_sysv.ConsecutiveEmptyLines lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch lib_patch.Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch lib_patch.Upstream
-package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch lib_patch.Upstream
 package/python-pybind/0001-pybind11-commands.py-support-STAGING_DIR.patch lib_patch.Upstream
 package/python-pylibftdi/0001-do-not-use-find-library.patch lib_patch.Upstream
 package/python-pyqt5/0001-configure-skip-qtdetail.patch lib_patch.Upstream
diff --git a/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
deleted file mode 100644
index cf940eaf87..0000000000
--- a/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3d39ee9a03a1c96b8e798dc6acf98165da31da1f Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 11 Mar 2022 12:59:53 -0700
-Subject: [PATCH] Fix flit_core build requires/backend.
-
-Only flit_core should be required by pyproject.toml, the regular flit
-package is the pep517 frontend which is not what should be set for the
-build system.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/aio-libs/aiohttp-remotes/pull/355]
----
- pyproject.toml     | 4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 214d64d..8c6b882 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
--requires=["flit"]
--build-backend="flit.buildapi"
-+requires=["flit_core"]
-+build-backend="flit_core.buildapi"
- 
- [tool.flit.metadata]
- module="aiohttp_remotes"
--- 
-2.38.1
-
diff --git a/package/python-aiohttp-remotes/Config.in b/package/python-aiohttp-remotes/Config.in
index 7208e373ad..a5dc89fc9b 100644
--- a/package/python-aiohttp-remotes/Config.in
+++ b/package/python-aiohttp-remotes/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_AIOHTTP_REMOTES
 	bool "python-aiohttp-remotes"
 	select BR2_PACKAGE_PYTHON_AIOHTTP # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Control remote side information.
 
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index 51c5cf08b4..11d2b10c7c 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5  c46a71df656e7f1e111684ced68a85d0  aiohttp_remotes-1.2.0.tar.gz
-sha256  f95c3a6be5e2de746a85ce9af49ec548da6db8378d7e81bb171ec77b13562a6c  aiohttp_remotes-1.2.0.tar.gz
+md5  7f47c08e21ceb4fd7b9d5072130240d7  aiohttp_remotes-1.3.0.tar.gz
+sha256  4f8b95b02ed9126cf8f5f5a8f5e55c1b2d10fc5e7e7d421c172f9c7cd0719092  aiohttp_remotes-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index e0ec789f41..0c3de29e4f 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 1.2.0
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.3.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/54/05/7c4be6171cc78a13171a4f89e5d308c4a636bdd8ee36101367e99e410ed8
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/7e/bd/b59c3f8858c3b333b067e2432db95400f1423d7ee6eadfbf4e99a3a30fa3
 PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = flit
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
