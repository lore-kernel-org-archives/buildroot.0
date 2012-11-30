From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Nov 2012 23:05:44 -0800
Subject: [Buildroot] [git commit] alsa-lib: fix static linking check
Message-ID: <20121130070801.194B8993D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b7be2f1de3eec185a720310d418719ccc3f22f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #5732

The symbol for static linking is BR2_PREFER_STATIC_LIB.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    4 ++++
 package/alsa-lib/alsa-lib.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0da2d77..db7b233 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,10 @@
 	cjson, directfb, gdb, hiawatha, lcdproc, libdaemon, libecore,
 	libhid, libpcap, libusb, linux-fusion, ocf-linux, strace,
 
+	Issues resolved (http://bugs.uclibc.org):
+
+	#5732: Error : package/alsa-lib/alsa-lib.mk
+
 2012.11-rc1, Released November 17th, 2012
 
 	Fixes all over the tree and new features.
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index daa551d..eddd3d2 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -17,7 +17,7 @@ ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVD
 		    --without-versioned
 
 # Can't build with static & shared at the same time (1.0.25+)
-ifeq ($(BR2_PREFER_STATIC),y)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
 ALSA_LIB_CONF_OPT += --enable-shared=no
 else
 ALSA_LIB_CONF_OPT += --enable-static=no
