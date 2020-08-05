From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:42:10 +0200
Subject: [Buildroot] [git commit] package/systemd: import does not need
 bzip2 and lz4
Message-ID: <20200805134339.9DCC782236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa7a165a3d72beb64f66dac46efd7c3c1adb76ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those are optional dependencies.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 30a5c960f5..78a486c0ef 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -265,8 +265,6 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_XZ
 	select BR2_PACKAGE_ZLIB
 	help
