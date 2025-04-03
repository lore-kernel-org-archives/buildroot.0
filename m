Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720F4C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44FF0615F7;
	Mon, 19 May 2025 10:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8I1JFpNPvk3O; Mon, 19 May 2025 10:46:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B6506137C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B6506137C;
	Mon, 19 May 2025 10:46:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F738D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8702840D7A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5t2fE1e1_XG for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B33E40D59
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B33E40D59
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 496DF83A2E; Mon, 19 May 2025 10:39:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Apr 2025 21:57:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8292b8fb89ba71d2b35d4596327b022741f18be4
X-Git-Newrev: 43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
X-Patchwork-Hint: ignore
Message-Id: <20250519103947.496DF83A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-smbus2: new
 package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43abcd4c7dd8ad65d2f2012f3d4292362550a3ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add python-smbus2 as an alternative for python-smbus-cffi as the latter
has not seen updates in 8 years and was archived on Jan 4 2024.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                        |  1 +
 package/python-smbus2/Config.in          |  7 +++++++
 package/python-smbus2/python-smbus2.hash |  5 +++++
 package/python-smbus2/python-smbus2.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index eb22c81d1d..291e784f26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1403,6 +1403,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbprotocol/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-smbus2/Config.in"
 	source "package/python-smmap2/Config.in"
 	source "package/python-snappy/Config.in"
 	source "package/python-sniffio/Config.in"
diff --git a/package/python-smbus2/Config.in b/package/python-smbus2/Config.in
new file mode 100644
index 0000000000..fdacae6da1
--- /dev/null
+++ b/package/python-smbus2/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_SMBUS2
+	bool "python-smbus2"
+	help
+	  smbus2 is a drop-in replacement for smbus-cffi/smbus-python
+	  in pure Python.
+
+	  https://github.com/kplindegaard/smbus2
diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
new file mode 100644
index 0000000000..65f9eefaf6
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/smbus2/json
+md5  5708a6cbf052f45a3ad6dd83c00902a6  smbus2-0.5.0.tar.gz
+sha256  4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035  smbus2-0.5.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
new file mode 100644
index 0000000000..c416a55005
--- /dev/null
+++ b/package/python-smbus2/python-smbus2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-smbus2
+#
+################################################################################
+
+PYTHON_SMBUS2_VERSION = 0.5.0
+PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/10/c9/6d85aa809e107adf85303010a59b340be109c8f815cbedc5c08c73bcffef
+PYTHON_SMBUS2_SETUP_TYPE = setuptools
+PYTHON_SMBUS2_LICENSE = MIT
+PYTHON_SMBUS2_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
