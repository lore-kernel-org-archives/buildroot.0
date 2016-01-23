From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:40:18 +0100
Subject: [Buildroot] [PATCH 1/2] package/ptpd2: bump version to 2.3.1,
	switch upstream to github
Message-ID: <1453592419-15454-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ptpd2/Config.in  | 3 ++-
 package/ptpd2/ptpd2.hash | 2 +-
 package/ptpd2/ptpd2.mk   | 5 ++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ptpd2/Config.in b/package/ptpd2/Config.in
index e37b10e..e88a9bb 100644
--- a/package/ptpd2/Config.in
+++ b/package/ptpd2/Config.in
@@ -5,4 +5,5 @@ config BR2_PACKAGE_PTPD2
 	  The PTP daemon (PTPd) implements the Precision Time protocol
 	  (PTP) as defined by the IEEE-1588-2008.
 
-	  http://ptpd.sourceforge.net/
+	  https://github.com/ptpd/ptpd
+
diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
index 2570c00..af1f78a 100644
--- a/package/ptpd2/ptpd2.hash
+++ b/package/ptpd2/ptpd2.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  1a4e90496f004bfd91657ccc49209101dc25b787e540648c07c0973469f1d8f7  ptpd-2.3.0.tar.gz
+sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-ptpd-2.3.1.tar.gz
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index cd49fe5..c86db7e 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PTPD2_VERSION = 2.3.0
-PTPD2_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD2_VERSION)
-PTPD2_SOURCE = ptpd-$(PTPD2_VERSION).tar.gz
+PTPD2_VERSION = ptpd-2.3.1
+PTPD2_SITE = $(call github,ptpd,ptpd,$(PTPD2_VERSION))
 PTPD2_DEPENDENCIES = libpcap
 # configure not shipped
 PTPD2_AUTORECONF = YES
-- 
2.7.0.rc3
