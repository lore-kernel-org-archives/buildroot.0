From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:18:47 +0200
Subject: [Buildroot] [git commit] package/wiringpi: uses fork(), needs mmu
Message-ID: <20160605202804.92E71819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f55dcc221c88d8b0152d36f21f30d987ab0ab160
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/c60/c6013c214674f9802309d8cd770d3da2f751674d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wiringpi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
index 9275b82..a292b3f 100644
--- a/package/wiringpi/Config.in
+++ b/package/wiringpi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WIRINGPI
 	bool "wiringpi"
+	depends on BR2_USE_MMU # fork()
 	help
 	  wiringPi libraries (and gpio command)
 
