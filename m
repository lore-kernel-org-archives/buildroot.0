From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 22:39:49 +0100
Subject: [Buildroot] [git commit] package/rtty: needs MMU
Message-ID: <20200324212718.60775881AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ccdaba3ec6c569869820dabaf4b8ccbf4d6aa4c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rtty uses fork(), so add a depends on BR2_USE_MMU

Fixes:

  http://autobuild.buildroot.net/results/ebd483ee87046396db39f966e34f93c3d1123202/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtty/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rtty/Config.in b/package/rtty/Config.in
index badb329d3e..198d465713 100644
--- a/package/rtty/Config.in
+++ b/package/rtty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTTY
 	bool "rtty"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
 	help
 	  Access your device's terminal from anywhere via the web.
