From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 26 Mar 2019 23:02:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump to version
 0.101.2
Message-ID: <20190326220255.14363-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.clamav.net/2019/03/clamav-01012-and-01003-patches-have.html

- Fixes for the following vulnerabilities affecting 0.101.1 and prior:
  - CVE-2019-1787:
    An out-of-bounds heap read condition may occur when scanning PDF
    documents. The defect is a failure to correctly keep track of the number
    of bytes remaining in a buffer when indexing file data.
  - CVE-2019-1789:
    An out-of-bounds heap read condition may occur when scanning PE files
    (i.e. Windows EXE and DLL files) that have been packed using Aspack as a
    result of inadequate bound-checking.
  - CVE-2019-1788:
    An out-of-bounds heap write condition may occur when scanning OLE2 files
    such as Microsoft Office 97-2003 documents. The invalid write happens when
    an invalid pointer is mistakenly used to initialize a 32bit integer to
    zero. This is likely to crash the application.

- Fixes for the following vulnerabilities affecting 0.101.1 and 0.101.0 only:
  - CVE-2019-1786:
    An out-of-bounds heap read condition may occur when scanning malformed PDF
    documents as a result of improper bounds-checking.
  - CVE-2019-1785:
    A path-traversal write condition may occur as a result of improper input
    validation when scanning RAR archives. Issue reported by aCaB.
  - CVE-2019-1798:
    A use-after-free condition may occur as a result of improper error
    handling when scanning nested RAR archives. Issue reported by David L.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 9ac68e7607..4b61cd9654 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 fa368fa9b2f57638696150c7d108b06dec284e8d8e3b8e702c784947c01fb806  clamav-0.101.1.tar.gz
+sha256 0a12ebdf6ff7a74c0bde2bdc2b55cae33449e6dd953ec90824a9e01291277634  clamav-0.101.2.tar.gz
 sha256 0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256 d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256 dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 8900b4819a..5bb0aa09d9 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.101.1
+CLAMAV_VERSION = 0.101.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.20.1
