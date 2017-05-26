From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 15:15:24 +0200
Subject: [Buildroot] [git commit] tinyalsa: bump version to 1.1.1
Message-ID: <20170601202857.01ABA82863@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=050b52515ba9b2c04cc14d648835e9385a55654f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinyalsa/0001-disable-doxygen-usage.patch | 21 ++++++++++++---------
 package/tinyalsa/tinyalsa.hash                    |  2 +-
 package/tinyalsa/tinyalsa.mk                      |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/tinyalsa/0001-disable-doxygen-usage.patch b/package/tinyalsa/0001-disable-doxygen-usage.patch
index 9c867a8..ed939fb 100644
--- a/package/tinyalsa/0001-disable-doxygen-usage.patch
+++ b/package/tinyalsa/0001-disable-doxygen-usage.patch
@@ -4,29 +4,32 @@ In order to avoid a dependency on doxygen on the build machine, this
 patch adjusts the main Makefile to not build and install the
 documentation.
 
+[Vincent: tweak patch for 1.1.1 version]
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -13,13 +13,11 @@
+diff -rup a/Makefile b/Makefile
+--- a/Makefile	2017-05-24 05:23:57.000000000 +0100
++++ b/Makefile	2017-05-25 10:35:20.781747053 +0100
+@@ -11,14 +11,12 @@ export MANDIR ?= $(PREFIX)/share/man
  all:
  	$(MAKE) -C src
  	$(MAKE) -C utils
 -	$(MAKE) -C doxygen
+ 	$(MAKE) -C examples
  
  .PHONY: clean
  clean:
  	$(MAKE) -C src clean
  	$(MAKE) -C utils clean
 -	$(MAKE) -C doxygen clean
+ 	$(MAKE) -C examples clean
  
  .PHONY: install
- install:
-@@ -27,5 +25,3 @@
- 	cp -Ru include/tinyalsa $(DESTDIR)$(INCDIR)/
+@@ -30,5 +28,4 @@ install:
+ 	install include/tinyalsa/version.h $(DESTDIR)$(INCDIR)/
  	$(MAKE) -C src install
  	$(MAKE) -C utils install
 -	$(MAKE) -C doxygen install
--
+ 
diff --git a/package/tinyalsa/tinyalsa.hash b/package/tinyalsa/tinyalsa.hash
index b6bea47..f9be664 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  93f4ca1e6345974167dc5577e8151a31fa2e6a628727a72d59e18db2289e7a1c  tinyalsa-1.1.0.tar.gz
+sha256 d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 064dfd0..bd9d9a0 100644
--- a/package/tinyalsa/tinyalsa.mk
+++ b/package/tinyalsa/tinyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYALSA_VERSION = 1.1.0
+TINYALSA_VERSION = 1.1.1
 TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,$(TINYALSA_VERSION))
 TINYALSA_LICENSE = BSD-3-Clause
 TINYALSA_LICENSE_FILES = NOTICE
