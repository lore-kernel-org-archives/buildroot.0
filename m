Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA44FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:46:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BB3611C8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45BB3611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20D7B60773;
	Sun, 19 Sep 2021 12:46:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KqOuLoZVDlD; Sun, 19 Sep 2021 12:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624C760765;
	Sun, 19 Sep 2021 12:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D68191BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C59BA60729
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw6rvng1AO7w for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:45:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CFC7606AF
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:45:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 420FBC0004;
 Sun, 19 Sep 2021 12:45:25 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sun, 19 Sep 2021 14:45:17 +0200
Message-Id: <20210919124517.524402-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
References: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/4] package/python-git: new package
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
Cc: Jeremy Connat <Jeremy.Connat@orolia.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

The files added by this commit are associated both to Nicolas Carrier
and myself in the DEVELOPERS, as this commit is based on initial work
from Nicolas.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  6 ++++++
 package/Config.in                                  |  1 +
 package/python-git/Config.in                       | 13 +++++++++++++
 package/python-git/python-git.hash                 |  3 +++
 package/python-git/python-git.mk                   | 13 +++++++++++++
 support/testing/tests/package/sample_python_git.py |  1 +
 support/testing/tests/package/test_python_git.py   | 11 +++++++++++
 7 files changed, 48 insertions(+)
 create mode 100644 package/python-git/Config.in
 create mode 100644 package/python-git/python-git.hash
 create mode 100644 package/python-git/python-git.mk
 create mode 100644 support/testing/tests/package/sample_python_git.py
 create mode 100644 support/testing/tests/package/test_python_git.py

diff --git a/DEVELOPERS b/DEVELOPERS
index ee5ec1d0ef..db7521b578 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1982,12 +1982,15 @@ F:	package/bmap-tools/
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
@@ -2685,6 +2688,7 @@ F:	package/python/
 F:	package/python3/
 F:	package/python-augeas/
 F:	package/python-flask-expects-json/
+F:	package/python-git/
 F:	package/python-mad/
 F:	package/python-serial/
 F:	package/qextserialport/
@@ -2701,9 +2705,11 @@ F:	support/testing/tests/boot/test_syslinux.py
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
index 0e80611cb6..785ba992e3 100644
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
index 0000000000..5a75bc3592
--- /dev/null
+++ b/package/python-git/python-git.hash
@@ -0,0 +1,3 @@
+# locally computed hashes
+sha256	78baf9fc223536e38a6e0d9241536fedaecf79bc000b3a05962257d83571fc5d  python-git-3.1.20.tar.gz
+sha256	fd657ffc2cef63d25c78cab7808d414dd03a282e63893491fd11c32f98be67fb  LICENSE
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
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
