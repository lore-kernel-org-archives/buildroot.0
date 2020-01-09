From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:01:34 +0100
Subject: [Buildroot] [git commit] package/libpcap: remove unnecessary
 dependency on zlib
Message-ID: <20200109155146.84CFB87FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe4b9321e5ef3594776bba443d9718efd766f40e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libpcap package currently depends on zlib, but this is not
needed. The commit removes this non-mandatory dependency.

Signed-off-by: Mircea Gliga <gliga.mircea@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpcap/Config.in  | 1 -
 package/libpcap/libpcap.mk | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libpcap/Config.in b/package/libpcap/Config.in
index 74429f209a..a5f64bdc81 100644
--- a/package/libpcap/Config.in
+++ b/package/libpcap/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBPCAP
 	bool "libpcap"
 	select BR2_PACKAGE_BLUEZ5_UTILS_HEADERS if BR2_PACKAGE_BLUEZ5_UTILS
-	select BR2_PACKAGE_ZLIB
 	help
 	  A system-independent library for user-level network packet
 	  capture.
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 476183555a..881a109a0a 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -9,7 +9,7 @@ LIBPCAP_SITE = http://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
 LIBPCAP_INSTALL_STAGING = YES
-LIBPCAP_DEPENDENCIES = zlib host-flex host-bison
+LIBPCAP_DEPENDENCIES = host-flex host-bison
 
 LIBPCAP_CONF_ENV = \
 	ac_cv_header_linux_wireless_h=yes \
