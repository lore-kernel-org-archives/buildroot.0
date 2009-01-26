From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 21:02:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils:
	2.14.90.0.8 2.15.94.0.2.2 2.16.1 2.16.90 etc...
Message-ID: <20090126210216.70A9E7672B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 21:02:15 +0000 (Mon, 26 Jan 2009)
New Revision: 25067

Log:
toolchain/binutils: remove ancient (and unused) 2.14/15/16/17 patches

Removed:
   trunk/buildroot/toolchain/binutils/2.14.90.0.8/001-debian.patch
   trunk/buildroot/toolchain/binutils/2.14.90.0.8/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.14.90.0.8/210-cflags.patch
   trunk/buildroot/toolchain/binutils/2.14.90.0.8/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.14.90.0.8/600-arm-textrel.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/210-cflags.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/300-120_mips_xgot_multigot_workaround.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.15.94.0.2.2/sh-flags-off-by-one.patch
   trunk/buildroot/toolchain/binutils/2.16.1/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.1/110-uclibc-libtool-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.1/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.16.1/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.16.1/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.16.1/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.16.1/sh-flags-off-by-one.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.16.90.0.3/sh-flags-off-by-one.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.5/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.5/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.5/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.5/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.5/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.6/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.6/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.6/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.6/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.6/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.16.91.0.7/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.10/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.10/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.10/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.10/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-makeinfo-version.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.12/320-mips-elf-reloc-regression.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.14/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-makeinfo-version.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.16/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.2/400-mips-ELF_MAXPAGESIZE-4K.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.3/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.4/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.4/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.4/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.4/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.4/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.5/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/300-006_better_file_error.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.6/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.7/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.8/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.8/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.8/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.8/300-012_check_ldrunpath_length.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.9/100-uclibc-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.9/110-arm-eabi-conf.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.9/300-001_ld_makefile_patch.patch
   trunk/buildroot/toolchain/binutils/2.17.50.0.9/300-012_check_ldrunpath_length.patch


Changeset:

Sorry, the patch is too large to include (8393 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25067
