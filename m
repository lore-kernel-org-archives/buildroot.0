From: Sjoerd Venema <srg.venema@gmail.com>
Date: Thu, 25 Jan 2018 15:47:09 +0100
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
Message-ID: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just installed 2017.11 on a fresh machine and imported my config.
In 2017.11 I had used the rfkill package, so I got a notification that this
is now legacy, so I unchecked it in the "legacy" section. I noticed that it
was now selected at the util-linux section.

However, I get the following error, no matter if rfkill is selected or not:

>>> host-util-linux 2.31 Building
PATH="/home/buildroot/buildroot-2017.11/output/host/bin:/home/buildroot/buildroot-2017.11/output/host/sbin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/buildroot/bin"
PKG_CONFIG="/home/buildroot/buildroot-2017.11/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/home/buildroot/buildroot-2017.11/output/host/lib/pkgconfig:/home/buildroot/buildroot-2017.11/output/host/share/pkgconfig"
/usr/bin/make -j5  -C
/home/buildroot/buildroot-2017.11/output/build/host-util-linux-2.31/
/usr/bin/make  all-recursive
Making all in po
make[4]: Nothing to be done for `all'.
  CC       lib/libcommon_la-blkdev.lo
  CC       lib/libcommon_la-canonicalize.lo
  CC       lib/libcommon_la-crc32.lo
  CC       lib/libcommon_la-env.lo
  CC       lib/libcommon_la-idcache.lo
  CC       lib/libcommon_la-fileutils.lo
  CC       lib/libcommon_la-ismounted.lo
  CC       lib/libcommon_la-color-names.lo
  CC       lib/libcommon_la-mangle.lo
  CC       lib/libcommon_la-match.lo
  CC       lib/libcommon_la-mbsalign.lo
  CC       lib/libcommon_la-mbsedit.lo
  CC       lib/libcommon_la-md5.lo
  CC       lib/libcommon_la-pager.lo
  CC       lib/libcommon_la-parse-date.lo
  CC       lib/libcommon_la-path.lo
  CC       lib/libcommon_la-pwdutils.lo
  CC       lib/libcommon_la-randutils.lo
  CC       lib/libcommon_la-setproctitle.lo
  CC       lib/libcommon_la-strutils.lo
  CC       lib/libcommon_la-timeutils.lo
  CC       lib/libcommon_la-ttyutils.lo
  CC       lib/libcommon_la-exec_shell.lo
  CC       lib/libcommon_la-strv.lo
  CC       lib/libcommon_la-sha1.lo
  CC       lib/libcommon_la-linux_version.lo
  CC       lib/libcommon_la-loopdev.lo
  CC       lib/libcommon_la-plymouth-ctrl.lo
  CC       lib/libcommon_la-cpuset.lo
  CC       lib/libcommon_la-procutils.lo
  CC       lib/libcommon_la-sysfs.lo
  CC       lib/libtcolors_la-colors.lo
  CC       lib/libtcolors_la-color-names.lo
  CC       libuuid/src/libuuid_la-clear.lo
  CC       libuuid/src/libuuid_la-compare.lo
  CC       libuuid/src/libuuid_la-copy.lo
  CC       libuuid/src/libuuid_la-gen_uuid.lo
  CC       libuuid/src/libuuid_la-isnull.lo
  CC       libuuid/src/libuuid_la-pack.lo
  CC       libuuid/src/libuuid_la-parse.lo
  CC       libuuid/src/libuuid_la-unpack.lo
  CC       libuuid/src/libuuid_la-unparse.lo
  CC       libuuid/src/libuuid_la-uuid_time.lo
  CC       libuuid/src/libuuid_la-predefined.lo
  CC       libblkid/src/libblkid_la-init.lo
  CC       libblkid/src/libblkid_la-cache.lo
  CC       libblkid/src/libblkid_la-config.lo
  CC       libblkid/src/libblkid_la-dev.lo
  CC       libblkid/src/libblkid_la-devname.lo
  CC       libblkid/src/libblkid_la-devno.lo
  CC       libblkid/src/libblkid_la-encode.lo
  CC       libblkid/src/libblkid_la-evaluate.lo
  CC       libblkid/src/libblkid_la-getsize.lo
  CC       libblkid/src/libblkid_la-llseek.lo
  CC       libblkid/src/libblkid_la-probe.lo
  CC       libblkid/src/libblkid_la-read.lo
  CC       libblkid/src/libblkid_la-resolve.lo
  CC       libblkid/src/libblkid_la-save.lo
  CC       libblkid/src/libblkid_la-tag.lo
  CC       libblkid/src/libblkid_la-verify.lo
  CC       libblkid/src/libblkid_la-version.lo
  CC       libblkid/src/partitions/libblkid_la-aix.lo
  CC       libblkid/src/partitions/libblkid_la-bsd.lo
  CC       libblkid/src/partitions/libblkid_la-dos.lo
  CC       libblkid/src/partitions/libblkid_la-gpt.lo
  CC       libblkid/src/partitions/libblkid_la-mac.lo
  CC       libblkid/src/partitions/libblkid_la-minix.lo
  CC       libblkid/src/partitions/libblkid_la-partitions.lo
  CC       libblkid/src/partitions/libblkid_la-sgi.lo
  CC       libblkid/src/partitions/libblkid_la-solaris_x86.lo
  CC       libblkid/src/partitions/libblkid_la-sun.lo
  CC       libblkid/src/partitions/libblkid_la-ultrix.lo
  CC       libblkid/src/partitions/libblkid_la-unixware.lo
  CC       libblkid/src/superblocks/libblkid_la-adaptec_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-bcache.lo
  CC       libblkid/src/superblocks/libblkid_la-befs.lo
  CC       libblkid/src/superblocks/libblkid_la-bfs.lo
  CC       libblkid/src/superblocks/libblkid_la-btrfs.lo
  CC       libblkid/src/superblocks/libblkid_la-cramfs.lo
  CC       libblkid/src/superblocks/libblkid_la-ddf_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-drbd.lo
  CC       libblkid/src/superblocks/libblkid_la-drbdproxy_datalog.lo
  CC       libblkid/src/superblocks/libblkid_la-drbdmanage.lo
  CC       libblkid/src/superblocks/libblkid_la-exfat.lo
  CC       libblkid/src/superblocks/libblkid_la-exfs.lo
  CC       libblkid/src/superblocks/libblkid_la-ext.lo
  CC       libblkid/src/superblocks/libblkid_la-f2fs.lo
  CC       libblkid/src/superblocks/libblkid_la-gfs.lo
  CC       libblkid/src/superblocks/libblkid_la-hfs.lo
  CC       libblkid/src/superblocks/libblkid_la-highpoint_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-hpfs.lo
  CC       libblkid/src/superblocks/libblkid_la-iso9660.lo
  CC       libblkid/src/superblocks/libblkid_la-isw_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-jfs.lo
  CC       libblkid/src/superblocks/libblkid_la-jmicron_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-linux_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-lsi_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-luks.lo
  CC       libblkid/src/superblocks/libblkid_la-lvm.lo
  CC       libblkid/src/superblocks/libblkid_la-minix.lo
  CC       libblkid/src/superblocks/libblkid_la-netware.lo
  CC       libblkid/src/superblocks/libblkid_la-nilfs.lo
  CC       libblkid/src/superblocks/libblkid_la-ntfs.lo
  CC       libblkid/src/superblocks/libblkid_la-refs.lo
  CC       libblkid/src/superblocks/libblkid_la-nvidia_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-ocfs.lo
  CC       libblkid/src/superblocks/libblkid_la-promise_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-reiserfs.lo
  CC       libblkid/src/superblocks/libblkid_la-romfs.lo
  CC       libblkid/src/superblocks/libblkid_la-silicon_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-squashfs.lo
  CC       libblkid/src/superblocks/libblkid_la-superblocks.lo
  CC       libblkid/src/superblocks/libblkid_la-swap.lo
  CC       libblkid/src/superblocks/libblkid_la-sysv.lo
  CC       libblkid/src/superblocks/libblkid_la-ubi.lo
  CC       libblkid/src/superblocks/libblkid_la-ubifs.lo
  CC       libblkid/src/superblocks/libblkid_la-udf.lo
  CC       libblkid/src/superblocks/libblkid_la-ufs.lo
  CC       libblkid/src/superblocks/libblkid_la-vfat.lo
  CC       libblkid/src/superblocks/libblkid_la-via_raid.lo
  CC       libblkid/src/superblocks/libblkid_la-vmfs.lo
  CC       libblkid/src/superblocks/libblkid_la-vxfs.lo
  CC       libblkid/src/superblocks/libblkid_la-xfs.lo
  CC       libblkid/src/superblocks/libblkid_la-zfs.lo
  CC       libblkid/src/topology/libblkid_la-topology.lo
  CC       libblkid/src/topology/libblkid_la-dm.lo
  CC       libblkid/src/topology/libblkid_la-evms.lo
libblkid/src/superblocks/zfs.c: In function ?probe_zfs?:
libblkid/src/superblocks/zfs.c:221: warning: ?ub? may be used uninitialized
in this function
  CC       libblkid/src/topology/libblkid_la-ioctl.lo
  CC       libblkid/src/topology/libblkid_la-lvm.lo
  CC       libblkid/src/topology/libblkid_la-md.lo
  CC       libblkid/src/topology/libblkid_la-sysfs.lo
  CC       libmount/src/libmount_la-cache.lo
  CC       libmount/src/libmount_la-fs.lo
  CC       libmount/src/libmount_la-init.lo
  CC       libmount/src/libmount_la-iter.lo
  CC       libmount/src/libmount_la-lock.lo
  CC       libmount/src/libmount_la-optmap.lo
  CC       libmount/src/libmount_la-optstr.lo
  CC       libmount/src/libmount_la-tab.lo
  CC       libmount/src/libmount_la-tab_diff.lo
  CC       libmount/src/libmount_la-tab_parse.lo
  CC       libmount/src/libmount_la-tab_update.lo
  CC       libmount/src/libmount_la-test.lo
  CC       libmount/src/libmount_la-utils.lo
  CC       libmount/src/libmount_la-version.lo
  CC       libmount/src/libmount_la-context.lo
  CC       libmount/src/libmount_la-context_loopdev.lo
  CC       libmount/src/libmount_la-context_mount.lo
  CC       libmount/src/libmount_la-context_umount.lo
  CC       libmount/src/libmount_la-monitor.lo
  CC       libsmartcols/src/libsmartcols_la-iter.lo
  CC       libsmartcols/src/libsmartcols_la-symbols.lo
  CC       libsmartcols/src/libsmartcols_la-cell.lo
  CC       libsmartcols/src/libsmartcols_la-column.lo
  CC       libsmartcols/src/libsmartcols_la-line.lo
  CC       libsmartcols/src/libsmartcols_la-table.lo
  CC       libsmartcols/src/libsmartcols_la-table_print.lo
  CC       libsmartcols/src/libsmartcols_la-version.lo
  CC       libsmartcols/src/libsmartcols_la-init.lo
  CC       libfdisk/src/libfdisk_la-init.lo
  CC       libfdisk/src/libfdisk_la-field.lo
  CC       libfdisk/src/libfdisk_la-item.lo
  CC       libfdisk/src/libfdisk_la-test.lo
  CC       libfdisk/src/libfdisk_la-ask.lo
  CC       libfdisk/src/libfdisk_la-alignment.lo
  CC       libfdisk/src/libfdisk_la-label.lo
  CC       libfdisk/src/libfdisk_la-utils.lo
  CC       libfdisk/src/libfdisk_la-context.lo
  CC       libfdisk/src/libfdisk_la-parttype.lo
  CC       libfdisk/src/libfdisk_la-partition.lo
  CC       libfdisk/src/libfdisk_la-table.lo
  CC       libfdisk/src/libfdisk_la-iter.lo
  CC       libfdisk/src/libfdisk_la-script.lo
  CC       libfdisk/src/libfdisk_la-version.lo
  CC       libfdisk/src/libfdisk_la-wipe.lo
  CC       libfdisk/src/libfdisk_la-sun.lo
  CC       libfdisk/src/libfdisk_la-sgi.lo
  CC       libfdisk/src/libfdisk_la-dos.lo
  CC       libfdisk/src/libfdisk_la-bsd.lo
  CC       libfdisk/src/libfdisk_la-gpt.lo
  CC       sys-utils/dmesg-dmesg.o
  CC       misc-utils/lsblk-lsblk.o
  CC       misc-utils/findmnt-findmnt.o
  CC       misc-utils/findmnt-findmnt-verify.o
  CC       misc-utils/kill.o
  CC       term-utils/agetty.o
  CC       login-utils/sulogin.o
  CC       login-utils/sulogin-consoles.o
  CC       login-utils/nologin.o
  CCLD     fsfreeze
  CCLD     pivot_root
  CCLD     switch_root
  CC       disk-utils/fsck.minix.o
  CC       disk-utils/mkfs.minix.o
  CC       disk-utils/mkfs.o
  CC       disk-utils/mkfs.bfs.o
  CC       disk-utils/mkswap-mkswap.o
  CC       disk-utils/swaplabel-swaplabel.o
  CCLD     raw
  CC       schedutils/chrt.o
  CC       schedutils/ionice.o
  CC       schedutils/taskset.o
  CC       text-utils/col.o
  CC       text-utils/colcrt.o
  CC       text-utils/colrm.o
  CC       text-utils/column-column.o
  CC       text-utils/hexdump-conv.o
  CC       text-utils/hexdump-display.o
  CC       text-utils/hexdump.o
  CC       text-utils/hexdump-parse.o
  CC       text-utils/rev.o
  CCLD     mesg
  CCLD     renice
  CC       sys-utils/rfkill-rfkill.o
  CCLD     setsid
sys-utils/rfkill.c:67: error: ?RFKILL_TYPE_FM? undeclared here (not in a
function)
make[4]: *** [sys-utils/rfkill-rfkill.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [all-recursive] Error 1
make[2]: *** [all] Error 2
make[1]: ***
[/home/buildroot/buildroot-2017.11/output/build/host-util-linux-2.31/.stamp_built]
Error 2
make: *** [_all] Error 2



<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.
www.avast.com
<https://www.avast.com/sig-email?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180125/af2e094d/attachment.html>
