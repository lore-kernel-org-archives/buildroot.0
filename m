From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Oct 2011 05:14:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4327] New: I use the i686-linux-gcc-4.6.1 compiled
 grub-0.97 does not work
Message-ID: <bug-4327-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4327

           Summary: I use the i686-linux-gcc-4.6.1 compiled grub-0.97 does
                    not work
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: xiaxiaojin at safefw.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


grub-0.97 did not play any patch.
gcc ?? 4.6.1 (Buildroot 2011.11-git) 


root [ grub-0.97 ]# ./configure --host=i686 CC=i686-linux-gcc --disable-ffs
--prefix=/usr
make 
make check
make install 

    GNU GRUB  version 0.97  (640K lower / 3072K upper memory)

 [ Minimal BASH-like line editing is supported.  For the first word, TAB
   lists possible command completions.  Anywhere else TAB lists the possible
   completions of a device/filename. ]

grub> root (hd1,0)
 Filesystem type is reiserfs, partition type 0x83

grub> setup (hd1)
 Checking if "/boot/grub/stage1" exists... no
 Checking if "/grub/stage1" exists... yes
 Checking if "/grub/stage2" exists... yes
 Checking if "/grub/reiserfs_stage1_5" exists... yes
 Running "embed /grub/reiserfs_stage1_5 (hd1)"...  23 sectors are embedded.
succeeded
 Running "install /grub/stage1 (hd1) (hd1)1+23 p (hd1,0)/grub/stage2
/grub/menu.lst"... failed

Error 6: Mismatched or corrupt version of stage1/stage2

grub> 

root [ grub-0.94 ]# i686-linux-gcc -v
???? specs?
COLLECT_GCC=i686-linux-gcc
COLLECT_LTO_WRAPPER=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr/libexec/gcc/i686-unknown-linux-uclibc/4.6.1/lto-wrapper
???i686-unknown-linux-uclibc
????/mnt/lfs/buildroot-2011.11-git/output/toolchain/gcc-4.6.1/configure
--prefix=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr --build=i686-pc-linux-gnu
--host=i686-pc-linux-gnu --target=i686-unknown-linux-uclibc
--enable-languages=c,c++
--with-sysroot=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr/i686-unknown-linux-uclibc/sysroot
--with-build-time-tools=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr/i686-unknown-linux-uclibc/bin
--disable-__cxa_atexit --enable-target-optspace --enable-libgomp --with-gnu-ld
--disable-libssp --disable-multilib --enable-tls --enable-shared
--with-gmp=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr
--with-mpfr=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr
--with-mpc=/mnt/lfs/toolchain/i-uClibc-0.9.32-x86/usr --enable-threads
--disable-decimal-float --with-arch=i686 --with-tune=i686
--with-pkgversion='Buildroot 2011.11-git'
--with-bugurl=http://bugs.buildroot.net/
?????posix
gcc ?? 4.6.1 (Buildroot 2011.11-git) 



flooder62 [ /mnt ]# fdisk -l

Disk /dev/hda: 125 MB, 125829120 bytes
255 heads, 63 sectors/track, 15 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks  Id System
/dev/hda1               1          15      120456  83 Linux

Disk /dev/sda: 8011 MB, 8011120640 bytes
247 heads, 62 sectors/track, 1021 cylinders
Units = cylinders of 15314 * 512 = 7840768 bytes

   Device Boot      Start         End      Blocks  Id System
/dev/sda1               1        1021     7817766  83 Linux
flooder62 [ /mnt ]# dmesg|grep -i sda
sd 2:0:0:0: [sda] 15646720 512-byte logical blocks: (8.01 GB/7.46 GiB)
sd 2:0:0:0: [sda] Write Protect is off
sd 2:0:0:0: [sda] Mode Sense: 23 00 00 00
sd 2:0:0:0: [sda] Assuming drive cache: write through
sd 2:0:0:0: [sda] Assuming drive cache: write through
 sda: sda1
sd 2:0:0:0: [sda] Assuming drive cache: write through
sd 2:0:0:0: [sda] Attached SCSI removable disk
REISERFS (device sda1): found reiserfs format "3.6" with standard journal
REISERFS (device sda1): using ordered data mode
REISERFS (device sda1): journal params: device sda1, size 8192, journal first
block 18, max trans len 1024, max batch 900, max commit age 30, max trans age
30
REISERFS (device sda1): checking transaction log (sda1)
REISERFS (device sda1): Using r5 hash to sort names
REISERFS (device sda1): Created .reiserfs_priv - reserved for xattr storage.


flooder62 [ /mnt ]# uname -sa
Linux flooder62 2.6.32-flz62 #45 SMP Tue Jul 12 09:40:59 GMT 2011 i686
GNU/Linux
flooder62 [ /mnt ]# ls /lib/lib*
/lib/libc.so               /lib/libgcc_s.so           /lib/libpthread.so       
 /lib/libuClibc-0.9.32.so
/lib/libc.so.0             /lib/libgcc_s.so.1         /lib/libpthread.so.0     
 /lib/libutil-0.9.32.so
/lib/libc.so.6             /lib/libm-0.9.32.so        /lib/libresolv-0.9.32.so 
 /lib/libutil.so.0
/lib/libcrypt-0.9.32.so    /lib/libm.so               /lib/libresolv.so        
 /lib/libz.so
/lib/libcrypt.so           /lib/libm.so.0             /lib/libresolv.so.0      
 /lib/libz.so.1
/lib/libcrypt.so.0         /lib/libnsl-0.9.32.so      /lib/librt-0.9.32.so     
 /lib/libz.so.1.2.5
/lib/libdl-0.9.32.so       /lib/libnsl.so             /lib/librt.so
/lib/libdl.so              /lib/libnsl.so.0           /lib/librt.so.0
/lib/libdl.so.0            /lib/libpthread-0.9.32.so  /lib/librt.so.1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
