From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:31:55 +0200
Subject: [Buildroot] [git commit] wiringpi: needs threads
Message-ID: <20160607193211.66DF0817D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc1411d0b1b159e208d141fb4ba3c6f3508e1336
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1]:

  wiringPi.c:66:21: fatal error: pthread.h: No such file or directory

[1] http://autobuild.buildroot.net/results/4e1/4e17697c1116b418d8d9c07a202f3c89186e463f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wiringpi/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
index a292b3f..2062a62 100644
--- a/package/wiringpi/Config.in
+++ b/package/wiringpi/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_WIRINGPI
 	bool "wiringpi"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  wiringPi libraries (and gpio command)
 
 	  http://wiringpi.com/
+
+comment "wiringpi needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
