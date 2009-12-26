From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 26 Dec 2009 09:13:10 +0100
Subject: [Buildroot] [git commit master] Drop generic package selection
	(access point, firewall, dev system)
Message-ID: <20091226081418.4C2A5776DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4833d1355cfd02c157c3d7320c2254157beb86b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #813.

Drop generic package selection (access point, firewall, dev system) since
they're too ambiguous and not very useful.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    1 +
 target/generic/Config.in |   63 ----------------------------------------------
 2 files changed, 1 insertions(+), 63 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9894db9..b87cf23 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,7 @@
 	#767: Bump iw package to 0.9.18
 	#773: [SECURITY] Update bind to 9.5.2-P1
 	#795: Minor edits to fix typos, grammar, spelling, usage in documen...
+	#813: Drop not very useful generic package selection options ...
 	#823: Editor backup files (~) is copied from the target_skeleton
 	#827: Bump mtd-utils package to version 1.2.0
 
diff --git a/target/generic/Config.in b/target/generic/Config.in
index b70874a..54ff1d6 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -1,66 +1,3 @@
-comment "Generic System Support"
-
-config BR2_TARGET_GENERIC_ACCESS_POINT
-	bool "Generic wireless access point"
-	select BR2_PACKAGE_WIRELESS_TOOLS
-	select BR2_PACKAGE_DHCP_RELAY
-	select BR2_PACKAGE_BRIDGE
-	help
-	  Board support for a generic wireless access point.
-
-
-config BR2_TARGET_GENERIC_FIREWALL
-	bool "Generic firewall"
-	select BR2_PACKAGE_IPTABLES
-	help
-	  Board support for a generic firewalling router.
-
-
-config BR2_TARGET_GENERIC_DEV_SYSTEM
-	bool "Generic development system"
-	depends on BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION
-	select BR2_CCACHE
-	select BR2_PACKAGE_GDB
-	select BR2_PACKAGE_GDB_SERVER
-	select BR2_PACKAGE_BASH
-	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_COREUTILS
-	select BR2_PACKAGE_DIFFUTILS
-	select BR2_PACKAGE_ED
-	select BR2_PACKAGE_FINDUTILS
-	select BR2_PACKAGE_FLEX
-	select BR2_PACKAGE_GAWK
-	select BR2_PACKAGE_GCC_TARGET
-	select BR2_PACKAGE_CCACHE_TARGET
-	select BR2_PACKAGE_GREP
-	select BR2_PACKAGE_MAKE
-	select BR2_PACKAGE_PATCH
-	select BR2_PACKAGE_SED
-	select BR2_PACKAGE_TAR
-	select BR2_PACKAGE_MICROPERL
-	select BR2_PACKAGE_AUTOCONF
-	select BR2_PACKAGE_AUTOMAKE
-	select BR2_PACKAGE_DROPBEAR
-	select BR2_PACKAGE_FILE
-	select BR2_PACKAGE_GZIP
-	select BR2_PACKAGE_LESS
-	select BR2_PACKAGE_LIBTOOL
-	select BR2_PACKAGE_M4
-	select BR2_PACKAGE_E2FSPROGS
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_NETKITBASE
-	select BR2_PACKAGE_PCIUTILS
-	select BR2_PACKAGE_PROCPS
-	select BR2_PACKAGE_RSYNC
-	select BR2_PACKAGE_STRACE
-	select BR2_PACKAGE_UTIL-LINUX
-	select BR2_PACKAGE_ZLIB
-	help
-	  Board support for a generic development system.
-
-comment "Generic development system requires a toolchain with WCHAR and PROGRAM_INVOCATION support"
-	depends on !(BR2_USE_WCHAR && BR2_PROGRAM_INVOCATION)
-
 if !(BR2_TARGET_ATMEL||BR2_TARGET_KWIKBYTE||BR2_TARGET_VALKA)
 
 config BR2_TARGET_GENERIC_HOSTNAME
-- 
1.6.3.3
