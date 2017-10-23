From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 23 Oct 2017 14:00:45 -0400
Subject: [Buildroot] [PATCH 1/1] libsepol: require threads
Message-ID: <20171023180045.7259-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsepol 2.7 now uses pthreads.h

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/libsepol/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index f92af52072..32214e4e9c 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBSEPOL
 	bool "libsepol"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Libsepol is the binary policy manipulation library. It doesn't
 	  depend upon or use any of the other SELinux components.
 
 	  http://selinuxproject.org/page/Main_Page
+
+comment "libsepol needs a toolchain w/ threads"
+        depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
2.13.6
