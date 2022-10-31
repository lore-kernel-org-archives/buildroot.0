Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98030ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 17:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 112CD60C14;
	Mon, 31 Oct 2022 17:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112CD60C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyn0f3aJYslF; Mon, 31 Oct 2022 17:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01DFC60BC1;
	Mon, 31 Oct 2022 17:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DFC60BC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 120D11BF327
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1A0E60BC1
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 17:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1A0E60BC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frT3lvLg92RI for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 17:31:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6D5660BA1
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6D5660BA1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 937578796F; Mon, 31 Oct 2022 17:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 18:31:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2b819d74465dc9720eeb8e5f18d789b5d2915f
X-Git-Newrev: 73890799ee14cba1ae650f19ec7a6e4fd2dd4086
X-Patchwork-Hint: ignore
Message-Id: <20221031173135.937578796F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-jsonrpc: bump to
 version 2.2.2
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
Content-Type: multipart/mixed; boundary="===============3445287187783527305=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3445287187783527305==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=73890799ee14cba1ae650f19ec7a6e4fd2dd4086
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch 0001 as it is not needed anymore:
https://github.com/cenobites/flask-jsonrpc/commit/2426b7f6fabeef9eb3a8dc6570e2fce33a30f98e

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Move-pytest-runner-to-tests_require.patch | 32 ----------------------
 .../python-flask-jsonrpc/python-flask-jsonrpc.hash |  4 +--
 .../python-flask-jsonrpc/python-flask-jsonrpc.mk   |  4 +--
 3 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch b/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
deleted file mode 100644
index 8b6712e601..0000000000
--- a/package/python-flask-jsonrpc/0001-Move-pytest-runner-to-tests_require.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8f07768085fa4c8d21dbe27805b7238e67d3aea5 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 17 May 2022 15:52:58 -0600
-Subject: [PATCH] Move pytest-runner to tests_require
-
-This isn't a build requirement so it shouldn't be under
-setup_requires.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/cenobites/flask-jsonrpc/pull/227]
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 197d6c9..f23c472 100755
---- a/setup.py
-+++ b/setup.py
-@@ -42,8 +42,8 @@ setuptools.setup(
-         'async': ['Flask[async]>=1.0.0,<3.0'],
-         'dotenv': ['Flask[dotenv]>=1.0.0,<3.0'],
-     },
--    setup_requires=['pytest-runner'],
-     tests_require=[
-+        'pytest-runner',
-         'mock==4.0.3',
-         'coverage==6.3.2;python_version>"3.6"',
-         'coverage<6.2;python_version<="3.6"',
--- 
-2.36.0
-
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index ee407dbd7a..d5c0e46595 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
-md5  f2b7bf5222f3aaf050f396522d7f692d  Flask-JSONRPC-2.2.1.tar.gz
-sha256  f994f8dd80bf31cf7272eb1a3030c6caf30fef3ced5866e66b56871d4047be68  Flask-JSONRPC-2.2.1.tar.gz
+md5  fb6205e6e776802c6000ea7119229066  Flask-JSONRPC-2.2.2.tar.gz
+sha256  0cb6ac2804980dc8ac7cbbc3149025f4ec9323227978a4a7ce7b55a9f8263a11  Flask-JSONRPC-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
 sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index 542b9e73f5..c816749085 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 2.2.1
+PYTHON_FLASK_JSONRPC_VERSION = 2.2.2
 PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/ca/2a/3f2bd79840d9643fc909cf27f730b2c5006351746ba09c4dab1b898ddee9
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/a5/7b/8cbd53084a1efb58a1105905a38b0cbefcd3ae13ef2c90c07eedf0fdb6dc
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
 PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
 PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools

--===============3445287187783527305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3445287187783527305==--
