From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 10:59:38 +0200
Subject: [Buildroot] [git commit] ntp: security bump to version 4.2.8p3
Message-ID: <20150702090455.8E9E8818D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=643af798cc12806b479379640451dddd789c0027
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-5146 - ntpd control message crash: Crafted NUL-byte in
configuration directive.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.hash |    6 ++++--
 package/ntp/ntp.mk   |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index fe51932..d23146f 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,2 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p2.tar.gz.md5
-md5	fa37049383316322d060ec9061ac23a9	ntp-4.2.8p2.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p3.tar.gz.md5
+md5	b98b0cbb72f6df04608e1dd5f313808b	ntp-4.2.8p3.tar.gz
+# Calculated based on the hash above
+sha256	818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f	ntp-4.2.8p3.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 36fc537..5f05508 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p2
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p3
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
