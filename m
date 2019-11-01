From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 08:52:45 +0100
Subject: [Buildroot] [git commit] package/eudev: generate the hwdb.bin
Message-ID: <20191101075631.EE2A38E49E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf9afa50e18d1feaeab238e4a4d556f06eb3ecf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..b1d2f37a72 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -29,8 +29,9 @@ config BR2_PACKAGE_EUDEV_RULES_GEN
 config BR2_PACKAGE_EUDEV_ENABLE_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
-	  Enables hardware database installation to /etc/udev/hwdb.d
+	  Enables hardware database installation to /etc/udev/hwdb.bin
 
 endif
 
