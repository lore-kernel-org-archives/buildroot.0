From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Oct 2019 18:58:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/fastd: select
 BR2_PACKAGE_LIBSODIUM_FULL
Message-ID: <20191001165807.12479-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit ad7963ea90ce1d762e2b3d8a0c76b4d0bc1fa805 added an option to
disable some libsodium functions so select it as it's needed by fastd

Fixes:
 - http://autobuild.buildroot.org/results/dba0e1b9df3e02fbd2261086189d2b6c483ce664

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fastd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 47c76b5ad6..1d0b052bd9 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FASTD
 	depends on !BR2_STATIC_LIBS # libuecc
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
+	select BR2_PACKAGE_LIBSODIUM_FULL
 	select BR2_PACKAGE_LIBCAP
 	help
 	  Fast and Secure Tunneling Daemon
-- 
2.23.0
