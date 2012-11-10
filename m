From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 10 Nov 2012 01:40:25 +0100
Subject: [Buildroot] [PATCH] Revert "auto{conf,
	make}: only make available on archs supported by qemu"
Message-ID: <1352508025-32365-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Since perl no longer requires host-qemu, autoconf and automake work
again on the architectures that are not supported by host-qemu.

This reverts commit c65d92e8e2767b09aaee6b717cbd9b66f88ea39c.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/autoconf/Config.in |    4 ----
 package/automake/Config.in |    4 ----
 2 files changed, 8 deletions(-)

diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index c304572..5f2f148 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
-	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.
 
 	  http://www.gnu.org/software/autoconf/
-
-comment "autoconf requires an architecture supported by qemu"
-	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
diff --git a/package/automake/Config.in b/package/automake/Config.in
index f8d74ef..9a9673a 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
-	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
@@ -8,6 +7,3 @@ config BR2_PACKAGE_AUTOMAKE
 	  configure scripts (made by autoconf).
 
 	  http://www.gnu.org/software/automake/
-
-comment "automake requires an architecture supported by qemu"
-	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
-- 
1.7.10.4
