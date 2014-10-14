From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:53:00 -0300
Subject: [Buildroot] [PATCH] binutils: drop stray patch
Message-ID: <1413283980-20266-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../001-fix-enable-install-libiberty-flag.patch    | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 package/binutils/8351467c933d277ebea0c8d99ad2b65b5f7b6bc2/001-fix-enable-install-libiberty-flag.patch

diff --git a/package/binutils/8351467c933d277ebea0c8d99ad2b65b5f7b6bc2/001-fix-enable-install-libiberty-flag.patch b/package/binutils/8351467c933d277ebea0c8d99ad2b65b5f7b6bc2/001-fix-enable-install-libiberty-flag.patch
deleted file mode 100644
index e408401..0000000
--- a/package/binutils/8351467c933d277ebea0c8d99ad2b65b5f7b6bc2/001-fix-enable-install-libiberty-flag.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 369be6981b26787b2685e3b8c6da779dae8ce35f Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Mon, 6 Jan 2014 18:15:31 +0000
-Subject: [PATCH] libiberty: fix --enable-install-libiberty flag [PR 56780]
-
-Commit 199570 fixed the --disable-install-libiberty behavior, but it also
-added a bug where the enable path never works because the initial clear
-of target_header_dir wasn't deleted.  So we end up initializing properly
-at the top only to reset it at the end all the time.
-
-[Arnout: adapt to match 2.24 tarball]
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 206367 138bc75d-0d04-0410-961f-82ee72b054a4
----
- libiberty/configure    |    1 -
- libiberty/configure.ac |    1 -
- 3 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/libiberty/configure b/libiberty/configure
-index 8ea54da..7bde9b3 100755
---- a/libiberty/configure
-+++ b/libiberty/configure
-@@ -5507,7 +5507,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
-diff --git a/libiberty/configure.ac b/libiberty/configure.ac
-index 4ad88a9..d6180bc 100644
---- a/libiberty/configure.ac
-+++ b/libiberty/configure.ac
-@@ -405,7 +405,6 @@ fi
- 
- setobjs=
- CHECK=
--target_header_dir=
- if test -n "${with_target_subdir}"; then
- 
-   # We are being configured as a target library.  AC_REPLACE_FUNCS
--- 
-1.7.1
-
-- 
2.0.4
