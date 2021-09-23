Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5C7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6CC1603E9
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6CC1603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E93760B25;
	Thu, 23 Sep 2021 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQcr4ijR9uAo; Thu, 23 Sep 2021 20:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 936CC60AC5;
	Thu, 23 Sep 2021 20:16:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8BED1BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9536E40019
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:16:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoM_YuRusCBG for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A214401A4
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id F00E48CAA4; Thu, 23 Sep 2021 20:13:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 21:59:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6ee07f41a2b11b8dedbd3fc19ceef2870ecc93a
X-Git-Newrev: 0132f4748c8ab9596057b3fa217ae3621800dd79
X-Patchwork-Hint: ignore
Message-Id: <20210923201359.F00E48CAA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0132f4748c8ab9596057b3fa217ae3621800dd79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The files added by this commit are associated both to Nicolas Carrier
and myself in the DEVELOPERS, as this commit is based on initial work
from Nicolas.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  6 ++++++
 package/Config.in                                  |  1 +
 package/python-git/Config.in                       | 13 +++++++++++++
 package/python-git/python-git.hash                 |  3 +++
 package/python-git/python-git.mk                   | 13 +++++++++++++
 support/testing/tests/package/sample_python_git.py |  1 +
 support/testing/tests/package/test_python_git.py   | 11 +++++++++++
 7 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6ffe20426b..fb211830a8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1983,12 +1983,15 @@ F:	package/bmap-tools/
 F:	package/php-xdebug/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
+F:	package/python-git/
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
+F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/test_bmap_tools.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
+F:	support/testing/tests/package/test_python_git.py
 
 N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 F:	package/libgit2/
@@ -2686,6 +2689,7 @@ F:	package/python/
 F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
+F:	package/python-git/
 F:	package/python-mad/
 F:	package/python-serial/
 F:	package/qextserialport/
@@ -2702,9 +2706,11 @@ F:	support/testing/tests/boot/test_syslinux.py
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
+F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/test_python_augeas.py
 F:	support/testing/tests/package/test_python_flask.py
 F:	support/testing/tests/package/test_python_flask_expects_json.py
+F:	support/testing/tests/package/test_python_git.py
 F:	toolchain/
 
 N:	Timo Ketola <timo.ketola@exertus.fi>
diff --git a/package/Config.in b/package/Config.in
index c334fa5b67..3136fcc65f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1010,6 +1010,7 @@ menu "External python modules"
 	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
 	source "package/python-futures/Config.in"
+	source "package/python-git/Config.in"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gobject/Config.in"
 	source "package/python-gpiozero/Config.in"
diff --git a/package/python-git/Config.in b/package/python-git/Config.in
new file mode 100644
index 0000000000..b8dbc3a6c1
--- /dev/null
+++ b/package/python-git/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_GIT
+	bool "python-git"
+	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU # git
+	select BR2_PACKAGE_GIT # runtime
+	select BR2_PACKAGE_PYTHON_GITDB2 # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  GitPython is a python library used to interact with git
+	  repositories, high-level like git-porcelain, or low-level
+	  like git-plumbing.
+
+	  https://github.com/gitpython-developers/GitPython
diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
new file mode 100644
index 0000000000..db3d743857
--- /dev/null
+++ b/package/python-git/python-git.hash
@@ -0,0 +1,3 @@
+# locally computed hashes
+sha256  78baf9fc223536e38a6e0d9241536fedaecf79bc000b3a05962257d83571fc5d  python-git-3.1.20.tar.gz
+sha256  fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
new file mode 100644
index 0000000000..0e158434fd
--- /dev/null
+++ b/package/python-git/python-git.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-git
+#
+################################################################################
+
+PYTHON_GIT_VERSION = 3.1.20
+PYTHON_GIT_SITE = $(call github,gitpython-developers,GitPython,$(PYTHON_GIT_VERSION))
+PYTHON_GIT_LICENSE = BSD-3-Clause
+PYTHON_GIT_LICENSE_FILES = LICENSE
+PYTHON_GIT_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
diff --git a/support/testing/tests/package/sample_python_git.py b/support/testing/tests/package/sample_python_git.py
new file mode 100644
index 0000000000..fa9ff23039
--- /dev/null
+++ b/support/testing/tests/package/sample_python_git.py
@@ -0,0 +1 @@
+from git import *  # noqa
diff --git a/support/testing/tests/package/test_python_git.py b/support/testing/tests/package/test_python_git.py
new file mode 100644
index 0000000000..4d5489e974
--- /dev/null
+++ b/support/testing/tests/package/test_python_git.py
@@ -0,0 +1,11 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Git(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_GIT=y
+        """
+    sample_scripts = ["tests/package/sample_python_git.py"]
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
