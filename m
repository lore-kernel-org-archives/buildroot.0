From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:26:34 +0100
Subject: [Buildroot] [git commit] package/logrotate: bump to 3.18.0 version
Message-ID: <20210129082032.94EBA8152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e0d4fbb2ed633b1840f55128a9ea378adb8b87e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Main reason is to fix the issue when secure_getenv() is missing
in older toolchain, but it was fixed in this version by using
getenv() as alternative.

Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/logrotate/logrotate.hash | 2 +-
 package/logrotate/logrotate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/logrotate/logrotate.hash b/package/logrotate/logrotate.hash
index 704cbcabd6..b3628da7de 100644
--- a/package/logrotate/logrotate.hash
+++ b/package/logrotate/logrotate.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  c25ea219018b024988b791e91e9f6070c34d2056efa6ffed878067866c0ed765  logrotate-3.17.0.tar.gz
+sha256  66232111a2b02cce3c2436c141b7a2af78fa758aac326ab2b79f9a5b0d749142  logrotate-3.18.0.tar.gz
diff --git a/package/logrotate/logrotate.mk b/package/logrotate/logrotate.mk
index 747d8c2930..b765fff4ee 100644
--- a/package/logrotate/logrotate.mk
+++ b/package/logrotate/logrotate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOGROTATE_VERSION = 3.17.0
+LOGROTATE_VERSION = 3.18.0
 LOGROTATE_SITE = $(call github,logrotate,logrotate,$(LOGROTATE_VERSION))
 LOGROTATE_LICENSE = GPL-2.0+
 LOGROTATE_LICENSE_FILES = COPYING
