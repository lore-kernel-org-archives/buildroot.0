From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 16:35:49 +0100
Subject: [Buildroot] [git commit] strace: bump to version 4.11
Message-ID: <20151222153557.31F118267E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97f7d7061d9c1afe23c6fb29d100fc92998698da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-linux-aarch64-add-missing-header.patch    | 25 ----------------------
 package/strace/strace.hash                         |  6 +++---
 package/strace/strace.mk                           |  2 +-
 3 files changed, 4 insertions(+), 29 deletions(-)

diff --git a/package/strace/0001-linux-aarch64-add-missing-header.patch b/package/strace/0001-linux-aarch64-add-missing-header.patch
deleted file mode 100644
index 2b74775..0000000
--- a/package/strace/0001-linux-aarch64-add-missing-header.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e1e838360288805b6cb561c21e4e7a1ea32e7772 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sat, 4 Apr 2015 00:49:52 +0200
-Subject: [PATCH] linux/aarch64: add missing header.
-
-linux/aarch64/arch_regs.h file is missing in the strace-4.10.tar.xz archive.
-Add the one from the release 4.10 tag.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- linux/aarch64/arch_regs.h | 2 ++
- 1 file changed, 2 insertions(+)
- create mode 100644 linux/aarch64/arch_regs.h
-
-diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
-new file mode 100644
-index 0000000..9a5e33e
---- /dev/null
-+++ b/linux/aarch64/arch_regs.h
-@@ -0,0 +1,2 @@
-+extern uint64_t *const aarch64_sp_ptr;
-+extern uint32_t *const arm_sp_ptr;
--- 
-1.9.3
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index a2a1081..f47d51b 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/strace/files/strace/4.10/
-md5	107a5be455493861189e9b57a3a51912	strace-4.10.tar.xz
-sha1	5c3ec4c5a9eeb440d7ec70514923c2e7e7f9ab6c	strace-4.10.tar.xz
+# From http://sourceforge.net/projects/strace/files/strace/4.11/
+md5	a15d2555a7febb56d00c6e1a51c655dc	strace-4.11.tar.xz
+sha1	8fd717dc3c51b69fde51ce0bdb066404a678363c	strace-4.11.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 2df2ec6..e25428e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.10
+STRACE_VERSION = 4.11
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
