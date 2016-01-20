From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Thu, 21 Jan 2016 00:17:44 +0200
Subject: [Buildroot] [PATCH v4 2/5] package/hplip: Un-deprecate and bump
	version to 3.15.11
In-Reply-To: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1453328267-31962-3-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/hplip/0001-fix-make.patch | 40 +++++++++++++++++++--------------------
 package/hplip/Config.in           |  2 --
 package/hplip/hplip.hash          |  2 +-
 package/hplip/hplip.mk            |  2 +-
 4 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/package/hplip/0001-fix-make.patch b/package/hplip/0001-fix-make.patch
index da05d03..9105d6f 100644
--- a/package/hplip/0001-fix-make.patch
+++ b/package/hplip/0001-fix-make.patch
@@ -1,35 +1,35 @@
-From 6019d012246578ae1a191d3510284e7b894fb528 Mon Sep 17 00:00:00 2001
+From c1822a19e75bae8e044cd46a257a234cd9649896 Mon Sep 17 00:00:00 2001
 From: Olivier Schonken <olivier.schonken@gmail.com>
-Date: Sat, 2 Mar 2013 18:01:03 +0200
+Date: Wed, 20 Jan 2016 23:46:50 +0200
 Subject: [PATCH] Changed Makefile.am to allow cross-compilation of HPLIP
 
 Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 ---
- Makefile.am |   28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 16ea902..b22f46a 100644
+index 73fed2e..23aa0ec 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -72,7 +72,7 @@ libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/
- 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
- 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb_libusb01.c
+@@ -92,7 +92,7 @@ libhpmud_la_SOURCES += io/hpmud/musb_libusb01.c
+ libhpmud_la_LDFLAGS += -lusb
  else
--libhpmud_la_CFLAGS = -I/usr/include/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
-+libhpmud_la_CFLAGS = -I$(includedir)/libusb-1.0 -DMUDNAME=\"$(MUDNAME)\" -DCONFDIR=\"$(hplip_confdir)\"
- libhpmud_la_SOURCES = io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c io/hpmud/pml.c \
- 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/hpmud/pml.h io/hpmud/dot4.c \
- 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.h io/hpmud/musb.h io/hpmud/musb.c
-@@ -292,7 +292,7 @@ hpmudext_la_LIBADD = libhpmud.la
- if LIBUSB01_BUILD
- hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR)
- else
--hpmudext_la_CFLAGS =-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
-+hpmudext_la_CFLAGS =-I$(includedir)/libusb-1.0 -I$(PYTHONINCLUDEDIR)
+ libhpmud_la_SOURCES += io/hpmud/musb.c 
+-libhpmud_la_CFLAGS  += -I/usr/include/libusb-1.0
++libhpmud_la_CFLAGS  += -I$(includedir)/libusb-1.0
+ libhpmud_la_LDFLAGS += -lusb-1.0
+ endif
+ 
+@@ -314,7 +314,7 @@ hpmudext_la_LIBADD = libhpmud.la libhpdiscovery.la
+ hpmudext_la_CFLAGS = -I$(PYTHONINCLUDEDIR) -Iprotocol/discovery
+ 
+ if !LIBUSB01_BUILD
+-hpmudext_la_CFLAGS +=-I/usr/include/libusb-1.0 
++hpmudext_la_CFLAGS +=-I$(includedir)/libusb-1.0 
  endif
  
  # ui (qt3)
 -- 
-1.7.10.4
+2.5.0
 
diff --git a/package/hplip/Config.in b/package/hplip/Config.in
index a8a5f69..7565671 100644
--- a/package/hplip/Config.in
+++ b/package/hplip/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_HPLIP
 	bool "hplip"
-	# because of cups security issues
-	depends on BR2_DEPRECATED_SINCE_2015_05
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_CUPS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index fb7d4e7..75ff7d3 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a8122cd824398ac6374154f86152e24fdf5c0100b5c1d6518e853308362e627d  hplip-3.13.10.tar.gz
+sha256  33c4711bde04a34b81f3f70e6277a0375dded171469e5aa8b9cef1a14a407c6d  hplip-3.15.11.tar.gz
diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index 2cdddca..aea1f0c 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HPLIP_VERSION = 3.13.10
+HPLIP_VERSION = 3.15.11
 HPLIP_SITE = http://downloads.sourceforge.net/hplip/hplip
 HPLIP_AUTORECONF = YES
 HPLIP_DEPENDENCIES = cups libusb jpeg
-- 
2.5.0
