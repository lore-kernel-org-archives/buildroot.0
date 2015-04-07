From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 13:54:11 -0300
Subject: [Buildroot] [PATCH] ntp: security bump to version 4.2.8p2
Message-ID: <1428425651-24304-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-1798 - ntpd accepts unauthenticated packets with symmetric key
crypto.
CVE-2015-1799 -  Authentication doesn't protect symmetric associations
against DoS attacks.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/ntp.hash | 4 ++--
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 8336be8..fe51932 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,2 +1,2 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p1.tar.gz.md5
-md5	65d8cdfae4722226fbe29863477641ed ntp-4.2.8p1.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p2.tar.gz.md5
+md5	fa37049383316322d060ec9061ac23a9	ntp-4.2.8p2.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index bf2cdbd..c91cc70 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p1
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p2
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = ntp license
-- 
2.0.5
