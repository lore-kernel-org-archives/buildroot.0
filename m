From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2019 23:45:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] packagesystemd: generate
 the hwdb.bin
Message-ID: <20191106224834.401CE8E93C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d4889e92b7fa2876ec402746589c6842c1251a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
index 920b65db44..aa763cd12f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -140,6 +140,7 @@ config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 config BR2_PACKAGE_SYSTEMD_HWDB
 	bool "enable hwdb installation"
 	default y
+	select BR2_PACKAGE_HOST_EUDEV # for udevadm, during target-finalize
 	help
 	  Enables hardware database installation to /usr/lib/udev/hwdb.d
 
