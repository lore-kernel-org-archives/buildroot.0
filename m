From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:45:28 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/eudev: generate
 the hwdb.bin
Message-ID: <20191106224834.385068E93C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54861892a772d1739c1c0488e9c3490c8af3fc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cf9afa50e18d1feaeab238e4a4d556f06eb3ecf9)
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
 
