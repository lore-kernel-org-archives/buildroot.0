From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Fri, 28 Sep 2007 00:36:22 -0400
Subject: [Buildroot] GNU BInutils and TeXinfo v. 4.11 - patch proposed
Message-ID: <bcba51a0709272136j6848589br9ecb928773c63e7c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here is a patch that was tested with binutils 2.18 (also attached):

============= 100-makeinfo-version.patch ===============

diff -u binutils-2.18-orig/configure binutils-2.18/configure
--- binutils-2.18-orig/configure        2007-08-06 16:29:40.000000000 -0400
+++ binutils-2.18/configure     2007-09-27 22:41:51.000000000 -0400
@@ -6125,10 +6125,10 @@
   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
   *)

-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
     # higher, else we use the "missing" dummy.
     if ${MAKEINFO} --version \
-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null
2>&1; then
+       | egrep
'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null
2>&1; then
       :
     else
       MAKEINFO="$MISSING makeinfo"
diff -u binutils-2.18-orig/configure.ac binutils-2.18/configure.ac
--- binutils-2.18-orig/configure.ac     2007-08-28 16:24:26.000000000 -0400
+++ binutils-2.18/configure.ac  2007-09-27 22:41:00.000000000 -0400
@@ -2400,10 +2400,10 @@
   *" texinfo "*) MAKEINFO='$$r/$(BUILD_SUBDIR)/texinfo/makeinfo/makeinfo' ;;
   *)
 changequote(,)
-    # For an installed makeinfo, we require it to be from texinfo 4.4 or
+    # For an installed makeinfo, we require it to be from texinfo 4.6 or
     # higher, else we use the "missing" dummy.
     if ${MAKEINFO} --version \
-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null
2>&1; then
+       | egrep
'texinfo[^0-9]*(4\.([6-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null
2>&1; then
       :
     else
       MAKEINFO="$MISSING makeinfo"


============= /100-makeinfo-version.patch===============

Relevant portion of build log:

=================================================
# Apply appropriate binutils patches.
toolchain/patch-kernel.sh
/home/dima/buildroot/toolchain_build_i686/binutils-2.18
toolchain/binutils/2.18 \*.patch

Applying 100-makeinfo-version.patch using plaintext:
patching file configure
patching file configure.ac

Applying 110-arm-eabi-conf.patch using plaintext:
patching file configure
Hunk #1 succeeded at 2235 with fuzz 1 (offset 11 lines).
patching file configure.ac
Hunk #1 succeeded at 513 with fuzz 1.

Applying 300-001_ld_makefile_patch.patch using plaintext:
patching file ld/Makefile.am
patching file ld/Makefile.in

Applying 300-012_check_ldrunpath_length.patch using plaintext:
patching file ld/emultempl/elf32.em
Hunk #1 succeeded at 1216 (offset 209 lines).

=================================================

I haven't done anything for 2.18.50 yet - it is believed that the same
patch would apply.

Thanks.

Dimitry
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 100-makeinfo-version.patch
Type: application/octet-stream
Size: 1553 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070928/9ae4d4c4/attachment.obj 
