Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA195C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E5E415AC;
	Tue,  6 Feb 2024 15:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69E5E415AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfQmgLBc21J9; Tue,  6 Feb 2024 15:41:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CA7541597;
	Tue,  6 Feb 2024 15:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CA7541597
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40B191BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 193D741FC2
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 193D741FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aZsaYIWKFul for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:41:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFCE641FBA
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCE641FBA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEA7A870FF; Tue,  6 Feb 2024 15:41:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 16:39:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f8cd4499afa28b0757013781c7f0509a810092c
X-Git-Newrev: cbcdb086677e73a0f0b7ceb6919619c3712b60ee
X-Patchwork-Hint: ignore
Message-Id: <20240206154117.AEA7A870FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-semver: bump to version
 3.0.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cbcdb086677e73a0f0b7ceb6919619c3712b60ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-semver/Config.in          | 2 +-
 package/python-semver/python-semver.hash | 6 +++---
 package/python-semver/python-semver.mk   | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-semver/Config.in b/package/python-semver/Config.in
index 4af2bbf449..db83d8edc4 100644
--- a/package/python-semver/Config.in
+++ b/package/python-semver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_SEMVER
 	bool "python-semver"
 	help
-	  Python helper for Semantic Versioning (http://semver.org/).
+	  Python helper for Semantic Versioning (https://semver.org).
 
 	  https://github.com/python-semver/python-semver
diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 10cb0a8464..1e06167610 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  e98b5fb283ea84daa5195087de83ebf1  semver-2.13.0.tar.gz
-sha256  fa0fe2722ee1c3f57eac478820c3a5ae2f624af8264cbdf9000c980ff7f75e3f  semver-2.13.0.tar.gz
-# Locally computed
+md5  0bbc4d74959c9f1522f75ffb4ae0934d  semver-3.0.2.tar.gz
+sha256  6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc  semver-3.0.2.tar.gz
+# Locally computed sha256 checksums
 sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index d3a905754f..29d7ba46b1 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.13.0
+PYTHON_SEMVER_VERSION = 3.0.2
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/31/a9/b61190916030ee9af83de342e101f192bbb436c59be20a4cb0cdb7256ece
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/41/6c/a536cc008f38fd83b3c1b98ce19ead13b746b5588c9a0cb9dd9f6ea434bc
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
+PYTHON_SEMVER_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
