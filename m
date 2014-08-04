From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 16:34:55 -0300
Subject: [Buildroot] [PATCH] exim: security bump to version 4.83
Message-ID: <1407180895-25908-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-2972 - prevent double expansion in math comparison
functions (can expand unsanitized data).
Also rename patches according to patch naming policy.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...or-the-host.patch => exim-0001-Build-buildconfig-for-the-host.patch} | 0
 ...atch => exim-0002-Don-t-make-backup-copies-of-installed-files.patch} | 0
 ...atch => exim-0003-Skip-version-check-and-symlink-installation.patch} | 0
 package/exim/exim.mk                                                    | 2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename package/exim/{exim-Build-buildconfig-for-the-host.patch => exim-0001-Build-buildconfig-for-the-host.patch} (100%)
 rename package/exim/{exim-Don-t-make-backup-copies-of-installed-files.patch => exim-0002-Don-t-make-backup-copies-of-installed-files.patch} (100%)
 rename package/exim/{exim-Skip-version-check-and-symlink-installation.patch => exim-0003-Skip-version-check-and-symlink-installation.patch} (100%)

diff --git a/package/exim/exim-Build-buildconfig-for-the-host.patch b/package/exim/exim-0001-Build-buildconfig-for-the-host.patch
similarity index 100%
rename from package/exim/exim-Build-buildconfig-for-the-host.patch
rename to package/exim/exim-0001-Build-buildconfig-for-the-host.patch
diff --git a/package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch
similarity index 100%
rename from package/exim/exim-Don-t-make-backup-copies-of-installed-files.patch
rename to package/exim/exim-0002-Don-t-make-backup-copies-of-installed-files.patch
diff --git a/package/exim/exim-Skip-version-check-and-symlink-installation.patch b/package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch
similarity index 100%
rename from package/exim/exim-Skip-version-check-and-symlink-installation.patch
rename to package/exim/exim-0003-Skip-version-check-and-symlink-installation.patch
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 8be8e75..845c5f8 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.82.1
+EXIM_VERSION = 4.83
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
-- 
1.8.5.5
