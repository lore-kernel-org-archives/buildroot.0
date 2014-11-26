From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 26 Nov 2014 11:19:01 -0300
Subject: [Buildroot] [PATCH] valgrind: bump to version 3.10.1
Message-ID: <1417011541-26934-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file and switch to a non-dead homepage.
Enable for supported architectures: powerpc64 & powerpc64le.
Even though aarch64 is supported it's still a bit rought resulting in
build failures so don't enable it for now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/valgrind/Config.in     | 9 +++++----
 package/valgrind/valgrind.hash | 2 ++
 package/valgrind/valgrind.mk   | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)
 create mode 100644 package/valgrind/valgrind.hash

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index b7521b0..558d5f0 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,12 +1,13 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
-	depends on BR2_i386 || BR2_x86_64 || BR2_ARM_CPU_ARMV7A || \
-		   BR2_powerpc || BR2_mips || BR2_mipsel || BR2_mips64 || \
-		   BR2_mips64el
+	depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || \
+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64el || \
+		   BR2_x86_64
 	help
 	  Tool for debugging and profiling Linux programs.
 
-	  http://valgrind.kde.org/
+	  http://valgrind.org/
 
 if BR2_PACKAGE_VALGRIND
 
diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
new file mode 100644
index 0000000..f311ea4
--- /dev/null
+++ b/package/valgrind/valgrind.hash
@@ -0,0 +1,2 @@
+# From http://valgrind.org/downloads/current.html
+md5	60ddae962bc79e7c95cfc4667245707f	valgrind-3.10.1.tar.bz2
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index b65e048..aaca39f 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VALGRIND_VERSION = 3.10.0
+VALGRIND_VERSION = 3.10.1
 VALGRIND_SITE = http://valgrind.org/downloads
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
-- 
2.0.4
