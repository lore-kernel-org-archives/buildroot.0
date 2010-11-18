From: Konrad Eisele <konrad@gaisler.com>
Date: Thu, 18 Nov 2010 15:03:08 +0100
Subject: [Buildroot] sparc gdb-targetserver and sparc-v7 shared library
	generation
Message-ID: <4CE5321C.8010202@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
2 additional patches:
 + 0005-gdb-Add-sparc-support-to-gdbserver.patch
   adds SPARC support to gdb target server
   (gdb-6.8/gdb/gdbserver/*)
 + 0006-config-Remove-automatic-disable-of-shared-library-fo.patch
   disables the automatic disable of shared library for
   sparc-v7. I dont see a dependency between shared library and v7.
   The difference between v7 and v8 is that in v8 you have
   the added math asm-insns: smul/umul/udiv/sdiv/urem.
   It shouldnt affect shared libraries creation.

One effect of 0006-config-Remove-automatic-disable-of-shared-library-fo.patch
is that you dont need BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp"
for the default build because libgomp's build needs shared libraries to succeed.

-- Greetings Konrad
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0005-gdb-Add-sparc-support-to-gdbserver.patch
Type: text/x-patch
Size: 13971 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101118/77256409/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-config-Remove-automatic-disable-of-shared-library-fo.patch
Type: text/x-patch
Size: 1230 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101118/77256409/attachment-0003.bin>
