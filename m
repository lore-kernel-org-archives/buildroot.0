From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:44:51 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/systemd: generate
 the hwdb.bin
Message-ID: <20191106224839.172918E963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4564e7db6335cc83664585ee73e68b5aaefafb89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6feba7cba149dfbaef41d4ca1314017669ce4b12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ad72a269ef..0b114de380 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -189,6 +189,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
 	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
