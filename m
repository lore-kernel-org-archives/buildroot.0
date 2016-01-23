From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 22:52:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/iperf3: bump version to 3.1.1,
	switch upstream to github
Message-ID: <1453585942-17556-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iperf3/Config.in   | 2 +-
 package/iperf3/iperf3.hash | 2 +-
 package/iperf3/iperf3.mk   | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/iperf3/Config.in b/package/iperf3/Config.in
index 18c3612..074c1d3 100644
--- a/package/iperf3/Config.in
+++ b/package/iperf3/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_IPERF3
 	  It's a redesign of the NLANR/DAST iperf(2) and is not
 	  backward compatible.
 
-	  https://iperf.fr
+	  http://software.es.net/iperf/index.html
 
 comment "iperf3 needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/iperf3/iperf3.hash b/package/iperf3/iperf3.hash
index 9fb2cba..4b9332d 100644
--- a/package/iperf3/iperf3.hash
+++ b/package/iperf3/iperf3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	94fef2c3a51d01f0b1ee899bf02c87ff392423fb8c8d0af34fd59c1462c8bbb0	iperf-3.1-source.tar.gz
+sha256	86f292e554d42d1bddbd5f587e594005f4ca202c284e4da45ed8cfbe935a5be8	iperf3-3.1.1.tar.gz
diff --git a/package/iperf3/iperf3.mk b/package/iperf3/iperf3.mk
index d1338e6..885a599 100644
--- a/package/iperf3/iperf3.mk
+++ b/package/iperf3/iperf3.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-IPERF3_VERSION = 3.1
-IPERF3_SITE = https://iperf.fr/download/iperf_$(IPERF3_VERSION)
-IPERF3_SOURCE = iperf-$(IPERF3_VERSION)-source.tar.gz
+IPERF3_VERSION = 3.1.1
+IPERF3_SITE = $(call github,esnet,iperf,$(IPERF3_VERSION))
 IPERF3_LICENSE = BSD-3c, BSD-2c, MIT
 IPERF3_LICENSE_FILES = LICENSE
 
-- 
2.7.0.rc3
