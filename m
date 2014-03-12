From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Mar 2014 21:30:42 -0300
Subject: [Buildroot] [PATCH 1/2] ptpd2: needs libpcap
Message-ID: <1394584243-8501-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That's what happens when testing a bunch of stuff that uses libpcap.
Fixes:
http://autobuild.buildroot.net/results/eaa/eaa615830a6b4cf3da88e71315364ad3e380f681/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ptpd2/Config.in | 1 +
 package/ptpd2/ptpd2.mk  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/ptpd2/Config.in b/package/ptpd2/Config.in
index bf26453..e37b10e 100644
--- a/package/ptpd2/Config.in
+++ b/package/ptpd2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PTPD2
 	bool "ptpd2"
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  The PTP daemon (PTPd) implements the Precision Time protocol
 	  (PTP) as defined by the IEEE-1588-2008.
diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index cd898d8..a5d1aff 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -7,6 +7,7 @@
 PTPD2_VERSION = 2.3.0
 PTPD2_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD2_VERSION)
 PTPD2_SOURCE = ptpd-$(PTPD2_VERSION).tar.gz
+PTPD2_DEPENDENCIES = libpcap
 # configure not shipped
 PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
-- 
1.8.3.2
