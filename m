From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:36 +0530
Subject: [Buildroot] [PATCH 07/21] package: use SPDX short identifier for
	AGPLv3
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-8-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for AGPLv3 is AGPL-3.0.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/AGPLv3/AGPL-3.0/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/ghostscript/ghostscript.mk         | 2 +-
 package/mongodb/mongodb.mk                 | 2 +-
 package/monit/monit.mk                     | 2 +-
 package/python-crossbar/python-crossbar.mk | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 265503e..c28cd06 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -7,7 +7,7 @@
 GHOSTSCRIPT_VERSION = 9.21
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
-GHOSTSCRIPT_LICENSE = AGPLv3
+GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
 # 0001-Fix-cross-compilation-issue.patch
 GHOSTSCRIPT_AUTORECONF = YES
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index f5b2c01..54c904e 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -8,7 +8,7 @@ MONGODB_VERSION_BASE = 3.3.4
 MONGODB_VERSION = r$(MONGODB_VERSION_BASE)
 MONGODB_SITE = $(call github,mongodb,mongo,$(MONGODB_VERSION))
 
-MONGODB_LICENSE = AGPLv3, Apache-2.0
+MONGODB_LICENSE = AGPL-3.0, Apache-2.0
 MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
 
 MONGODB_DEPENDENCIES = host-scons
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index f4899c3..dc202fd 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -6,7 +6,7 @@
 
 MONIT_VERSION = 5.20.0
 MONIT_SITE = http://mmonit.com/monit/dist
-MONIT_LICENSE = AGPLv3 with OpenSSL exception
+MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
 #
 # Touching Makefile.am:
diff --git a/package/python-crossbar/python-crossbar.mk b/package/python-crossbar/python-crossbar.mk
index fa1732b..77cecfa 100644
--- a/package/python-crossbar/python-crossbar.mk
+++ b/package/python-crossbar/python-crossbar.mk
@@ -9,7 +9,7 @@
 PYTHON_CROSSBAR_VERSION = 0.14.0
 PYTHON_CROSSBAR_SOURCE = crossbar-$(PYTHON_CROSSBAR_VERSION).tar.gz
 PYTHON_CROSSBAR_SITE = https://pypi.python.org/packages/f0/9a/e0b77e15698c47b6293655bc0e1996dd8e87bd8af7bc7434a5c8281a024e
-PYTHON_CROSSBAR_LICENSE = AGPLv3
+PYTHON_CROSSBAR_LICENSE = AGPL-3.0
 PYTHON_CROSSBAR_LICENSE_FILES = LICENSE
 PYTHON_CROSSBAR_SETUP_TYPE = setuptools
 
-- 
2.6.2
