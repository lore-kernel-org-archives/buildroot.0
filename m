From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Nov 2009 09:54:00 +0100
Subject: [Buildroot] [git commit master] package/ltrace: hide for archs
	ltrace doesn't support
Message-ID: <20091129085907.ED928777DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69067025c08c5c4f4d3bcfd829a352d2338f7e98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-By: Michael S. Zick" <minimod@morethan.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/ltrace/Config.in |    5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index e5bd233..d37b582 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not released yet:
 
-	Updated/fixed packages: busybox, dbus, gvfs
+	Updated/fixed packages: busybox, dbus, gvfs, ltrace
 
 2009.11-rc1, Released November 23rd, 2009:
 
diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
index 8e090a4..72f57b1 100644
--- a/package/ltrace/Config.in
+++ b/package/ltrace/Config.in
@@ -1,9 +1,6 @@
-comment "ltrace has no inherent support for AVR32" 
-	depends on BR2_avr32 && BR2_PACKAGE_LTRACE
-
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
-	#depends on BR2_LARGEFILE
+	depends on !(BR2_avr32 || BR2_cris || BR2_mips || BR2_mipsel || BR2_nios2 || BR2_sh || BR2_sh64 || BR2_xtensa)
 	select BR2_PACKAGE_LIBELF
 	help
 	  Debugging program which runs a specified command until it exits.
-- 
1.6.3.3
