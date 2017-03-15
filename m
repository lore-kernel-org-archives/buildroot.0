From: Dustin Johnson <dustin.r.johnson@gmail.com>
Date: Tue, 14 Mar 2017 21:55:07 -0400
Subject: [Buildroot] [PATCH 1/1] mono: Remove out of date configure options.
Message-ID: <20170315015507.6512-1-dustin.r.johnson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The makefile for the mono package contains out of date configuration options. The --disable-gtk-doc option is no longer available in configure. Moonlight is no longer supported in Mono and the --with-moonlight=no option is no longer required.

Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
---
 package/mono/mono.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 20b920568..866bff23f 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -18,9 +18,7 @@ MONO_INSTALL_STAGING = YES
 MONO_AUTORECONF = YES
 
 # Disable managed code (mcs folder) from building
-MONO_CONF_OPTS = --disable-gtk-doc \
-	--with-mcs-docs=no \
-	--with-moonlight=no \
+MONO_CONF_OPTS = --with-mcs-docs=no \
 	--with-ikvm-native=no \
 	--enable-minimal=profiler,debug \
 	--disable-mcs-build \
@@ -44,9 +42,7 @@ MONO_DEPENDENCIES += host-mono
 
 ## Mono managed
 
-HOST_MONO_CONF_OPTS = --disable-gtk-doc \
-	--with-mcs-docs=no \
-	--with-moonlight=no \
+HOST_MONO_CONF_OPTS = --with-mcs-docs=no \
 	--disable-libraries \
 	--with-ikvm-native=no \
 	--enable-minimal=profiler,debug \
-- 
2.12.0.windows.1
