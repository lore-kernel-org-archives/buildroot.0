From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 15:44:17 +0100
Subject: [Buildroot] [git commit] ntp: security bump to version 4.2.8p6
Message-ID: <20160120145035.393627FB00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18542431c1057f493f473f0521edf598a9b520ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2015-7973 - Deja Vu: Replay attack on authenticated broadcast mode
CVE-2015-7974 - Skeleton Key: Missing key check allows impersonation
between authenticated peers
CVE-2015-7975 - nextvar() missing length check
CVE-2015-7976 - ntpq saveconfig command allows dangerous characters in
filenames
CVE-2015-7977 - reslist NULL pointer dereference
CVE-2015-7978 - Stack exhaustion in recursive traversal of restriction
list
CVE-2015-7979 - Off-path Denial of Service (DoS) attack on authenticated
broadcast mode
CVE-2015-8137 - origin: Zero Origin Timestamp Bypass
CVE-2015-8158 - Potential Infinite Loop in ntpq

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index a98b2e2..0c2c29d 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p5.tar.gz.md5
-md5	9f02b2a0acc1617ce2716d529a58d2d8	ntp-4.2.8p5.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p6.tar.gz.md5
+md5	60049f51e9c8305afe30eb22b711c5c6	ntp-4.2.8p6.tar.gz
 # Calculated based on the hash above
-sha256	ca28baf4f6bb6fabdc1b62fd1dcec412be2e621192b40466a469a2496164f696	ntp-4.2.8p5.tar.gz
+sha256	583d0e1c573ace30a9c6afbea0fc52cae9c8c916dbc15c026e485a0dda4ba048	ntp-4.2.8p6.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 2aadcab..2b99ef2 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p5
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p6
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
