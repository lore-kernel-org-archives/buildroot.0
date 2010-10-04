From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 11:44:08 +0200
Subject: [Buildroot] [git commit master 1/1] package: get rid of ".. has no
	inherent support for AVR32" comments
Message-ID: <20101004094443.776FB8B8A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e7b6b32c5db122bced1466e5affea4ca53b6cbb9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are probaly out of date by now, and lack of special handling for
avr32 doesn't mean that a package won't work on avr32, so remove them.

Done by sed -i '/comment.*no inherent support for AVR32/{N;N;p}'

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/argus/Config.in         |    3 ---
 package/bind/Config.in          |    3 ---
 package/dmraid/Config.in        |    3 ---
 package/kismet/Config.in        |    3 ---
 package/libeXosip2/Config.in    |    3 ---
 package/ntfs-3g/Config.in       |    3 ---
 package/openntpd/Config.in      |    3 ---
 package/pciutils/Config.in      |    3 ---
 package/ruby/Config.in          |    3 ---
 package/smartmontools/Config.in |    3 ---
 package/vtun/Config.in          |    3 ---
 11 files changed, 0 insertions(+), 33 deletions(-)

diff --git a/package/argus/Config.in b/package/argus/Config.in
index 0c00126..6728ae7 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -1,6 +1,3 @@
-comment "argus has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_ARGUS
-
 config BR2_PACKAGE_ARGUS
 	bool "argus"
 	select BR2_PACKAGE_LIBPCAP
diff --git a/package/bind/Config.in b/package/bind/Config.in
index 72cf3a0..827ee26 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,6 +1,3 @@
-comment "bind has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_BIND
-
 config BR2_PACKAGE_BIND
 	bool "bind"
 	depends on BR2_LARGEFILE
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
index 7d6ecfb..7b37244 100644
--- a/package/dmraid/Config.in
+++ b/package/dmraid/Config.in
@@ -1,6 +1,3 @@
-comment "dmraid has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_DMRAID
-
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	depends on BR2_LARGEFILE
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 5674fbc..6954665 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,6 +1,3 @@
-comment "Kismet has no inherent support for AVR32"
-	depends on BR2_avr32 && BR2_PACKAGE_KISMET
-
 comment "Kismet requires a toolchain with C++ support enabled"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 5ae3e97..8adca5a 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -1,6 +1,3 @@
-comment "libeXosip2 has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_LIBEXOSIP2
-
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
 	select BR2_PACKAGE_LIBOSIP2
diff --git a/package/ntfs-3g/Config.in b/package/ntfs-3g/Config.in
index 6d737e6..865f9b4 100644
--- a/package/ntfs-3g/Config.in
+++ b/package/ntfs-3g/Config.in
@@ -1,6 +1,3 @@
-comment "ntfs-3g has no inherent support for AVR32"
-	depends on BR2_avr32 && BR2_PACKAGE_NTFS_3G
-
 config BR2_PACKAGE_NTFS_3G
 	bool "ntfs-3g"
 	depends on BR2_LARGEFILE
diff --git a/package/openntpd/Config.in b/package/openntpd/Config.in
index 5292259..6b8beb8 100644
--- a/package/openntpd/Config.in
+++ b/package/openntpd/Config.in
@@ -1,6 +1,3 @@
-comment "OpenNTPD has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_OPENNTPD
-
 config BR2_PACKAGE_OPENNTPD
 	bool "OpenNTPD"
 	help
diff --git a/package/pciutils/Config.in b/package/pciutils/Config.in
index 07fc49b..7b318da 100644
--- a/package/pciutils/Config.in
+++ b/package/pciutils/Config.in
@@ -1,6 +1,3 @@
-comment "pciutils has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_PCIUTILS
-
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
 	help
diff --git a/package/ruby/Config.in b/package/ruby/Config.in
index 518302a..c18d8ad 100644
--- a/package/ruby/Config.in
+++ b/package/ruby/Config.in
@@ -1,6 +1,3 @@
-comment "ruby has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_RUBY
-
 config BR2_PACKAGE_RUBY
 	bool "ruby"
 	depends on BR2_USE_WCHAR
diff --git a/package/smartmontools/Config.in b/package/smartmontools/Config.in
index f87020f..a1541d7 100644
--- a/package/smartmontools/Config.in
+++ b/package/smartmontools/Config.in
@@ -1,6 +1,3 @@
-comment "smartmontools has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_SMARTMONTOOLS
-
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
 	help
diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index ad9d9e5..b40de25 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,6 +1,3 @@
-comment "vtun has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_VTUN
-
 config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
 	select BR2_PACKAGE_LZO
-- 
1.7.1
