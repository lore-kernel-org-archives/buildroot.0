From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 30 Mar 2020 13:21:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/ntp: bump to version 4.2.8p14
Message-ID: <20200330112144.3051-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"This release fixes three security issues in ntpd and provides 46
bugfixes and addresses 4 other issues." [1]

[1] http://support.ntp.org/bin/view/Main/SecurityNotice#March_2020_ntp_4_2_8p14_NTP_Rele

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---

It also seems that the ntp-4.2.8p13.tar.gz file has changed and thus the
hashes are wrong.

 package/ntp/ntp.hash | 8 ++++----
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index 4014936e61..f6f4d2221c 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,5 +1,5 @@
-# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p13.tar.gz.md5
-md5 ea040ab9b4ca656b5229b89d6b822f13  ntp-4.2.8p13.tar.gz
+# From https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p14.tar.gz.md5
+md5 783edaf1d68ddf651bde64eda54a579d  ntp-4.2.8p14.tar.gz
 # Calculated based on the hash above
-sha256 288772cecfcd9a53694ffab108d1825a31ba77f3a8466b0401baeca3bc232a38  ntp-4.2.8p13.tar.gz
-sha256 3828da5fc8126889d6a64432288ace08526c490bf5427d799931689069968d91  COPYRIGHT
+sha256 1960e4f081f6aafd108d721bc3ab15f9e8dfd08dc08339aa95bca9d2545e4eb7  ntp-4.2.8p14.tar.gz
+sha256 957e6a13445cc61ab1ca3dc80d8c269cf9b0a6d9eaec20f9f39639b0b3e66ee8  COPYRIGHT
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 4cede8b154..3af3e01a52 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p13
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p14
 NTP_SITE = https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent
 NTP_LICENSE = NTP
-- 
2.24.1
