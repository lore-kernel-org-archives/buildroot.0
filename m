From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 Jun 2016 20:43:01 +0200
Subject: [Buildroot] [PATCH v1] wiringpi: needs threads
Message-ID: <1465324981-7012-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  wiringPi.c:66:21: fatal error: pthread.h: No such file or directory

[1] http://autobuild.buildroot.net/results/4e1/4e17697c1116b418d8d9c07a202f3c89186e463f

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.8.1
