From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 24 Jul 2017 15:13:35 +0900
Subject: [Buildroot] Build error of BR2_PACKAGE_E2FSPROGS
Message-ID: <CAK7LNATiQ+xpXQ=2dE52+6NHyGp9Msce_vkQ+jWv7R-_JBXQnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

If BR2_PACKAGE_E2FSPROGS is enabled,
building e2fsprogs seems to fail.

I have not taken a close look at it.

Anybody who can take care of it?




>>> e2fsprogs 1.43.4 Building
PATH="/home/masahiro/workspace/bsp/build/buildroot-arm64/host/bin:/home/masahiro/workspace/bsp/build/buildroot-arm64/host/sbin:/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/bin:/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/sbin:/home/masahiro/diag/diag_common.arm_v8_gcc/gcc-linaro-aarch64-none-elf-4.8-2014.04_linux/bin:/home/masahiro/toolchains/clang-4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04/bin:/home/masahiro/toolchains/arm-buildroot-7.1/usr/bin:/home/masahiro/toolchains/aarch64-buildroot-7.1/usr/bin:/home/masahiro/toolchains/arm-linaro-7.1/gcc-linaro-7.1.1-2017.05-x86_64_arm-linux-gnueabihf/bin:/home/masahiro/toolchains/aarch64-linaro-7.1/gcc-linaro-7.1.1-2017.05-x86_64_aarch64-linux-gnu/bin:/home/masahiro/toolchains/xtensa/gcc-4.9.0-nolibc/xtensa-linux/bin:/home/masahiro/toolchains/x86/gcc-4.9.0-nolibc/i386-linux/bin:/home/masahiro/toolchains/tile/gcc-4.6.2-nolibc/tilegx-linux/bin:/home/masahiro/toolchains/sparc/gcc-4.9.0-nolibc/sparc-linux/bin:/home/masahiro/toolchains/sh/renesas-2012.09/bin:/home/masahiro/toolchains/powerpc/gcc-4.9.0-nolibc/powerpc-linux/bin:/home/masahiro/toolchains/openrisc/or1k-elf/bin:/home/masahiro/toolchains/nios2/sourceryg++-2016.05/bin:/home/masahiro/toolchains/nds32/nds32le-linux-glibc-v1/bin:/home/masahiro/toolchains/mips/gcc-4.9.0-nolibc/mips-linux/bin:/home/masahiro/toolchains/microblaze/gcc-4.9.0-nolibc/microblaze-linux/bin:/home/masahiro/toolchains/m68k/gcc-4.9.0-nolibc/m68k-linux/bin:/home/masahiro/toolchains/ia64/gcc-4.9.0-nolibc/ia64-linux/bin:/home/masahiro/toolchains/h8300/gcc-4.9.0-nolibc/h8300-elf/bin:/home/masahiro/toolchains/frv/gcc-4.9.0-nolibc/frv-linux/bin:/home/masahiro/toolchains/cris/gcc-4.6.3-nolibc/crisv32-linux/bin:/home/masahiro/toolchains/blackfin/opt/uClinux/bfin-elf/bin:/home/masahiro/toolchains/avr32/gcc-4.2.4-nolibc/avr32-linux/bin:/home/masahiro/toolchains/arm/gcc-4.9.0-nolibc/arm-unknown-linux-gnueabi/bin:/home/masahiro/toolchains/arceb/arc_gnu_2016.09-rc1_prebuilt_uclibc_be_arc700_linux_install/bin:/home/masahiro/toolchains/arc/arc_gnu_2016.09-rc1_prebuilt_uclibc_le_arc700_linux_install/bin:/home/masahiro/toolchains/alpha/gcc-4.9.0-nolibc/alpha-linux/bin:/home/masahiro/toolchains/aarch64/gcc-4.9.0-nolibc/aarch64-linux/bin:/home/masahiro/workspace/junkbox/bin:/home/masahiro/bin:/home/masahiro/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
 /home/masahiro/bin/make -j9 LDCONFIG=true -C
/home/masahiro/workspace/bsp/build/buildroot-arm64/build/e2fsprogs-1.43.4/
cd ./util ; /home/masahiro/bin/make subst
CREATE dirpaths.h
CC subst.c
LD subst
make[4]: 'util/subst.conf' is up to date.
make[4]: 'lib/config.h' is up to date.
SUBST lib/dirpaths.h
cd .; CONFIG_FILES=./lib/ext2fs/ext2_types.h ./config.status
config.status: creating ./lib/ext2fs/ext2_types.h
config.status: creating lib/config.h
config.status: lib/config.h is unchanged
config.status: executing po-directories commands
cd .; CONFIG_FILES=./lib/blkid/blkid_types.h ./config.status
config.status: creating ./lib/blkid/blkid_types.h
config.status: creating lib/config.h
config.status: lib/config.h is unchanged
config.status: executing po-directories commands
cd .; CONFIG_FILES=./lib/uuid/uuid_types.h ./config.status
config.status: creating ./lib/uuid/uuid_types.h
config.status: creating lib/config.h
config.status: lib/config.h is unchanged
config.status: executing po-directories commands
SUBST compile_et
SUBST ext2_err.et
COMPILE_ET ext2_err.et
COMPILE_ET prof_err.et
/home/masahiro/bin/make libs
make[5]: 'util/subst.conf' is up to date.
make[5]: 'lib/config.h' is up to date.
make[5]: 'lib/dirpaths.h' is up to date.
make[5]: 'lib/ext2fs/ext2_types.h' is up to date.
make[5]: 'lib/blkid/blkid_types.h' is up to date.
make[5]: 'lib/uuid/uuid_types.h' is up to date.
make[5]: 'compile_et' is up to date.
make[5]: 'ext2_err.h' is up to date.
make[5]: 'prof_err.h' is up to date.
making all in lib/et
MKDIR elfshared
CC error_message.c
CC et_name.c
CC init_et.c
CC com_err.c
CC com_right.c
GEN_LIB libcom_err.a
making all in lib/ss
SUBST mk_cmds
making all in lib/e2p
MKDIR elfshared
CC feature.c
CC fgetflags.c
CC fsetflags.c
CC fgetversion.c
CC fsetversion.c
CC getflags.c
CC getversion.c
CC hashstr.c
CC iod.c
CC ls.c
CC mntopts.c
CC parse_num.c
CC pe.c
CC pf.c
CC ps.c
CC setflags.c
CC setversion.c
CC uuid.c
CC ostype.c
CC percent.c
CC crypto_mode.c
CC fgetproject.c
CC fsetproject.c
GEN_LIB libe2p.a
making all in lib/support
CC cstring.c
CC mkquota.c
CC plausible.c
CC profile.c
CC parse_qtype.c
CC profile_helpers.c
CC prof_err.c
CC quotaio.c
CC quotaio_v2.c
CC quotaio_tree.c
CC dict.c
GEN_LIB libsupport.a
making all in lib/ext2fs
CC gen_crc32ctable
MKDIR elfshared
CC ext2_err.c
CC alloc.c
CC alloc_sb.c
CC alloc_stats.c
CC alloc_tables.c
CC atexit.c
CC badblocks.c
CC bb_inode.c
CC bitmaps.c
CC bitops.c
CC blkmap64_ba.c
CC blkmap64_rb.c
CC blknum.c
CC block.c
CC bmap.c
CC check_desc.c
CC closefs.c
CC crc16.c
GEN32CTABLE crc32c_table.h
CC csum.c
CC dblist.c
CC dblist_dir.c
CC dirblock.c
CC dirhash.c
CC dir_iterate.c
CC expanddir.c
CC ext_attr.c
CC extent.c
CC fallocate.c
CC fileio.c
CC finddev.c
CC flushb.c
CC freefs.c
CC gen_bitmap.c
CC gen_bitmap64.c
CC get_num_dirs.c
CC get_pathname.c
CC getsize.c
CC getsectsize.c
CC i_block.c
CC icount.c
CC ind_block.c
CC initialize.c
CC inline.c
CC inline_data.c
CC inode.c
CC io_manager.c
CC ismounted.c
In file included from ext2_fs.h:19:0,
                 from ismounted.c:53:
../../lib/ext2fs/ext2_types.h:186:0: warning: "__bitwise" redefined
 #define __bitwise
 ^
In file included from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/loop.h:28:0,
                 from ismounted.c:33:
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/types.h:21:0:
note: this is the location of the previous definition
 #define __bitwise __bitwise__
 ^
CC link.c
CC llseek.c
In file included from ext2_fs.h:19:0,
                 from ismounted.c:53:
../../lib/ext2fs/ext2_types.h:186:0: warning: "__bitwise" redefined
 #define __bitwise
 ^
In file included from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/loop.h:28:0,
                 from ismounted.c:33:
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/types.h:21:0:
note: this is the location of the previous definition
 #define __bitwise __bitwise__
 ^
CC lookup.c
CC mkdir.c
CC mkjournal.c
CC mmp.c
CC namei.c
CC native.c
CC newdir.c
CC openfs.c
CC progress.c
CC punch.c
CC qcow2.c
CC read_bb.c
CC read_bb_file.c
CC res_gdt.c
CC rw_bitmaps.c
CC sha512.c
CC swapfs.c
CC symlink.c
CC tdb.c
CC undo_io.c
CC unix_io.c
CC unlink.c
In file included from ext2_fs.h:19:0,
                 from unix_io.c:77:
../../lib/ext2fs/ext2_types.h:186:0: warning: "__bitwise" redefined
 #define __bitwise
 ^
In file included from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/prctl.h:4:0,
                 from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/sys/prctl.h:22,
                 from unix_io.c:57:
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/types.h:21:0:
note: this is the location of the previous definition
 #define __bitwise __bitwise__
 ^
CC valid_blk.c
CC version.c
CC rbtree.c
CC crc32c.c
In file included from ext2_fs.h:19:0,
                 from unix_io.c:77:
../../lib/ext2fs/ext2_types.h:186:0: warning: "__bitwise" redefined
 #define __bitwise
 ^
In file included from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/prctl.h:4:0,
                 from
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/sys/prctl.h:22,
                 from unix_io.c:57:
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/aarch64-buildroot-linux-uclibc/sysroot/usr/include/linux/types.h:21:0:
note: this is the location of the previous definition
 #define __bitwise __bitwise__
 ^
GEN_LIB libext2fs.a
GEN_ELF_SOLIB libext2fs.so.2.4
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/lib/gcc/aarch64-buildroot-linux-uclibc/5.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
../../../lib/libcom_err.a(com_err.o): relocation
R_AARCH64_ADR_PREL_PG_HI21 against external symbol `stderr' can not be
used when making a shared object; recompile with -fPIC
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/lib/gcc/aarch64-buildroot-linux-uclibc/5.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
../../../lib/libcom_err.a(com_err.o)(.text+0x14): unresolvable
R_AARCH64_ADR_PREL_PG_HI21 relocation against symbol `stderr'
/home/masahiro/workspace/bsp/build/buildroot-arm64/host/usr/lib/gcc/aarch64-buildroot-linux-uclibc/5.4.0/../../../../aarch64-buildroot-linux-uclibc/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:605: libext2fs.so.2.4] Error 1
make[4]: *** [Makefile:417: all-libs-recursive] Error 1
make[3]: *** [Makefile:340: all] Error 2
make[2]: *** [package/pkg-generic.mk:230:
/home/masahiro/workspace/bsp/build/buildroot-arm64/build/e2fsprogs-1.43.4/.stamp_built]
Error 2
make[1]: *** [Makefile:79: _all] Error 2
make[1]: Leaving directory '/home/masahiro/workspace/bsp/buildroot'
make: *** [Makefile:219: buildroot] Error 2



-- 
Best Regards
Masahiro Yamada
