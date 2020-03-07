From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:26:11 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux: make
 wipefs depend on BR2_USE_MMU
Message-ID: <20200307202446.0244E8FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caec37adee204b374a557432c6bcce9b07c54c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

It depends on libblkid and libsmartcols, which use fork().

Fixes:
  http://autobuild.buildroot.net/results/82f9712bc90377c625caeb5b175e83a03d5b9d75/

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d83b5d628a79e21485eb6445ba9526075675e195)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 3c64a19d84..3609da79ad 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -409,6 +409,7 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 
 config BR2_PACKAGE_UTIL_LINUX_WIPEFS
 	bool "wipefs"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
