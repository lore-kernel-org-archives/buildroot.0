Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E557C3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 824D070E7C;
	Mon, 19 May 2025 11:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OapOOY6cBXv; Mon, 19 May 2025 11:01:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAEE70E90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAEE70E90;
	Mon, 19 May 2025 11:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52505E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4D341061
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUUygxczLLCk for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D9B540D8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D9B540D8A
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BF7E82A2E; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:55:03 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c6924b23315d8964d5e3fd6bea99eae90294b507
X-Git-Newrev: 218a17dbc4ea320304d35d74c773cc319ec3dda9
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.3BF7E82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-mypy: new
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=218a17dbc4ea320304d35d74c773cc319ec3dda9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/Config.in                    |  1 +
 package/python-mypy/Config.in        |  8 ++++++++
 package/python-mypy/python-mypy.hash |  5 +++++
 package/python-mypy/python-mypy.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2991b47548..86e05fb724 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1247,6 +1247,7 @@ menu "External python modules"
 	source "package/python-mwclient/Config.in"
 	source "package/python-mwscrape/Config.in"
 	source "package/python-mwscrape2slob/Config.in"
+	source "package/python-mypy/Config.in"
 	source "package/python-mypy-extensions/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
diff --git a/package/python-mypy/Config.in b/package/python-mypy/Config.in
new file mode 100644
index 0000000000..38ea7dc30f
--- /dev/null
+++ b/package/python-mypy/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_MYPY
+	bool "python-mypy"
+	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  Optional static typing for Python.
+
+	  https://www.mypy-lang.org/
diff --git a/package/python-mypy/python-mypy.hash b/package/python-mypy/python-mypy.hash
new file mode 100644
index 0000000000..21b2c9aba0
--- /dev/null
+++ b/package/python-mypy/python-mypy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/mypy/json
+md5  8297bf7865feffd704735f0fdb5a4150  mypy-1.14.1.tar.gz
+sha256  7ec88144fe9b510e8475ec2f5f251992690fcf89ccb4500b214b4226abcd32d6  mypy-1.14.1.tar.gz
+# Locally computed sha256 checksums
+sha256  de341f6e031d021aab9eb27bdf713cc6fb844dee832ef3bcd4688bff5517220b  LICENSE
diff --git a/package/python-mypy/python-mypy.mk b/package/python-mypy/python-mypy.mk
new file mode 100644
index 0000000000..26614b2948
--- /dev/null
+++ b/package/python-mypy/python-mypy.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# python-mypy
+#
+################################################################################
+
+PYTHON_MYPY_VERSION = 1.14.1
+PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
+PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/b9/eb/2c92d8ea1e684440f54fa49ac5d9a5f19967b7b472a281f419e69a8d228e
+PYTHON_MYPY_SETUP_TYPE = setuptools
+PYTHON_MYPY_LICENSE = Apache-2.0, Python-2.0.1
+PYTHON_MYPY_LICENSE_FILES = LICENSE
+PYTHON_MYPY_DEPENDENCIES = \
+	host-python-mypy-extensions \
+	host-python-types-psutil \
+	host-python-types-setuptools \
+	host-python-typing-extensions
+HOST_PYTHON_MYPY_DEPENDENCIES = \
+	host-python-mypy-extensions \
+	host-python-types-psutil \
+	host-python-types-setuptools \
+	host-python-typing-extensions
+
+$(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
