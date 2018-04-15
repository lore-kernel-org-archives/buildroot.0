From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:42 +0200
Subject: [Buildroot] [git commit] libsepol: remove Blackfin patch
Message-ID: <20180415200630.3A06B8831B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31e5b10ea895eb1260388833dbfec7dd549996c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-only.patch => 0002-support-static-only.patch} |  0
 .../libsepol/0002-workaround-blackfin-issue.patch  | 26 ----------------------
 ...elative.patch => 0003-revert-ln-relative.patch} |  0
 3 files changed, 26 deletions(-)

diff --git a/package/libsepol/0003-support-static-only.patch b/package/libsepol/0002-support-static-only.patch
similarity index 100%
rename from package/libsepol/0003-support-static-only.patch
rename to package/libsepol/0002-support-static-only.patch
diff --git a/package/libsepol/0002-workaround-blackfin-issue.patch b/package/libsepol/0002-workaround-blackfin-issue.patch
deleted file mode 100644
index 3c3bd4827f..0000000000
--- a/package/libsepol/0002-workaround-blackfin-issue.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Do not make symbols hidden on Blackfin
-
-The libselinux logic to hide internal symbols from the DSO doesn't
-work properly on Blackfin due to the USER_LABEL_PREFIX not being
-handled properly. A real fix is not that simple, so this patch simply
-disables the internal symbol hiding mechanism. This means that those
-symbols are visible in the final DSO, which is not a problem for
-proper execution, it just isn't as clean.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-
-Index: b/src/dso.h
-===================================================================
---- a/src/dso.h
-+++ b/src/dso.h
-@@ -5,7 +5,7 @@
-     #define DISABLE_SYMVER 1
- #endif
- 
--#ifdef SHARED
-+#if defined(SHARED) && !defined(__bfin__)
- # define hidden __attribute__ ((visibility ("hidden")))
- # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
- # define __hidden_proto(fct, internal)	\
-
diff --git a/package/libsepol/0004-revert-ln-relative.patch b/package/libsepol/0003-revert-ln-relative.patch
similarity index 100%
rename from package/libsepol/0004-revert-ln-relative.patch
rename to package/libsepol/0003-revert-ln-relative.patch
