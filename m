From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:37:14 +0100
Subject: [Buildroot] [git commit] mono: remove nonexistent configure options
Message-ID: <20170318143733.1721782550@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ba4fee836b9dec5f30a039fe2a03ad889b7cac1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The .mk file for the mono package contains out of date configuration
options. The --disable-gtk-doc option is no longer available in
configure. Moonlight is no longer supported in Mono and the
--with-moonlight=no option is no longer required.

Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mono/mono.mk | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 20b9205..866bff2 100644
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
