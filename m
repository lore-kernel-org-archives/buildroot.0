From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 29 Oct 2015 10:17:57 -0300
Subject: [Buildroot] [PATCH] iperf3: bump to version 3.1
Message-ID: <1446124677-22273-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to proper homepage, download from homepage and add a hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iperf3/Config.in   | 2 +-
 package/iperf3/iperf3.hash | 2 ++
 package/iperf3/iperf3.mk   | 5 +++--
 3 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 package/iperf3/iperf3.hash

diff --git a/package/iperf3/Config.in b/package/iperf3/Config.in
index 1f263ab..18c3612 100644
--- a/package/iperf3/Config.in
+++ b/package/iperf3/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_IPERF3
 	  It's a redesign of the NLANR/DAST iperf(2) and is not
 	  backward compatible.
 
-	  https://github.com/esnet/iperf
+	  https://iperf.fr
 
 comment "iperf3 needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
new file mode 100644
index 0000000..9fb2cba
--- /dev/null
+++ b/package/iperf3/iperf3.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	94fef2c3a51d01f0b1ee899bf02c87ff392423fb8c8d0af34fd59c1462c8bbb0	iperf-3.1-source.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index b8e594f..d1338e6 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.0.10
-IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
+IPERF3_VERSION = 3.1
+IPERF3_SITE = https://iperf.fr/download/iperf_$(IPERF3_VERSION)
+IPERF3_SOURCE = iperf-$(IPERF3_VERSION)-source.tar.gz
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
-- 
2.4.10
