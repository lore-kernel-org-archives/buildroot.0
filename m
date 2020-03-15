From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:06:55 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libvncserver: fix
 static build with openssl
Message-ID: <20200315095840.4D3AE83F03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04ec3f02e572874f1d3aa06f56d1ccaa43983082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/c3f75480cb4b8b042cdf6a34cc5568ea13e51342

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a61a81617b229a3aac84c25171df01d49805c8ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...keLists.txt-use-pkgconfig-to-find-openssl.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch b/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch
new file mode 100644
index 0000000000..c51b725469
--- /dev/null
+++ b/package/libvncserver/0002-CMakeLists.txt-use-pkgconfig-to-find-openssl.patch
@@ -0,0 +1,34 @@
+From ab512233c88022fec67fabec1fb00a833c466c9e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 23 Jun 2019 22:54:57 +0200
+Subject: [PATCH] CMakeLists.txt: use pkgconfig to find openssl
+
+find_package(openssl) fails to find openssl dependencies such as -lz so
+use pkgconfig to fix static build
+
+Fixes:
+ - http://autobuild.buildroot.org/results/c3f75480cb4b8b042cdf6a34cc5568ea13e51342
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/LibVNC/libvncserver/pull/318]
+---
+ CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ad609ae..11103d8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -125,7 +125,8 @@ endif(WITH_GNUTLS)
+ 
+ 
+ if(WITH_OPENSSL)
+-  find_package(OpenSSL)
++  find_package(PkgConfig)
++  pkg_check_modules(OPENSSL "openssl")
+ endif(WITH_OPENSSL)
+ 
+ 
+-- 
+2.14.1
+
