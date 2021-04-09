From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Apr 2021 22:41:06 +0200
Subject: [Buildroot] [PATCH] package/clamav: security bump to version 0.103.2
Message-ID: <20210409204106.12638-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2021-1386: Fix for UnRAR DLL load privilege escalation.  Affects
  0.103.1 and prior on Windows only.

- CVE-2021-1252: Fix for Excel XLM parser infinite loop.  Affects 0.103.0
  and 0.103.1 only.

- CVE-2021-1404: Fix for PDF parser buffer over-read; possible crash.
  Affects 0.103.0 and 0.103.1 only.

- CVE-2021-1405: Fix for mail parser NULL-dereference crash.  Affects
  0.103.1 and prior.

- CVE-2021-27506: The ClamAV Engine (Version 0.103.1 and below) embedded in
  Storsmshield Network Security (1.0 to 4.1.5) is subject to DoS in case of
  parsing of malformed png files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 1b2325870d..679240985b 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  7308c47b89b268af3b9f36140528927a49ff3e633a9c9c0aac2712d81056e257  clamav-0.103.1.tar.gz
+sha256  d4b5d0ac666262e423a326fb54778caa7c69624d6c3f9542895feb8478271bd2  clamav-0.103.2.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 4cd13fb827..6ab473ab88 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.1
+CLAMAV_VERSION = 0.103.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.20.1
