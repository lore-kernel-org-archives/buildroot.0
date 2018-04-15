From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:38 +0200
Subject: [Buildroot] [git commit] libselinux: remove Blackfin patch
Message-ID: <20180415200630.02EE0886C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b31b50ef4088deeee07574e0c19de7fc207a132
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber the remaining patches.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-musl-build.patch => 0001-fix-musl-build.patch} |  0
 .../0001-workaround-blackfin-issue.patch           | 24 ----------------------
 ...uild-follow-standard-semantics-for-DESTD.patch} |  0
 ...elative.patch => 0003-revert-ln-relative.patch} |  0
 4 files changed, 24 deletions(-)

diff --git a/package/libselinux/0002-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
similarity index 100%
rename from package/libselinux/0002-fix-musl-build.patch
rename to package/libselinux/0001-fix-musl-build.patch
diff --git a/package/libselinux/0001-workaround-blackfin-issue.patch b/package/libselinux/0001-workaround-blackfin-issue.patch
deleted file mode 100644
index 5d00c6983b..0000000000
--- a/package/libselinux/0001-workaround-blackfin-issue.patch
+++ /dev/null
@@ -1,24 +0,0 @@
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
-
-Index: b/src/dso.h
-===================================================================
---- a/src/dso.h
-+++ b/src/dso.h
-@@ -1,7 +1,7 @@
- #ifndef _SELINUX_DSO_H
- #define _SELINUX_DSO_H	1
- 
--#ifdef SHARED
-+#if defined(SHARED) && !defined(__bfin__)
- # define hidden __attribute__ ((visibility ("hidden")))
- # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
- # define __hidden_proto(fct, internal)	\
diff --git a/package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch b/package/libselinux/0002-libselinux-build-follow-standard-semantics-for-DESTD.patch
similarity index 100%
rename from package/libselinux/0003-libselinux-build-follow-standard-semantics-for-DESTD.patch
rename to package/libselinux/0002-libselinux-build-follow-standard-semantics-for-DESTD.patch
diff --git a/package/libselinux/0004-revert-ln-relative.patch b/package/libselinux/0003-revert-ln-relative.patch
similarity index 100%
rename from package/libselinux/0004-revert-ln-relative.patch
rename to package/libselinux/0003-revert-ln-relative.patch
