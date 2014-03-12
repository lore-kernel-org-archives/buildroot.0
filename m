From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 09:03:53 +0100
Subject: [Buildroot] [git commit] ptpd2: needs libpcap
Message-ID: <20140312081514.914059BF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ae48d3b0b92c1fc6039ba06ff858a201c8570cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

That's what happens when testing a bunch of stuff that uses libpcap.
Fixes:
http://autobuild.buildroot.net/results/eaa/eaa615830a6b4cf3da88e71315364ad3e380f681/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ptpd2/Config.in |    1 +
 package/ptpd2/ptpd2.mk  |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
