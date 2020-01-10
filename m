From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 10 Jan 2020 18:28:17 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/snort: needs zlib
Message-ID: <20200110172818.17155-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  checking zlib.h usability... no
  checking zlib.h presence... no
  checking for zlib.h... no

     ERROR!  zlib header not found, go get it from
     http://www.zlib.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/snort/Config.in | 1 +
 package/snort/snort.mk  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/snort/Config.in b/package/snort/Config.in
index 7d2c52c3f3..fc74efcfed 100644
--- a/package/snort/Config.in
+++ b/package/snort/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SNORT
 	select BR2_PACKAGE_DAQ
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_ZLIB
 	help
 	  Snort is a free and open source network intrusion
 	  prevention system (IPS) and network intrusion detection
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 024c94162b..4006d176bf 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -9,7 +9,7 @@ SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
 
-SNORT_DEPENDENCIES = libpcap libdnet daq pcre host-pkgconf
+SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
 
 # patching configure.in
 SNORT_AUTORECONF = YES
-- 
2.24.1
