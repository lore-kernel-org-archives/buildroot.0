From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 20:51:38 +0200
Subject: [Buildroot] [git commit] python-daemon: add missing dependencies
Message-ID: <20160921185148.14C71802D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9953d5e3110b5915d155a606ba38538c68f2161f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-daemon package mentions python-docutils in both setup_requires
and instal_requires fields. So add related dependencies.

Fixes:
http://autobuild.buildroot.net/results/0c3/0c3866038f7c40888e5e440f7a720fc614a6b1ba/
http://autobuild.buildroot.net/results/5d8/5d817bddeff5bb49ed31c6a1d111974c358ef96c/
and many more.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-daemon/Config.in        | 1 +
 package/python-daemon/python-daemon.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-daemon/Config.in b/package/python-daemon/Config.in
index 8b6dcc0..21f4407 100644
--- a/package/python-daemon/Config.in
+++ b/package/python-daemon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DAEMON
 	bool "python-daemon"
+	select BR2_PACKAGE_PYTHON_DOCUTILS # runtime
 	help
 	  Library to implement a well-behaved Unix daemon process.
 
diff --git a/package/python-daemon/python-daemon.mk b/package/python-daemon/python-daemon.mk
index e85be9a..648d549 100644
--- a/package/python-daemon/python-daemon.mk
+++ b/package/python-daemon/python-daemon.mk
@@ -9,5 +9,6 @@ PYTHON_DAEMON_SITE = https://pypi.python.org/packages/source/p/python-daemon
 PYTHON_DAEMON_LICENSE = Apache-2.0 (library), GPLv3+ (test, build)
 PYTHON_DAEMON_LICENSE_FILES = LICENSE.ASF-2 LICENSE.GPL-3
 PYTHON_DAEMON_SETUP_TYPE = setuptools
+PYTHON_DAEMON_DEPENDENCIES = host-python-docutils
 
 $(eval $(python-package))
