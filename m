From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 17:59:06 +0100
Subject: [Buildroot] [git commit] package/dav1d: needs dynamic library
Message-ID: <20200321164612.13AE8839DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cfcb8619bcfb9bcd02877cb917ad4f034c10d18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dav1d needs dynamic library since version 0.6.0 and
https://github.com/videolan/dav1d/commit/6b611d36acab8ce1afdd528599322bb6b2d28727

Fixes:
 - http://autobuild.buildroot.org/results/c82b6e3c1cf968c644f3dee376b16760fb4593bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dav1d/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dav1d/Config.in b/package/dav1d/Config.in
index 00d2fd17f1..fb2902558f 100644
--- a/package/dav1d/Config.in
+++ b/package/dav1d/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DAV1D
 	bool "dav1d"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pthread
 	help
 	  dav1d is a new AV1 cross-platform decoder, open-source, and
@@ -7,5 +8,5 @@ config BR2_PACKAGE_DAV1D
 
 	  https://code.videolan.org/videolan/dav1d
 
-comment "dav1d needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "dav1d needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
