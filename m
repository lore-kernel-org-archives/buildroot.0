From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 25 May 2017 10:38:26 +0100
Subject: [Buildroot] [PATCH next] tinyalsa: bump version to 1.1.1
Message-ID: <20170525093826.54868-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/tinyalsa/0001-disable-doxygen-usage.patch | 21 ++++++++++++---------
 package/tinyalsa/tinyalsa.hash                    |  2 +-
 package/tinyalsa/tinyalsa.mk                      |  2 +-
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/tinyalsa/0001-disable-doxygen-usage.patch b/package/tinyalsa/0001-disable-doxygen-usage.patch
index 9c867a8fe..ed939fb9b 100644
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
index b6bea47eb..f9be664ca 100644
--- a/package/tinyalsa/tinyalsa.hash
+++ b/package/tinyalsa/tinyalsa.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  93f4ca1e6345974167dc5577e8151a31fa2e6a628727a72d59e18db2289e7a1c  tinyalsa-1.1.0.tar.gz
+sha256 d92b438cea348ae316c4b2cbf367b4f01ed821a947e6a34d813624e9e3c936c1  tinyalsa-1.1.1.tar.gz
diff --git a/package/tinyalsa/tinyalsa.mk b/package/tinyalsa/tinyalsa.mk
index 064dfd0a8..bd9d9a00d 100644
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
-- 
2.13.0
