From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:02:26 +0200
Subject: [Buildroot] [git commit] elf2flt: Update version to fix buffer
	overflow in output_relocs()
Message-ID: <20160422130236.48CA281767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4ec4f6a49a9297934d810ff445a4d0782c366ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new version contains a patch that fixes the following crash:
make[1]: Entering directory `<...>/build/uclibc-1.0.14'
  CC utils/getconf
*** buffer overflow detected ***: <...>/bin/elf2flt terminated

======= Backtrace: =========
/lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x2ad3be5f738f]
/lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x2ad3be68ec9c]
/lib/x86_64-linux-gnu/libc.so.6(+0x109b60)[0x2ad3be68db60]
/lib/x86_64-linux-gnu/libc.so.6(+0x109069)[0x2ad3be68d069]
/lib/x86_64-linux-gnu/libc.so.6(_IO_default_xsputn+0xbc)[0x2ad3be5ff70c]
/lib/x86_64-linux-gnu/libc.so.6(_IO_vfprintf+0xaef)[0x2ad3be5ce7df]
/lib/x86_64-linux-gnu/libc.so.6(__vsprintf_chk+0x84)[0x2ad3be68d0f4]
/lib/x86_64-linux-gnu/libc.so.6(__sprintf_chk+0x7d)[0x2ad3be68d04d]
 <...>/bin/elf2flt[0x403cda]
 <...>/bin/elf2flt[0x4030a4]
/lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xf5)[0x2ad3be5a5ec5]
 <...>/bin/elf2flt[0x403642]

Signed-off-by: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/elf2flt.hash | 2 +-
 package/elf2flt/elf2flt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index be7c776..9c18ba5 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 64ede6936aa88028378e08192039c29791b9e32714cc861762214b8e106e7145 elf2flt-8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7.tar.gz
+sha256 6a45a787a08da64f0f3036d3ae1865bc13f8f40d13f07511a2bf1b736acc4808 elf2flt-9dbc458c6122c495bbdec8dc975a15c9d39e5ff2.tar.gz
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 6c16c30..bd15ea2 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 8a3e74446fe7d866f0517ee089a37f4bdf4bc9f7
+ELF2FLT_VERSION = 9dbc458c6122c495bbdec8dc975a15c9d39e5ff2
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPLv2+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
