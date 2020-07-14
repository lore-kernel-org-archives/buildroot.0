From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:17:51 +0200
Subject: [Buildroot] [git commit] package/libfribidi: bump to version 1.0.9
Message-ID: <20200714132047.3549786130@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7450fa41009c5fc22eff8b6ce52581f1e92f8d41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...olate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch | 30 ----------------------
 package/libfribidi/libfribidi.hash                 |  4 +--
 package/libfribidi/libfribidi.mk                   |  4 +--
 3 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch b/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch
deleted file mode 100644
index b78f9b2111..0000000000
--- a/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 034c6e9a1d296286305f4cfd1e0072b879f52568 Mon Sep 17 00:00:00 2001
-From: Dov Grobgeld <dov.grobgeld@gmail.com>
-Date: Thu, 24 Oct 2019 09:37:29 +0300
-Subject: [PATCH] Truncate isolate_level to FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL
-
-CVE-2019-18397
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/fribidi-bidi.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/lib/fribidi-bidi.c b/lib/fribidi-bidi.c
-index 6c84392..d384878 100644
---- a/lib/fribidi-bidi.c
-+++ b/lib/fribidi-bidi.c
-@@ -747,7 +747,9 @@ fribidi_get_par_embedding_levels_ex (
-             }
- 
- 	  RL_LEVEL (pp) = level;
--          RL_ISOLATE_LEVEL (pp) = isolate_level++;
-+          RL_ISOLATE_LEVEL (pp) = isolate_level;
-+          if (isolate_level < FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL-1)
-+              isolate_level++;
-           base_level_per_iso_level[isolate_level] = new_level;
- 
- 	  if (!FRIBIDI_IS_NEUTRAL (override))
--- 
-2.20.1
-
diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
index eba767668d..9856f4eaa2 100644
--- a/package/libfribidi/libfribidi.hash
+++ b/package/libfribidi/libfribidi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 5ab5f21e9f2fc57b4b40f8ea8f14dba78a5cc46d9cf94bc5e00a58e6886a935d  fribidi-1.0.7.tar.bz2
-sha256 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
+sha256  c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7ad90a054d36e0c7  fribidi-1.0.9.tar.xz
+sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 0e17be6db0..6818b13425 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 1.0.7
-LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
+LIBFRIBIDI_VERSION = 1.0.9
+LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
 LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
 LIBFRIBIDI_LICENSE = LGPL-2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
