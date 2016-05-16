From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 May 2016 20:00:13 -0300
Subject: [Buildroot] [PATCH] tar: bump to version 1.29
Message-ID: <1463439613-5397-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch is upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tar/0001-fix-build-failure.patch | 52 --------------------------------
 package/tar/tar.hash                     |  4 +--
 package/tar/tar.mk                       |  2 +-
 3 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 package/tar/0001-fix-build-failure.patch

diff --git a/package/tar/0001-fix-build-failure.patch b/package/tar/0001-fix-build-failure.patch
deleted file mode 100644
index 8550a3e..0000000
--- a/package/tar/0001-fix-build-failure.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Status: upstream
-http://git.savannah.gnu.org/cgit/tar.git/commit/?id=e9ddc08da0982f36581ae5a8c7763453ff41cfe8
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-From e9ddc08da0982f36581ae5a8c7763453ff41cfe8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 24 Sep 2014 21:22:16 +0000
-Subject: Bugfixes.
-
-* doc/tar.1: Fix typo in font spec.
-* src/tar.c (sort_mode_arg, sort_mode_flag): Protect "inode"
-(SAVEDIR_SORT_INODE) with D_INO_IN_DIRENT
----
-diff --git a/doc/tar.1 b/doc/tar.1
-index 9000627..b91de63 100644
---- a/doc/tar.1
-+++ b/doc/tar.1
-@@ -879,7 +879,7 @@ Exclude files matching patterns listed in FILE.
- \fB\-\-strip\-components\fR=\fINUMBER\fR
- Strip \fINUMBER\fR leading components from file names on extraction.
- .TP
--\fB\-\-transform\fR=\fIEXPRESSION\dR, \fB\-\-xform\fR=\fIEXPRESSION\fR
-+\fB\-\-transform\fR=\fIEXPRESSION\fR, \fB\-\-xform\fR=\fIEXPRESSION\fR
- Use sed replace \fIEXPRESSION\fR to transform file names.
- .SS File name matching options
- These options affect both exclude and include patterns.
-diff --git a/src/tar.c b/src/tar.c
-index 225c624..f8102e0 100644
---- a/src/tar.c
-+++ b/src/tar.c
-@@ -1341,14 +1341,18 @@ static char filename_terminator;
- static char const *const sort_mode_arg[] = {
-   "none",
-   "name",
-+#if D_INO_IN_DIRENT
-   "inode",
-+#endif
-   NULL
- };
- 
- static int sort_mode_flag[] = {
-     SAVEDIR_SORT_NONE,
-     SAVEDIR_SORT_NAME,
-+#if D_INO_IN_DIRENT
-     SAVEDIR_SORT_INODE
-+#endif
- };
- 
- ARGMATCH_VERIFY (sort_mode_arg, sort_mode_flag);
---
-cgit v0.9.0.2
diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 5d2f1db..e563456 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking signature
-sha256	64ee8d88ec1b47a0961033493f919d27218c41b580138fd6802327462aff22f2	tar-1.28.tar.xz
-sha256	a3906a862f83dac1dfaf0ed200c62bd21f6d00f184a7f42b91978593a8553104	tar-1.28.cpio.gz
+sha256	402dcfd0022fd7a1f2c5611f5c61af1cd84910a760a44a688e18ddbff4e9f024	tar-1.29.tar.xz
+sha256	9173f222464dd3676118408840da5990527062b5c7daf6487bed7c396c45bfb1	tar-1.29.cpio.gz
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 2b47e33..767c02f 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.28
+TAR_VERSION = 1.29
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
-- 
2.7.3
