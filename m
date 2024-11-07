Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D3D5AE70
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAAE5409BA;
	Thu,  7 Nov 2024 08:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrdLlqkjQFOu; Thu,  7 Nov 2024 08:02:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36DFE409DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36DFE409DD;
	Thu,  7 Nov 2024 08:02:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12557C0
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFBFB41C73
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCO7x5ovJ-Fk for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D9FA41C89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D9FA41C89
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6991A85C6A; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:55:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9b76f80c58472f17033689137a97cd76f5ee8c3
X-Git-Newrev: ea249581e49426152f2ca93ba1be8e74c77ed013
X-Patchwork-Hint: ignore
Message-Id: <20241107080153.6991A85C6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp-remotes: bump to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ea249581e49426152f2ca93ba1be8e74c77ed013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required patch which is now upstream.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...0001-Fix-flit_core-build-requires-backend.patch | 32 ----------------------
 package/python-aiohttp-remotes/Config.in           |  1 +
 .../python-aiohttp-remotes.hash                    |  4 +--
 .../python-aiohttp-remotes.mk                      |  4 +--
 5 files changed, 5 insertions(+), 37 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 48c406270c..ee075f4cb2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1049,7 +1049,6 @@ package/pulseaudio/0001-shm.c-use-_Static_assert-instead-of-static_assert-fo.pat
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
