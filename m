From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:38:19 +0200
Subject: [Buildroot] [git commit] shellinabox: add dependency on
	!BR2_STATIC_LIBS
Message-ID: <20160804203840.398D87FB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cad81f0fed3934449a28c35316684393d702a74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

shellinabox uses <dlfcn.h>, so a !BR2_STATIC_LIBS dependency is needed.

Fixes:

  http://autobuild.buildroot.net/results/59dd88e31a5f49231c4131b840fbf1bb76e777e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/shellinabox/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
index 10c492c..63a298d 100644
--- a/package/shellinabox/Config.in
+++ b/package/shellinabox/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SHELLINABOX
 	bool "shellinabox"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -11,3 +12,7 @@ config BR2_PACKAGE_SHELLINABOX
 	  browser plugins.
 
 	  https://github.com/shellinabox/shellinabox
+
+comment "shellinabox needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
