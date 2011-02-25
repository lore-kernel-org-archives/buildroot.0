From: Will Newton <will.newton@gmail.com>
Date: Fri, 25 Feb 2011 17:46:27 +0000
Subject: [Buildroot] [PATCH 3/8] gnuconfig: Remove gnuconfig patch as it has
	been merged upstream.
Message-ID: <AANLkTi=i807aZKhpQyU6bG1i4fSTcYDhhjfSZ_uxZZwa@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/gnuconfig/patches/config.xtensa.glob.patch |   44 --------------------
 1 files changed, 0 insertions(+), 44 deletions(-)
 delete mode 100644 package/gnuconfig/patches/config.xtensa.glob.patch

diff --git a/package/gnuconfig/patches/config.xtensa.glob.patch
b/package/gnuconfig/patches/config.xtensa.glob.patch
deleted file mode 100644
index 4b37aa7..0000000
--- a/package/gnuconfig/patches/config.xtensa.glob.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-diff -rNdup config-orig/config.guess config/config.guess
---- config-orig/config.guess	2007-11-13 16:31:20.000000000 -0800
-+++ config/config.guess	2007-11-14 00:26:39.000000000 -0800
-@@ -954,8 +954,8 @@ EOF
-     x86_64:Linux:*:*)
- 	echo x86_64-unknown-linux-gnu
- 	exit ;;
--    xtensa:Linux:*:*)
--    	echo xtensa-unknown-linux-gnu
-+    xtensa*:Linux:*:*)
-+    	echo ${UNAME_MACHINE}-unknown-linux-gnu
- 	exit ;;
-     i*86:Linux:*:*)
- 	# The BFD linker knows what the default object file format is, so
-diff -rNdup config-orig/config.sub config/config.sub
---- config-orig/config.sub	2007-11-13 16:31:20.000000000 -0800
-+++ config/config.sub	2007-11-14 00:48:37.000000000 -0800
-@@ -369,10 +369,14 @@ case $basic_machine in
- 	| v850-* | v850e-* | vax-* \
- 	| we32k-* \
- 	| x86-* | x86_64-* | xc16x-* | xps100-* | xscale-* | xscalee[bl]-* \
--	| xstormy16-* | xtensa-* \
-+	| xstormy16-* | xtensa*-* \
- 	| ymp-* \
- 	| z8k-*)
- 		;;
-+	# Recognize the basic CPU types without company name, with glob match.
-+	xtensa*)
-+		basic_machine=$basic_machine-unknown
-+		;;
- 	# Recognize the various machine names and aliases which stand
- 	# for a CPU type and a company and sometimes even an OS.
- 	386bsd)
-diff -rNdup config-orig/testsuite/config-sub.data
config/testsuite/config-sub.data
---- config-orig/testsuite/config-sub.data	2007-11-13 15:56:17.000000000 -0800
-+++ config/testsuite/config-sub.data	2007-11-14 00:31:22.000000000 -0800
-@@ -109,6 +109,7 @@ fido-elf			fido-unknown-elf
- fido				fido-unknown-none
- xtensa-elf			xtensa-unknown-elf
- xtensa-linux			xtensa-unknown-linux-gnu
-+xtensa_dc232b-linux		xtensa_dc232b-unknown-linux-gnu
- i386-drops1.0			i386-pc-drops1.0
- mep				mep-unknown-elf
- mep-elf				mep-unknown-elf
-- 
1.7.3.4
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-gnuconfig-Remove-gnuconfig-patch-as-it-has-been-merg.patch
Type: text/x-patch
Size: 2517 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110225/ec7e8ec8/attachment-0001.bin>
