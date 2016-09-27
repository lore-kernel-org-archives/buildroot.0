From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 27 Sep 2016 07:39:49 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mono: bump to version 4.6.0.245
In-Reply-To: <1474954789-14602-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1474954789-14602-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1474954789-14602-2-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump to mono 4.6.0.245
* Enabling previously disabled aot cause this version doesn't
  compile without
* Fixing removed licensing file in mcs/COPYING.LIB

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/mono.hash | 2 +-
 package/mono/mono.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index c275e15..4d05458 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 900c2cc25ee55adeec04e1ae889316efc127c82cc0c392f928421f19f8f5b633  mono-4.4.2.11.tar.bz2
+sha256 2981f518cace63bfe10953fecd57c7fef040077a1ac617967dde5466062c1327  mono-4.6.0.245.tar.bz2
diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 3d0b9bc..8f90b9f 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MONO_VERSION = 4.4.2.11
+MONO_VERSION = 4.6.0.245
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPLv2 or MIT (compiler, tools), LGPLv2 (runtime libs), MIT (class libs) or commercial
-MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING.LIB mcs/COPYING \
+MONO_LICENSE_FILES = LICENSE COPYING.LIB mcs/COPYING \
 	eglib/COPYING external/Newtonsoft.Json/Tools/7-zip/copying.txt
 MONO_INSTALL_STAGING = YES
 
@@ -22,7 +22,7 @@ MONO_CONF_OPTS = --disable-gtk-doc \
 	--with-mcs-docs=no \
 	--with-moonlight=no \
 	--with-ikvm-native=no \
-	--enable-minimal=aot,profiler,debug \
+	--enable-minimal=profiler,debug \
 	--disable-mcs-build \
 	--enable-static
 
@@ -49,7 +49,7 @@ HOST_MONO_CONF_OPTS = --disable-gtk-doc \
 	--with-moonlight=no \
 	--disable-libraries \
 	--with-ikvm-native=no \
-	--enable-minimal=aot,profiler,debug \
+	--enable-minimal=profiler,debug \
 	--enable-static
 
 # ensure monolite is used
-- 
1.9.1
