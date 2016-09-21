From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 21 Sep 2016 15:40:44 +0200
Subject: [Buildroot] [PATCH 2/2] python-daemon: add missing dependencies
In-Reply-To: <20160921134044.29040-1-yegorslists@googlemail.com>
References: <20160921134044.29040-1-yegorslists@googlemail.com>
Message-ID: <20160921134044.29040-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

python-daemon package mentions python-docutils in both setup_requires
and instal_requires fields. So add related dependencies.

Fixes:
http://autobuild.buildroot.net/results/0c3/0c3866038f7c40888e5e440f7a720fc614a6b1ba/
http://autobuild.buildroot.net/results/5d8/5d817bddeff5bb49ed31c6a1d111974c358ef96c/
and many more.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
2.9.3
