From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:08:13 +0200
Subject: [Buildroot] [git commit] package/fastd: select
 BR2_PACKAGE_LIBSODIUM_FULL
Message-ID: <20191002191223.006698815F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69368c950131d67addbbf5188bb29729485942bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ad7963ea90ce1d762e2b3d8a0c76b4d0bc1fa805 added an option to
disable some libsodium functions so select it as it's needed by fastd

Fixes:
 - http://autobuild.buildroot.org/results/dba0e1b9df3e02fbd2261086189d2b6c483ce664

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
