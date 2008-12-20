From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 20 Dec 2008 21:55:48 +0100
Subject: [Buildroot] [PATCH] Buildroot uClibc-0.9.29 patches not present
	in	uClibc-0.9.30
Message-ID: <1229806548.30378.10.camel@linux-yrgm.site>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-0.9.30 does not build due to uClibc-locale-20081111-*.tgz not
beeing available.

I guess this is the culprit:
------------------------------------------------------------------------
r23997 | aldot | 2008-11-11 12:05:57 +0100 (Tue, 11 Nov 2008) | 3 lines

- update recommendation for pregenerated locales.
- update name of locale-tarball. We will retroactively fill them in, eventually


It is supposed to be on http://www.uclibc.org/downloads" but
is not there.

This patch would revert the locale to use
?uClibc-locale-030818.tgz

Won't commit right now,
because I assume that if the missing tarball can
be found, then it is better to use this one.

Also: I checked the different 0.9.29 patches and it seems
like most are implemented in 0.9.30 but not all.
I enclose the resulting patches for 0.9.30
if we assume that everything in 0.9.29 should be there.

Anyone with more knowledge about uClibc than I, should review.

--------------------------------------------------------------
diff -urN uClibc-0.9.30-0rig/extra/locale/Makefile.in
uClibc-0.9.30/extra/locale/Makefile.in
--- uClibc-0.9.30-0rig/extra/locale/Makefile.in	2008-12-20
18:32:36.000000000 +0100
+++ uClibc-0.9.30/extra/locale/Makefile.in	2008-12-20 18:37:42.000000000
+0100
@@ -11,7 +11,8 @@
 # command used to download source code
 WGET := wget --passive-ftp
 
-LOCALE_DATA_FILENAME := uClibc-locale-20081111-$(ARCH_NATIVE_BIT)-$(if
$(ARCH_LITTLE_ENDIAN),el,eb).tgz
+#LOCALE_DATA_FILENAME := uClibc-locale-20081111-$(ARCH_NATIVE_BIT)-$(if
$(ARCH_LITTLE_ENDIAN),el,eb).tgz
+LOCALE_DATA_FILENAME := uClibc-locale-030818.tgz
 
 BUILD_CFLAGS-locale-common := \
 	-D__UCLIBC_GEN_LOCALE \

-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-001-fix-mmap.patch
Type: text/x-patch
Size: 1456 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0006.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-arch.patch.avr32
Type: text/x-patch
Size: 2928 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0007.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-fix-fget_putc.patch
Type: text/x-patch
Size: 13827 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0008.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-linuxthreads.patch
Type: text/x-patch
Size: 5147 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0009.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-rm-whitespace.patch
Type: text/x-patch
Size: 3400 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0010.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uClibc-0.9.30-locale.patch
Type: text/x-patch
Size: 666 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20081220/7bf46b84/attachment-0011.bin 
