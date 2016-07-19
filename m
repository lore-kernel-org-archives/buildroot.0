From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2016 23:19:23 +0200
Subject: [Buildroot] [git commit] libamcodec: needs dynamic library
Message-ID: <20160719211952.3402481DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a80f0efa9c610b00b531b69d14c2ff9852fd721b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libamcodec uses <dlfcn.h>, so it requires dynamic library support.

Fixes:

  http://autobuild.buildroot.net/results/b7653c299a60a67b360c98d59d6707ab468ce6f1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libamcodec/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libamcodec/Config.in b/package/libamcodec/Config.in
index 52778ba..7300259 100644
--- a/package/libamcodec/Config.in
+++ b/package/libamcodec/Config.in
@@ -1,11 +1,12 @@
-comment "libamcodec needs a toolchain w/ threads"
+comment "libamcodec needs a toolchain w/ threads, dynamic library"
 	depends on BR2_arm || BR2_aarch64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_LIBAMCODEC
 	bool "libamcodec"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_ALSA_LIB
 	help
 	    Interface library for Amlogic media codecs
