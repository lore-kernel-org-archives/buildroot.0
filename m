From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 22:46:35 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libfreefare: drop
 threads dependency
Message-ID: <20210426203328.CE3F4815DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02078da3633deaa57da1727b867e1a1fdad91ca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This dependency should have dropped by commit
1a49188a69416542087acd1246b17c0139ff0054 which removed threads
dependency from libnfc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b92c7a85271b85ed1ace4de92d7f3716214283d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreefare/Config.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2bb0c93ddf..b330b2256a 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
 
 	  http://nfc-tools.org/index.php?title=Libfreefare
-
-comment "libfreefare needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
