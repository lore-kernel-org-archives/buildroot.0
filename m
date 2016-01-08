From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:31:04 +0100
Subject: [Buildroot] [git commit] ntp: security bump to version 4.2.8p5
Message-ID: <20160108173609.A15C0827EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=513c314dc35ab0f976aaad12aeb5b34be2e55494
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-5300 - MITM attacker can force ntpd to make a step larger than
the panic threshold.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 735e533..a98b2e2 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p4.tar.gz.md5
-md5	6af96862b09324a8ef965ca76b759c8b	ntp-4.2.8p4.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p5.tar.gz.md5
+md5	9f02b2a0acc1617ce2716d529a58d2d8	ntp-4.2.8p5.tar.gz
 # Calculated based on the hash above
-sha256	0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9	ntp-4.2.8p4.tar.gz
+sha256	ca28baf4f6bb6fabdc1b62fd1dcec412be2e621192b40466a469a2496164f696	ntp-4.2.8p5.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 97e5ab2..2aadcab 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p4
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p5
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
