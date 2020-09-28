From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 28 Sep 2020 09:41:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: bump version to 3.1
Message-ID: <20200928074135.21207-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From release note:

Version 3.1 - September 2020

This release offers substantial new functionality. Users are encouraged
to upgrade. The most notable changes are as follows.

* Fixes non-functional NMEA mode of the ts2phc program (since 3.0)
* Improves system time synchronization via the PTP_SYS_OFFSET_PRECISE
  and PTP_SYS_OFFSET_EXTENDED ioctls.
* Supports implementing a PTP GM clock by using a GPS radio or other
  PPS time source.
* Provides per-port statistics via the management interface.
* Implements IEEE 1588 v2.1 slave event monitoring.
* Adds Automotive Profile support.y

 utils/test-pkg -p linuxptp
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: OK
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/linuxptp/linuxptp.hash | 6 +++---
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index de82ff2b84..4f8a1f89fc 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,9 +1,9 @@
 # From https://sourceforge.net/projects/linuxptp/files/v3.0/
-sha1  cf56f1ab6c622a569be8c14d2cb121f0183affc9  linuxptp-3.0.tgz
-md5  1318805702eb6d59f9f247e1dd5ce12a  linuxptp-3.0.tgz
+sha1  9a3869dbd322252c9a6bc0dbdfe8941586810a7f  linuxptp-3.1.tgz
+md5  2264cb69c9af947028835c12c89a7572  linuxptp-3.1.tgz
 
 # Locally computed:
-sha256  d74ceca722c75bfff53c633425f926dd48eb04f4a089451b855155c016d15785  linuxptp-3.0.tgz
+sha256  f58f5b11cf14dc7c4f7c9efdfb27190e43d02cf20c3525f6639edac10528ce7d  linuxptp-3.1.tgz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 3d018a4657..f91be921af 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 3.0
+LINUXPTP_VERSION = 3.1
 LINUXPTP_SOURCE = linuxptp-$(LINUXPTP_VERSION).tgz
 LINUXPTP_SITE = http://downloads.sourceforge.net/linuxptp
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.20.1
