From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 31 Dec 2016 16:33:28 +0100
Subject: [Buildroot] [PATCH] package/intltool: remove target variant
Message-ID: <20161231153328.10960-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The target variant depends on BR2_HOST_ONLY which is just like BROKEN
(i.e not defined anywere). BR2_HOST_ONLY was introduced by [1] back in
2010 and nobody seems to need it. So remove intltool for the target.

[1] 0b876d39776fdec69762b988216e5ed64dbe6ba8

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            | 1 -
 package/intltool/Config.in   | 9 ---------
 package/intltool/intltool.mk | 1 -
 3 files changed, 11 deletions(-)
 delete mode 100644 package/intltool/Config.in

diff --git a/package/Config.in b/package/Config.in
index da9715c..8d7cddf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -138,7 +138,6 @@ menu "Development tools"
 	source "package/git/Config.in"
 	source "package/gperf/Config.in"
 	source "package/grep/Config.in"
-	source "package/intltool/Config.in"
 	source "package/jq/Config.in"
 	source "package/libtool/Config.in"
 	source "package/make/Config.in"
diff --git a/package/intltool/Config.in b/package/intltool/Config.in
deleted file mode 100644
index 4643a89..0000000
--- a/package/intltool/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_INTLTOOL
-	bool "intltool"
-	# Hide from configuration as we only support the host package
-	# for the moment
-	depends on BR2_HOST_ONLY
-	help
-	  Utility scripts for internationalizing XML
-
-	  http://www.freedesktop.org/wiki/Software/intltool
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index fb801a1..dbef80f 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -11,5 +11,4 @@ INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
