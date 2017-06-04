From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:46:11 +0200
Subject: [Buildroot] [git commit] package/gmrender-resurrect: bump version
Message-ID: <20170604074617.357658285C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19ad3a150f6910a6e02befc9a8ce04a330163324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gmrender-resurrect now builds with musl after
https://github.com/hzeller/gmrender-resurrect/commit/4ebbb5cabee79aefd88e0cffc8655dd703512e7a
removed the usage of error.h.

Build tested based on
http://autobuild.buildroot.net/toolchains/configs/br-x86-64-musl.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmrender-resurrect/Config.in               | 7 ++-----
 package/gmrender-resurrect/gmrender-resurrect.hash | 2 +-
 package/gmrender-resurrect/gmrender-resurrect.mk   | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index 631c407..db655ad 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gstreamer1 -> libglib2, libupnp
 	depends on BR2_USE_MMU # gstreamer1
-	# uses <error.h>
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
 	select BR2_PACKAGE_LIBUPNP
@@ -13,7 +11,6 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 
 	  https://github.com/hzeller/gmrender-resurrect
 
-comment "gmrender-resurrect needs a glibc or uClibc toolchain w/ wchar, threads"
+comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_USES_MUSL
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmrender-resurrect/gmrender-resurrect.hash b/package/gmrender-resurrect/gmrender-resurrect.hash
index ba4561e..522bd2a 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.hash
+++ b/package/gmrender-resurrect/gmrender-resurrect.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8cd9eae3e6be75684c9b7c4d29702fcbbeead0ded1d4f7cf8fb65fe1dc718596 gmrender-resurrect-48caaa4f6c386fd1586126c801cd326f96d5fa5c.tar.gz
+sha256 dcbde3601c3389e8dd21fe1842a92abf4cc06f6e3a375f1df63fdbf784a6650b  gmrender-resurrect-33600ab663f181c4f4f5c48aba25bf961760a300.tar.gz
diff --git a/package/gmrender-resurrect/gmrender-resurrect.mk b/package/gmrender-resurrect/gmrender-resurrect.mk
index 98d5e0b..2b6a56f 100644
--- a/package/gmrender-resurrect/gmrender-resurrect.mk
+++ b/package/gmrender-resurrect/gmrender-resurrect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMRENDER_RESURRECT_VERSION = 48caaa4f6c386fd1586126c801cd326f96d5fa5c
+GMRENDER_RESURRECT_VERSION = 33600ab663f181c4f4f5c48aba25bf961760a300
 GMRENDER_RESURRECT_SITE = $(call github,hzeller,gmrender-resurrect,$(GMRENDER_RESURRECT_VERSION))
 # Original distribution does not have default configure,
 # so we need to autoreconf:
