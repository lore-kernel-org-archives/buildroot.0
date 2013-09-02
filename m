From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:37 +0200
Subject: [Buildroot] [PATCHv2 11/14] toolchain: move elf2flt option
	inclusion to toolchain-buildroot/Config.in
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-12-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only remaining thing in toolchain-buildroot/Config.in.2 is the
inclusion of the elf2flt option. It doesn't really make sense to have
a separate Config.in file for that, so let's move this to
toolchain-buildroot/Config.in.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                       | 1 -
 toolchain/toolchain-buildroot/Config.in   | 1 +
 toolchain/toolchain-buildroot/Config.in.2 | 9 ---------
 3 files changed, 1 insertion(+), 10 deletions(-)
 delete mode 100644 toolchain/toolchain-buildroot/Config.in.2

diff --git a/toolchain/Config.in b/toolchain/Config.in
index da9cd68..51c83d9 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -62,6 +62,5 @@ source "toolchain/toolchain-buildroot/Config.in"
 source "toolchain/toolchain-external/Config.in"
 source "toolchain/toolchain-crosstool-ng/Config.in"
 source "toolchain/toolchain-common.in"
-source "toolchain/toolchain-buildroot/Config.in.2"
 
 endmenu
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 060b494..0ebbd6c 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -68,4 +68,5 @@ source "package/uclibc/Config.in"
 
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
+source "package/elf2flt/Config.in.host"
 endif
diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
deleted file mode 100644
index df26079..0000000
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ /dev/null
@@ -1,9 +0,0 @@
-# Buildroot backend specific options
-
-if BR2_TOOLCHAIN_BUILDROOT
-
-comment "Toolchain Options"
-
-source "package/elf2flt/Config.in.host"
-
-endif
-- 
1.8.1.2
