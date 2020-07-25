From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 22:24:17 +0200
Subject: [Buildroot] [git commit] package/python-pillow: bump to version
 7.2.0
Message-ID: <20200725202107.76ADA88459@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4368ad9559b136ada13da83055580dd756379783
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bump pillow to version 7.2.0. The bump requires the python
xml module available.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pillow/Config.in          | 1 +
 package/python-pillow/python-pillow.hash | 2 +-
 package/python-pillow/python-pillow.mk   | 4 ++--
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
index f824d1371e..f98a4a9e5b 100644
--- a/package/python-pillow/Config.in
+++ b/package/python-pillow/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PILLOW
 	bool "python-pillow"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Pillow is the "friendly" PIL fork by Alex Clark and
 	  Contributors. PIL is the Python Imaging Library by Fredrik
diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index d222645633..f80b79fe5f 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/Pillow/
 md5	f1f7592c51260e5080d3cd71781ea675  Pillow-7.1.2.tar.gz
-sha256	a0b49960110bc6ff5fead46013bcb8825d101026d466f3a4de3476defe0fb0dd  Pillow-7.1.2.tar.gz
+sha256	97f9e7953a77d5a70f49b9a48da7776dc51e9b738151b22dacf101641594a626  Pillow-7.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256	37de42abe33a247e8f03d2313657a0f174a239a198f526add6544ff3e2643b81  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2832eeee0b..931dce53d2 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 7.1.2
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/ce/ef/e793f6ffe245c960c42492d0bb50f8d14e2ba223f1922a5c3c81569cec44
+PYTHON_PILLOW_VERSION = 7.2.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/3e/02/b09732ca4b14405ff159c470a612979acfc6e8645dc32f83ea0129709f7a
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = PIL Software License
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
