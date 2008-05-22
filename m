From: Kieran Bingham <kieranbingham@gmail.com>
Date: Thu, 22 May 2008 16:52:37 +0100
Subject: [Buildroot] Binutils and Endianness
Message-ID: <483596C5.9030904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What configures the endianness that binutils is built as?

I have added an extra architecture type to the Config.in.arch but I 
can't get it past binutils

Index: target/Config.in.arch
===================================================================
--- target/Config.in.arch       (revision 22045)
+++ target/Config.in.arch       (working copy)
@@ -203,6 +203,8 @@
        help
          Specific CPU variant to use

+config BR2_sh2a
+       bool "sh2a"
 config BR2_sh2a_nofpueb
        bool "sh2a_nofpueb"
 config BR2_sh2eb
@@ -509,6 +511,7 @@
        default "powerpc"       if BR2_powerpc
        default "s390"          if BR2_s390
        default "s390"          if BR2_s390x
+       default "sh2a"          if BR2_sh2a
        default "sh2a_nofpueb"  if BR2_sh2a_nofpueb
        default "sh2eb"         if BR2_sh2eb
        default "sh3"           if BR2_sh3
@@ -532,7 +535,7 @@
                            BR2_sh3 || BR2_sh4 || BR2_x86_64 || 
BR2_nios2 || \
                            BR2_sh64
        default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || 
BR2_m68k || BR2_mips || \
-                           BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb 
|| \
+                           BR2_powerpc || BR2_sh2a || BR2_sh2a_nofpueb 
|| BR2_sh2eb || \
                            BR2_sh3eb || BR2_sh4eb || BR2_sparc || 
BR2_sparc64

 config BR2_GCC_TARGET_TUNE


/tmp/ccOmyORE.s:658: Internal error, aborting at 
/opt/buildroot-sh2a/toolchain_build_sh2a/binutils-2.18/gas/config/tc-sh.c 
line 4012 in md_apply_fix
tc-sh:4010:    case BFD_RELOC_SH_DISP20:
tc-sh:4011:      if (! target_big_endian)
tc-sh:4012:        abort();


Am I missing something obvious ?

--
Kieran
