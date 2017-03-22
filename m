From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:44:27 +0100
Subject: [Buildroot] [git commit] package/ntp: security bump to 4.2.8p10
Message-ID: <20170322214435.C356B82601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b47aec79d2e19ef7e3f04d2758c3a2930d47cebe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changed NTP_SITE to https to circumvent "URL transformed to HTTPS due
to an HSTS policy" during download.

For details about the bugs fixed see:
http://support.ntp.org/bin/view/Main/SecurityNotice#Recent_Vulnerabilities
http://www.kb.cert.org/vuls/id/633847

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index c6838d8..d8b7083 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p9.tar.gz.md5
-md5	857452b05f5f2e033786f77ade1974ed	ntp-4.2.8p9.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p10.tar.gz.md5
+md5 745384ed0dedb3f66b33fe84d66466f9  ntp-4.2.8p10.tar.gz
 # Calculated based on the hash above
-sha256	b724287778e1bac625b447327c9851eedef020517a3545625e9f652a90f30b72	ntp-4.2.8p9.tar.gz
+sha256 ddd2366e64219b9efa0f7438e06800d0db394ac5c88e13c17b70d0dcdf99b99f  ntp-4.2.8p10.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index edbf1c8..b6eb1b1 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p9
-NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p10
+NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent openssl $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
 NTP_LICENSE_FILES = COPYRIGHT
