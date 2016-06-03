From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Jun 2016 22:26:22 -0300
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p8
Message-ID: <1464917182-22090-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4957 - Crypto-NAK crash
CVE-2016-4953 - Bad authentication demobilizes ephemeral associations
CVE-2016-4954 - Processing spoofed server packets
CVE-2016-4955 - Autokey association reset
CVE-2016-4956 - Broadcast interleave

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 6be52aa..2a1155b 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p7.tar.gz.md5
-md5	46dfba933c3e4bc924d8e55068797578	ntp-4.2.8p7.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p8.tar.gz.md5
+md5	4a8636260435b230636f053ffd070e34	ntp-4.2.8p8.tar.gz
 # Calculated based on the hash above
-sha256	81d20c06a0b01abe3b84fac092185bf014252d38fe5e7b2758f604680a0220dc	ntp-4.2.8p7.tar.gz
+sha256	2ab3d0b5f0456e6311dda1cc27ab75da108762773a19e46abd938bd9407b97ee	ntp-4.2.8p8.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index d8ac534..8d3a6f3 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p7
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p8
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
-- 
2.7.3
