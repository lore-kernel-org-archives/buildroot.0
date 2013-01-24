From: Will Newton <will.newton@gmail.com>
Date: Thu, 24 Jan 2013 11:33:53 +0000
Subject: [Buildroot] [PATCH] gdb: Add support for gdb 7.5.1 and make it the
	default.
Message-ID: <CAFbHwiQ2bqy9HMrWHLan-M3Oy1mFBd2QOkQMoVU=NiAKkd4cQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 toolchain/gdb/Config.in |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

I'm imagine a few of those older version could be safely removed but I am not
sure which versions people are using. Aside from avr32 and bfin is anyone
using a non-7.4 version?

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index 6a8e48e..53dcb93 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -45,7 +45,7 @@ choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_6 if BR2_bfin
 	default BR2_GDB_VERSION_6_7_1_AVR32_2_1_5 if BR2_avr32
-	default BR2_GDB_VERSION_7_4
+	default BR2_GDB_VERSION_7_5
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -95,6 +95,12 @@ choice
 		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)

+	config BR2_GDB_VERSION_7_5
+		bool "gdb 7.5.x"
+		depends on !BR2_bfin
+		depends on BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
+		select BR2_PTHREAD_DEBUG if (BR2_TOOLCHAIN_BUILDROOT && !BR2_PTHREADS_NONE)
+
 endchoice

 comment "gdb support needs pthread debug support in toolchain"
@@ -110,3 +116,4 @@ config BR2_GDB_VERSION
 	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
 	default "7.4.1"    if BR2_GDB_VERSION_7_4
+	default "7.5.1"    if BR2_GDB_VERSION_7_5
-- 
1.7.1
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-gdb-Add-support-for-gdb-7.5.1-and-make-it-the-defaul.patch
Type: application/octet-stream
Size: 1558 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130124/ad467cac/attachment.obj>
