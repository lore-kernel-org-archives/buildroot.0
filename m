From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Date: Thu, 28 Aug 2014 14:21:34 +0200
Subject: [Buildroot] [PATCH V3 4/4] libelf: Removes the package
In-Reply-To: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <1409228494-19492-5-git-send-email-gregory.clement@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The elfutils package provides a more recent version of the
libelf. Some packages such as ltrace need this more recent
version. Having two packages providing the same library leads to some
conflicts or dependency problems. For instance at the end we had only
one libelf.a when the 2 packages were selected.

Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
---
 Config.in.legacy                                |     9 +
 package/Config.in                               |     1 -
 package/libelf/Config.in                        |     7 -
 package/libelf/libelf-0.8.10-Elf64-fixups.patch | 12361 ----------------------
 package/libelf/libelf.mk                        |    23 -
 5 files changed, 9 insertions(+), 12392 deletions(-)
 delete mode 100644 package/libelf/Config.in
 delete mode 100644 package/libelf/libelf-0.8.10-Elf64-fixups.patch
 delete mode 100644 package/libelf/libelf.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 23962a2..5b1460c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.08"
 
+config BR2_PACKAGE_LIBELF
+	bool "libelf has been removed"
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_LEGACY
+	help
+	  The libelf package provided an old version of the libelf library
+	  and is deprecated. The libelf library is now provided by the
+	  elfutils package.
+
 config BR2_KERNEL_HEADERS_3_8
 	bool "kernel headers version 3.8.x are no longer supported"
 	select BR2_KERNEL_HEADERS_3_9
diff --git a/package/Config.in b/package/Config.in
index 0e10cdf..da528ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -841,7 +841,6 @@ menu "Other"
 	source "package/libcofi/Config.in"
 	source "package/libdaemon/Config.in"
 	source "package/libee/Config.in"
-	source "package/libelf/Config.in"
 	source "package/libev/Config.in"
 	source "package/libevdev/Config.in"
 	source "package/libevent/Config.in"
diff --git a/package/libelf/Config.in b/package/libelf/Config.in
deleted file mode 100644
index 600ef68..0000000
diff --git a/package/libelf/libelf-0.8.10-Elf64-fixups.patch b/package/libelf/libelf-0.8.10-Elf64-fixups.patch
deleted file mode 100644
index 86a064a..0000000
diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
deleted file mode 100644
index 0c37697..0000000
-- 
1.9.1
