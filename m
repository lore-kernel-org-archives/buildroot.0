From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 May 2021 10:44:57 +0200
Subject: [Buildroot] [PATCH] package/dhcp: security bump to version 4.4.2-P1
Message-ID: <20210530084457.24417-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issue:

- CVE-2021-25217: A buffer overrun in lease file parsing code can be used to
  exploit a common vulnerability shared by dhcpd and dhclient

For details, see the advisory:
https://kb.isc.org/docs/cve-2021-25217

Update the LICENSE hash for a change of copyright years.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.hash | 6 +++---
 package/dhcp/dhcp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index 92ecdfec58..ec7c4fe58d 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.4.2/dhcp-4.4.2.tar.gz.sha256.asc
-sha256  1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521  dhcp-4.4.2.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz.sha256.asc
+sha256  b05e04337539545a8faa0d6ac518defc61a07e5aec66a857f455e7f218c85a1a  dhcp-4.4.2-P1.tar.gz
 # Locally calculated
-sha256  89e7b0661134cc118bdcdeb87ff0493d544bc5723c9ca6616fa05f03539738af  LICENSE
+sha256  9961fce0d83a6229b9084cdadedfa723a53274c63af610c9adb61b607e0f5a76  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index db58870f88..1edb3c5e99 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.4.2
+DHCP_VERSION = 4.4.2-P1
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
-- 
2.20.1
