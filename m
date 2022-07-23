Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE491C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6884842473;
	Sat, 23 Jul 2022 19:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6884842473
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXxn4-zMGs4h; Sat, 23 Jul 2022 19:10:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6C5A4246C;
	Sat, 23 Jul 2022 19:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C5A4246C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A30591BF957
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DE5860E62
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE5860E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Jv2JJdBQvJo for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7131606C0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7131606C0
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 36F938447B; Sat, 23 Jul 2022 18:56:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:09:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e55c3a917bd31e2d53e6a91d0b8e6861d0870b49
X-Git-Newrev: b8dbcf8c8fa8e532b2d73525f5b7e826022ccc3c
X-Patchwork-Hint: ignore
Message-Id: <20220723185616.36F938447B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-jsonrpc: bump to
 version 2.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b8dbcf8c8fa8e532b2d73525f5b7e826022ccc3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-typeguard and python-typing-inspect runtime
dependencies.

Add a patch to remove invalid setup_requires.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Move-pytest-runner-to-tests_require.patch | 32 ++++++++++++++++++++++
 package/python-flask-jsonrpc/Config.in             |  5 ++--
 .../python-flask-jsonrpc/python-flask-jsonrpc.hash | 11 ++++----
 .../python-flask-jsonrpc/python-flask-jsonrpc.mk   |  6 ++--
 4 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch b/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
new file mode 100644
index 0000000000..8b6712e601
--- /dev/null
+++ b/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
@@ -0,0 +1,32 @@
+From 8f07768085fa4c8d21dbe27805b7238e67d3aea5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 17 May 2022 15:52:58 -0600
+Subject: [PATCH] Move pytest-runner to tests_require
+
+This isn't a build requirement so it shouldn't be under
+setup_requires.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/cenobites/flask-jsonrpc/pull/227]
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 197d6c9..f23c472 100755
+--- a/setup.py
++++ b/setup.py
+@@ -42,8 +42,8 @@ setuptools.setup(
+         'async': ['Flask[async]>=1.0.0,<3.0'],
+         'dotenv': ['Flask[dotenv]>=1.0.0,<3.0'],
+     },
+-    setup_requires=['pytest-runner'],
+     tests_require=[
++        'pytest-runner',
+         'mock==4.0.3',
+         'coverage==6.3.2;python_version>"3.6"',
+         'coverage<6.2;python_version<="3.6"',
+-- 
+2.36.0
+
diff --git a/package/python-flask-jsonrpc/Config.in b/package/python-flask-jsonrpc/Config.in
index c8ecd854b3..024fbc4b85 100644
--- a/package/python-flask-jsonrpc/Config.in
+++ b/package/python-flask-jsonrpc/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_FLASK_JSONRPC
 	bool "python-flask-jsonrpc"
-	# runtime dependency
-	select BR2_PACKAGE_PYTHON_FLASK
+	select BR2_PACKAGE_PYTHON_FLASK # runtime
+	select BR2_PACKAGE_PYTHON_TYPEGUARD # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECT # runtime
 	help
 	  A basic JSON-RPC implementation for your Flask-powered sites.
 
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index 4204f59dd5..ee407dbd7a 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,5 +1,6 @@
-# md5 from https://pypi.python.org/pypi/flask-jsonrpc/json
-md5	5c0592f53b2f18e34d5be435acee8842  Flask-JSONRPC-0.3.1.tar.gz
-# Locally computed
-sha256	4d0cc9c20874093306af91f5a48009fb8659a041428dcdb11703598ffbbc97d0  Flask-JSONRPC-0.3.1.tar.gz
-sha256  f613b06cbe766fd514b1b619a71a12c353cccaa55fa4f547be55563d9829be6f  setup.py
+# md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
+md5  f2b7bf5222f3aaf050f396522d7f692d  Flask-JSONRPC-2.2.1.tar.gz
+sha256  f994f8dd80bf31cf7272eb1a3030c6caf30fef3ced5866e66b56871d4047be68  Flask-JSONRPC-2.2.1.tar.gz
+# Locally computed sha256 checksums
+sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
+sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index dbb37c373c..542b9e73f5 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 0.3.1
+PYTHON_FLASK_JSONRPC_VERSION = 2.2.1
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://pypi.python.org/packages/cb/1f/e6d66e8498609ba04bac76155b2ea884df95531e93501bf4ef009d40a83c
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/ca/2a/3f2bd79840d9643fc909cf27f730b2c5006351746ba09c4dab1b898ddee9
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
-PYTHON_FLASK_JSONRPC_LICENSE_FILES = setup.py
+PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
