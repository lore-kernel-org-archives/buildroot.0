From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:50:57 +0200
Subject: [Buildroot] [PATCH 03/13] binutils: remove deprecated 2.24.X
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                |  8 ++++++++
 package/binutils/Config.in.host | 11 -----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 2fae812..45814ca 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_BINUTILS_VERSION_2_24_X
+	bool "binutils version 2.24 support removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils version 2.24 has been removed. The
+	  current default version (2.26 or later) has been selected
+	  instead.
+
 config BR2_PACKAGE_WESTON_RPI
 	bool "Weston propietary RPI support is gone"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 5ea5f31..3e0c357 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -7,16 +7,6 @@ choice
 	help
 	  Select the version of binutils you wish to use.
 
-	config BR2_BINUTILS_VERSION_2_24_X
-		depends on BR2_DEPRECATED_SINCE_2016_11
-		# supported, but broken on Nios-II, Blackfin and powerpc64le
-		depends on !BR2_nios2 && !BR2_powerpc64le && !BR2_bfin
-		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
-		# Unsupported ARM cores
-		depends on !BR2_cortex_a17
-		bool "binutils 2.24"
-
 	config BR2_BINUTILS_VERSION_2_25_X
 		bool "binutils 2.25.1"
 		# supported but broken on Blackfin
@@ -33,7 +23,6 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2016.09-eng015"	if BR2_arc
-	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
 	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 	default "2.27"		if BR2_BINUTILS_VERSION_2_27_X
-- 
2.9.3
