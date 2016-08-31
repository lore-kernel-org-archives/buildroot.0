From: Lijun QIN <lijun.qin2008@gmail.com>
Date: Wed, 31 Aug 2016 08:44:27 -0500
Subject: [Buildroot] build 2015.11 - sbin/init: error while loading
	shared libraries: libtirpc.so.1
In-Reply-To: <87vayhz7rc.fsf@dell.be.48ers.dk>
References: <CALD51P81wh8mSgypNtVqZ+EpEtVdTAxsM27tO_njwjtJDap7nw@mail.gmail.com>
 <87vayhz7rc.fsf@dell.be.48ers.dk>
Message-ID: <CALD51P_B9Ng0RN6f_bhqsHuJONucUE462dE14es5uM0K4P0F0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you so much, Peter.
yes  - I compressed the rootfs tar file -

root at G9-Ubutun16-Marvell-A3800
:/home/dfvsmdev/workspace/marvell/buildroot-2015.11_gcc4.9/buildroot-2015.11-16.06.0/output/images/uncompressed
total 70536
drwxr-xr-x 20 root     root         4096 Aug 31 01:41 .
drwxr-xr-x  3 dfvsmdev dfvsmdev     4096 Aug 31 08:31 ..
drwxr-xr-x  2 root     root         4096 Aug 31 01:41 bin
drwxr-xr-x  4 root     root         4096 Aug 31 01:41 dev
drwxr-xr-x 20 root     root         4096 Aug 31 01:41 etc
drwxr-xr-x  3 root     root         4096 Aug 31 01:06 home
drwxr-xr-x  4 root     root         4096 Aug 31 01:41 lib
lrwxrwxrwx  1 root     root            3 Aug 30 23:20 lib32 -> lib
drwxr-xr-x  2 root     root         4096 Aug 31 01:41 libexec
lrwxrwxrwx  1 root     root           11 Aug 30 23:22 linuxrc -> bin/busybox
drwxr-xr-x  2 root     root         4096 Jun 15 11:53 marvell
drwxr-xr-x  2 root     root         4096 Nov 30  2015 media
drwxr-xr-x  2 root     root         4096 Nov 30  2015 mnt
drwxr-xr-x  2 root     root         4096 Nov 30  2015 opt
drwxr-xr-x  2 root     root         4096 Nov 30  2015 proc
drwx------  2 root     root         4096 Nov 30  2015 root
-rw-r--r--  1 root     root     72141184 Aug 31 08:19 rootfs.tar.gz
drwxr-xr-x  6 root     root         4096 Aug 31 01:00 run
drwxr-xr-x  2 root     root         4096 Aug 31 01:41 sbin
drwxr-xr-x  2 root     root         4096 Nov 30  2015 sys
drwxrwxrwt  5 root     root         4096 Aug 31 01:41 tmp
drwxr-xr-x  7 root     root         4096 Aug 31 01:41 usr
drwxr-xr-x  8 root     root         4096 Aug 31 00:20 var
cd /usr/lib
ls -al   libtirpc.*
lrwxrwxrwx 1 root root     18 Aug 30 23:21 libtirpc.so -> libtirpc.so.1.0.10
lrwxrwxrwx 1 root root     18 Aug 30 23:21 libtirpc.so.1 ->
libtirpc.so.1.0.10
-rwxr-xr-x 1 root root 101548 Aug 31 01:41 libtirpc.so.1.0.10

/opt/arm_gcc_49_hf/gcc49/bin/arm-linux-gnueabihf-readelf -d sbin/init |
grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libtirpc.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

I also confirmed libc.so.6 is lib/ directory. I list the contents of /lib/
and /usr/lib/
if you need more information to debug,  please let me know.
Thank you again,Peter.
Lijun QIN


/lib directory -
total 2680
drwxr-xr-x  4 root root   4096 Aug 31 01:41 .
drwxr-xr-x 20 root root   4096 Aug 31 01:41 ..
drwxr-xr-x  3 root root   4096 Aug 31 01:41 dhcpcd
-rwxr-xr-x  1 root root 101608 Aug 31 01:41 ld-2.19-2014.08.so
lrwxrwxrwx  1 root root     18 Aug 30 23:20 ld-linux-armhf.so.3 ->
ld-2.19-2014.08.so
lrwxrwxrwx  1 root root     18 Aug 30 23:20 libatomic.so.1 ->
libatomic.so.1.1.0
-rwxr-xr-x  1 root root  12040 Aug 31 01:41 libatomic.so.1.1.0
lrwxrwxrwx  1 root root     17 Aug 30 23:31 libblkid.so.1 ->
libblkid.so.1.1.0
-rwxr-xr-x  1 root root 197880 Aug 31 01:41 libblkid.so.1.1.0
-rwxr-xr-x  1 root root 911244 Aug 31 01:41 libc-2.19-2014.08.so
-rwxr-xr-x  1 root root  30352 Aug 31 01:41 libcrypt-2.19-2014.08.so
lrwxrwxrwx  1 root root     24 Aug 30 23:20 libcrypt.so.1 ->
libcrypt-2.19-2014.08.so
lrwxrwxrwx  1 root root     20 Aug 30 23:20 libc.so.6 ->
libc-2.19-2014.08.so
-rwxr-xr-x  1 root root   9748 Aug 31 01:41 libdl-2.19-2014.08.so
lrwxrwxrwx  1 root root     21 Aug 30 23:20 libdl.so.2 ->
libdl-2.19-2014.08.so
lrwxrwxrwx  1 root root     17 Aug 30 23:31 libfdisk.so.1 ->
libfdisk.so.1.1.0
-rwxr-xr-x  1 root root 275560 Aug 31 01:41 libfdisk.so.1.1.0
-rwxr-xr-x  1 root root 100192 Aug 31 01:41 libgcc_s.so.1
lrwxrwxrwx  1 root root     18 Aug 31 01:23 libhandle.so.1 ->
libhandle.so.1.0.3
-rwxr-xr-x  1 root root   7240 Aug 31 01:41 libhandle.so.1.0.3
-rwxr-xr-x  1 root root 407060 Aug 31 01:41 libm-2.19-2014.08.so
lrwxrwxrwx  1 root root     17 Aug 30 23:31 libmount.so.1 ->
libmount.so.1.1.0
-rwxr-xr-x  1 root root 222372 Aug 31 01:41 libmount.so.1.1.0
lrwxrwxrwx  1 root root     20 Aug 30 23:20 libm.so.6 ->
libm-2.19-2014.08.so
-rwxr-xr-x  1 root root  55172 Aug 31 01:41 libnsl-2.19-2014.08.so
lrwxrwxrwx  1 root root     22 Aug 30 23:20 libnsl.so.1 ->
libnsl-2.19-2014.08.so
-rwxr-xr-x  1 root root  13876 Aug 31 01:41 libnss_dns-2.19-2014.08.so
lrwxrwxrwx  1 root root     26 Aug 30 23:20 libnss_dns.so.2 ->
libnss_dns-2.19-2014.08.so
-rwxr-xr-x  1 root root  34452 Aug 31 01:41 libnss_files-2.19-2014.08.so
lrwxrwxrwx  1 root root     28 Aug 30 23:20 libnss_files.so.2 ->
libnss_files-2.19-2014.08.so
-rwxr-xr-x  1 root root 102155 Aug 31 01:41 libpthread-2.19-2014.08.so
lrwxrwxrwx  1 root root     26 Aug 30 23:20 libpthread.so.0 ->
libpthread-2.19-2014.08.so
-rwxr-xr-x  1 root root  59184 Aug 31 01:41 libresolv-2.19-2014.08.so
lrwxrwxrwx  1 root root     25 Aug 30 23:20 libresolv.so.2 ->
libresolv-2.19-2014.08.so
-rwxr-xr-x  1 root root  22504 Aug 31 01:41 librt-2.19-2014.08.so
lrwxrwxrwx  1 root root     21 Aug 30 23:20 librt.so.1 ->
librt-2.19-2014.08.so
lrwxrwxrwx  1 root root     21 Aug 30 23:31 libsmartcols.so.1 ->
libsmartcols.so.1.1.0
-rwxr-xr-x  1 root root 103372 Aug 31 01:41 libsmartcols.so.1.1.0
-rwxr-xr-x  1 root root   9784 Aug 31 01:41 libutil-2.19-2014.08.so
lrwxrwxrwx  1 root root     23 Aug 30 23:20 libutil.so.1 ->
libutil-2.19-2014.08.so
lrwxrwxrwx  1 root root     16 Aug 30 23:31 libuuid.so.1 -> libuuid.so.1.3.0
-rwxr-xr-x  1 root root  11812 Aug 31 01:41 libuuid.so.1.3.0
drwxr-xr-x  3 root root   4096 Aug 31 01:40 modules

/usr/lib directory
total 64132
drwxr-xr-x 14 root root    16384 Aug 31 01:41 .
drwxr-xr-x  7 root root     4096 Aug 31 01:41 ..
drwxr-xr-x  2 root root     4096 Aug 31 01:41 device-mapper
drwxr-xr-x  2 root root     4096 Aug 31 01:41 gawk
drwxr-xr-x  3 root root     4096 Aug 31 00:08 gio
lrwxrwxrwx  1 root root       15 Aug 30 23:48 libaio.so -> libaio.so.1.0.1
lrwxrwxrwx  1 root root       15 Aug 30 23:48 libaio.so.1 -> libaio.so.1.0.1
-rwxr-xr-x  1 root root     2460 Aug 31 01:41 libaio.so.1.0.1
lrwxrwxrwx  1 root root       18 Aug 31 00:18 libatalk.so ->
libatalk.so.16.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:18 libatalk.so.16 ->
libatalk.so.16.0.0
-rwxr-xr-x  1 root root   357620 Aug 31 01:41 libatalk.so.16.0.0
lrwxrwxrwx  1 root root       16 Aug 30 23:20 libattr.so.1 ->
libattr.so.1.1.0
-rw-r--r--  1 root root    13500 Aug 31 01:41 libattr.so.1.1.0
lrwxrwxrwx  1 root root       27 Aug 30 23:31 libblkid.so ->
../../lib/libblkid.so.1.1.0
lrwxrwxrwx  1 root root       15 Aug 30 23:33 libbtrfs.so -> libbtrfs.so.0.1
lrwxrwxrwx  1 root root       15 Aug 30 23:33 libbtrfs.so.0 ->
libbtrfs.so.0.1
-rwxr-xr-x  1 root root    34820 Aug 31 01:41 libbtrfs.so.0.1
lrwxrwxrwx  1 root root       15 Aug 30 23:33 libbz2.so -> libbz2.so.1.0.6
lrwxrwxrwx  1 root root       15 Aug 30 23:33 libbz2.so.1.0 ->
libbz2.so.1.0.6
-rwxr-xr-x  1 root root    54032 Aug 31 01:41 libbz2.so.1.0.6
lrwxrwxrwx  1 root root       15 Aug 30 23:32 libcom_err.so ->
libcom_err.so.2
lrwxrwxrwx  1 root root       17 Aug 30 23:32 libcom_err.so.2 ->
libcom_err.so.2.1
-rwxr-xr-x  1 root root     9400 Aug 31 01:41 libcom_err.so.2.1
lrwxrwxrwx  1 root root       18 Aug 30 23:39 libcrypto.so ->
libcrypto.so.1.0.0
-rwxr-xr-x  1 root root  1360948 Aug 31 01:41 libcrypto.so.1.0.0
lrwxrwxrwx  1 root root       22 Aug 30 23:45 libcryptsetup.so ->
libcryptsetup.so.4.7.0
lrwxrwxrwx  1 root root       22 Aug 30 23:45 libcryptsetup.so.4 ->
libcryptsetup.so.4.7.0
-rwxr-xr-x  1 root root   124216 Aug 31 01:41 libcryptsetup.so.4.7.0
-rwxr-xr-x  1 root root  1326096 Aug 31 01:41 libdb-5.3.so
lrwxrwxrwx  1 root root       12 Aug 30 23:29 libdb-5.so -> libdb-5.3.so
-rwxr-xr-x  1 root root  1426212 Aug 31 01:41 libdb_cxx-5.3.so
lrwxrwxrwx  1 root root       16 Aug 30 23:29 libdb_cxx-5.so ->
libdb_cxx-5.3.so
lrwxrwxrwx  1 root root       16 Aug 30 23:29 libdb_cxx.so ->
libdb_cxx-5.3.so
lrwxrwxrwx  1 root root       12 Aug 30 23:29 libdb.so -> libdb-5.3.so
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libdcerpc-atsvc.so ->
libdcerpc-atsvc.so.0.0.1
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libdcerpc-atsvc.so.0 ->
libdcerpc-atsvc.so.0.0.1
-rwxr-xr-x  1 root root     5328 Aug 31 01:41 libdcerpc-atsvc.so.0.0.1
lrwxrwxrwx  1 root root       26 Aug 31 01:00 libdcerpc-binding.so ->
libdcerpc-binding.so.0.0.1
lrwxrwxrwx  1 root root       26 Aug 31 01:00 libdcerpc-binding.so.0 ->
libdcerpc-binding.so.0.0.1
-rwxr-xr-x  1 root root    95540 Aug 31 01:41 libdcerpc-binding.so.0.0.1
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libdcerpc-samr.so ->
libdcerpc-samr.so.0.0.1
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libdcerpc-samr.so.0 ->
libdcerpc-samr.so.0.0.1
-rwxr-xr-x  1 root root     5328 Aug 31 01:41 libdcerpc-samr.so.0.0.1
lrwxrwxrwx  1 root root       18 Aug 31 01:00 libdcerpc.so ->
libdcerpc.so.0.0.1
lrwxrwxrwx  1 root root       18 Aug 31 01:00 libdcerpc.so.0 ->
libdcerpc.so.0.0.1
-rwxr-xr-x  1 root root   161076 Aug 31 01:41 libdcerpc.so.0.0.1
lrwxrwxrwx  1 root root       46 Aug 30 23:45
libdevmapper-event-lvm2mirror.so ->
device-mapper/libdevmapper-event-lvm2mirror.so
lrwxrwxrwx  1 root root       44 Aug 30 23:45
libdevmapper-event-lvm2raid.so ->
device-mapper/libdevmapper-event-lvm2raid.so
lrwxrwxrwx  1 root root       48 Aug 30 23:45
libdevmapper-event-lvm2snapshot.so ->
device-mapper/libdevmapper-event-lvm2snapshot.so
lrwxrwxrwx  1 root root       31 Aug 30 23:45 libdevmapper-event-lvm2.so ->
libdevmapper-event-lvm2.so.2.02
-rwxr-xr-x  1 root root     5480 Aug 31 01:41
libdevmapper-event-lvm2.so.2.02
lrwxrwxrwx  1 root root       44 Aug 30 23:45
libdevmapper-event-lvm2thin.so ->
device-mapper/libdevmapper-event-lvm2thin.so
lrwxrwxrwx  1 root root       26 Aug 30 23:45 libdevmapper-event.so ->
libdevmapper-event.so.1.02
-rwxr-xr-x  1 root root    21992 Aug 31 01:41 libdevmapper-event.so.1.02
lrwxrwxrwx  1 root root       20 Aug 30 23:45 libdevmapper.so ->
libdevmapper.so.1.02
-rwxr-xr-x  1 root root   330776 Aug 31 01:41 libdevmapper.so.1.02
lrwxrwxrwx  1 root root       11 Aug 30 23:32 libe2p.so -> libe2p.so.2
lrwxrwxrwx  1 root root       13 Aug 30 23:32 libe2p.so.2 -> libe2p.so.2.3
-rwxr-xr-x  1 root root    23020 Aug 31 01:41 libe2p.so.2.3
lrwxrwxrwx  1 root root       22 Aug 31 00:03 libevent-2.0.so.5 ->
libevent-2.0.so.5.1.10
-rwxr-xr-x  1 root root   220824 Aug 31 01:41 libevent-2.0.so.5.1.10
lrwxrwxrwx  1 root root       27 Aug 31 00:03 libevent_core-2.0.so.5 ->
libevent_core-2.0.so.5.1.10
-rwxr-xr-x  1 root root   134112 Aug 31 01:41 libevent_core-2.0.so.5.1.10
lrwxrwxrwx  1 root root       27 Aug 31 00:03 libevent_core.so ->
libevent_core-2.0.so.5.1.10
lrwxrwxrwx  1 root root       28 Aug 31 00:03 libevent_extra-2.0.so.5 ->
libevent_extra-2.0.so.5.1.10
-rwxr-xr-x  1 root root    96964 Aug 31 01:41 libevent_extra-2.0.so.5.1.10
lrwxrwxrwx  1 root root       28 Aug 31 00:03 libevent_extra.so ->
libevent_extra-2.0.so.5.1.10
lrwxrwxrwx  1 root root       30 Aug 31 00:03 libevent_openssl-2.0.so.5 ->
libevent_openssl-2.0.so.5.1.10
-rwxr-xr-x  1 root root    14656 Aug 31 01:41 libevent_openssl-2.0.so.5.1.10
lrwxrwxrwx  1 root root       30 Aug 31 00:03 libevent_openssl.so ->
libevent_openssl-2.0.so.5.1.10
lrwxrwxrwx  1 root root       31 Aug 31 00:03 libevent_pthreads-2.0.so.5 ->
libevent_pthreads-2.0.so.5.1.10
-rwxr-xr-x  1 root root     4920 Aug 31 01:41
libevent_pthreads-2.0.so.5.1.10
lrwxrwxrwx  1 root root       31 Aug 31 00:03 libevent_pthreads.so ->
libevent_pthreads-2.0.so.5.1.10
lrwxrwxrwx  1 root root       22 Aug 31 00:03 libevent.so ->
libevent-2.0.so.5.1.10
lrwxrwxrwx  1 root root       14 Aug 30 23:32 libext2fs.so -> libext2fs.so.2
lrwxrwxrwx  1 root root       16 Aug 30 23:32 libext2fs.so.2 ->
libext2fs.so.2.4
-rwxr-xr-x  1 root root   205044 Aug 31 01:41 libext2fs.so.2.4
lrwxrwxrwx  1 root root       27 Aug 30 23:31 libfdisk.so ->
../../lib/libfdisk.so.1.1.0
-rwxr-xr-x  1 root root    16520 Aug 31 01:41 libfdt-1.4.1.so
lrwxrwxrwx  1 root root       11 Aug 30 23:46 libfdt.so -> libfdt.so.1
lrwxrwxrwx  1 root root       15 Aug 30 23:46 libfdt.so.1 -> libfdt-1.4.1.so
lrwxrwxrwx  1 root root       15 Aug 30 23:56 libffi.so -> libffi.so.6.0.4
lrwxrwxrwx  1 root root       15 Aug 30 23:56 libffi.so.6 -> libffi.so.6.0.4
-rwxr-xr-x  1 root root    24332 Aug 31 01:41 libffi.so.6.0.4
lrwxrwxrwx  1 root root       19 Aug 31 01:22 libfiletap.so ->
libfiletap.so.0.0.8
lrwxrwxrwx  1 root root       19 Aug 31 01:22 libfiletap.so.0 ->
libfiletap.so.0.0.8
-rwxr-xr-x  1 root root    23300 Aug 31 01:41 libfiletap.so.0.0.8
-rwxr-xr-x  1 root root   286720 Aug 31 01:41 libfreebl3.so
lrwxrwxrwx  1 root root       19 Aug 30 23:44 libgcrypt.so ->
libgcrypt.so.20.0.4
lrwxrwxrwx  1 root root       19 Aug 30 23:44 libgcrypt.so.20 ->
libgcrypt.so.20.0.4
-rwxr-xr-x  1 root root   572280 Aug 31 01:41 libgcrypt.so.20.0.4
lrwxrwxrwx  1 root root       18 Aug 31 01:00 libgensec.so ->
libgensec.so.0.0.1
lrwxrwxrwx  1 root root       18 Aug 31 01:00 libgensec.so.0 ->
libgensec.so.0.0.1
-rwxr-xr-x  1 root root   120188 Aug 31 01:41 libgensec.so.0.0.1
lrwxrwxrwx  1 root root       22 Aug 31 00:08 libgio-2.0.so ->
libgio-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       22 Aug 31 00:08 libgio-2.0.so.0 ->
libgio-2.0.so.0.4600.1
-rwxr-xr-x  1 root root  1233036 Aug 31 01:41 libgio-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       23 Aug 31 00:08 libglib-2.0.so ->
libglib-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       23 Aug 31 00:08 libglib-2.0.so.0 ->
libglib-2.0.so.0.4600.1
-rwxr-xr-x  1 root root  1040088 Aug 31 01:41 libglib-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgmodule-2.0.so ->
libgmodule-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgmodule-2.0.so.0 ->
libgmodule-2.0.so.0.4600.1
-rwxr-xr-x  1 root root     9288 Aug 31 01:41 libgmodule-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       16 Aug 30 23:34 libgmp.so -> libgmp.so.10.2.0
lrwxrwxrwx  1 root root       16 Aug 30 23:34 libgmp.so.10 ->
libgmp.so.10.2.0
-rwxr-xr-x  1 root root   332752 Aug 31 01:41 libgmp.so.10.2.0
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgobject-2.0.so ->
libgobject-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgobject-2.0.so.0 ->
libgobject-2.0.so.0.4600.1
-rwxr-xr-x  1 root root   235976 Aug 31 01:41 libgobject-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       22 Aug 30 23:43 libgpg-error.so ->
libgpg-error.so.0.10.0
lrwxrwxrwx  1 root root       22 Aug 30 23:43 libgpg-error.so.0 ->
libgpg-error.so.0.10.0
-rwxr-xr-x  1 root root    12568 Aug 31 01:41 libgpg-error.so.0.10.0
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgthread-2.0.so ->
libgthread-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       26 Aug 31 00:08 libgthread-2.0.so.0 ->
libgthread-2.0.so.0.4600.1
-rwxr-xr-x  1 root root     3588 Aug 31 01:41 libgthread-2.0.so.0.4600.1
lrwxrwxrwx  1 root root       15 Aug 30 23:25 libhistory.so ->
libhistory.so.6
lrwxrwxrwx  1 root root       17 Aug 30 23:25 libhistory.so.6 ->
libhistory.so.6.3
-r-xr-xr-x  1 root root    33442 Aug 30 23:25 libhistory.so.6.3
lrwxrwxrwx  1 root root       17 Aug 31 00:01 libip4tc.so ->
libip4tc.so.0.1.0
lrwxrwxrwx  1 root root       17 Aug 31 00:01 libip4tc.so.0 ->
libip4tc.so.0.1.0
-rwxr-xr-x  1 root root    20000 Aug 31 01:41 libip4tc.so.0.1.0
lrwxrwxrwx  1 root root       17 Aug 31 00:01 libip6tc.so ->
libip6tc.so.0.1.0
lrwxrwxrwx  1 root root       17 Aug 31 00:01 libip6tc.so.0 ->
libip6tc.so.0.1.0
-rwxr-xr-x  1 root root    20564 Aug 31 01:41 libip6tc.so.0.1.0
lrwxrwxrwx  1 root root       17 Aug 31 00:00 libiperf.so ->
libiperf.so.0.0.0
lrwxrwxrwx  1 root root       17 Aug 31 00:00 libiperf.so.0 ->
libiperf.so.0.0.0
-rwxr-xr-x  1 root root    90736 Aug 31 01:41 libiperf.so.0.0.0
lrwxrwxrwx  1 root root       17 Aug 31 00:02 libipsec.so ->
libipsec.so.0.0.1
lrwxrwxrwx  1 root root       17 Aug 31 00:02 libipsec.so.0 ->
libipsec.so.0.0.1
-rwxr-xr-x  1 root root    51568 Aug 31 01:41 libipsec.so.0.0.1
lrwxrwxrwx  1 root root       16 Aug 31 00:01 libiptc.so -> libiptc.so.0.0.0
lrwxrwxrwx  1 root root       16 Aug 31 00:01 libiptc.so.0 ->
libiptc.so.0.0.0
-rwxr-xr-x  1 root root     2912 Aug 31 01:41 libiptc.so.0.0.0
lrwxrwxrwx  1 root root       18 Aug 30 23:45 liblvm2cmd.so ->
liblvm2cmd.so.2.02
-rwxr-xr-x  1 root root  1186976 Aug 31 01:41 liblvm2cmd.so.2.02
lrwxrwxrwx  1 root root       16 Aug 30 23:33 liblzo2.so -> liblzo2.so.2.0.0
lrwxrwxrwx  1 root root       16 Aug 30 23:33 liblzo2.so.2 ->
liblzo2.so.2.0.0
-rwxr-xr-x  1 root root    99548 Aug 31 01:41 liblzo2.so.2.0.0
lrwxrwxrwx  1 root root       17 Aug 30 23:47 libmagic.so ->
libmagic.so.1.0.0
lrwxrwxrwx  1 root root       17 Aug 30 23:47 libmagic.so.1 ->
libmagic.so.1.0.0
-rwxr-xr-x  1 root root    97784 Aug 31 01:41 libmagic.so.1.0.0
lrwxrwxrwx  1 root root       27 Aug 30 23:31 libmount.so ->
../../lib/libmount.so.1.1.0
lrwxrwxrwx  1 root root       15 Aug 30 23:25 libncurses.so ->
libncurses.so.5
lrwxrwxrwx  1 root root       17 Aug 30 23:25 libncurses.so.5 ->
libncurses.so.5.9
-rwxr-xr-x  1 root root   178400 Aug 31 01:41 libncurses.so.5.9
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libndr-krb5pac.so ->
libndr-krb5pac.so.0.0.1
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libndr-krb5pac.so.0 ->
libndr-krb5pac.so.0.0.1
-rwxr-xr-x  1 root root    30004 Aug 31 01:41 libndr-krb5pac.so.0.0.1
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libndr-nbt.so ->
libndr-nbt.so.0.0.1
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libndr-nbt.so.0 ->
libndr-nbt.so.0.0.1
-rwxr-xr-x  1 root root    70964 Aug 31 01:41 libndr-nbt.so.0.0.1
lrwxrwxrwx  1 root root       15 Aug 31 01:00 libndr.so -> libndr.so.0.0.5
lrwxrwxrwx  1 root root       15 Aug 31 01:00 libndr.so.0 -> libndr.so.0.0.5
-rwxr-xr-x  1 root root    66920 Aug 31 01:41 libndr.so.0.0.5
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libndr-standard.so ->
libndr-standard.so.0.0.1
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libndr-standard.so.0 ->
libndr-standard.so.0.0.1
-rwxr-xr-x  1 root root  2782516 Aug 31 01:41 libndr-standard.so.0.0.1
lrwxrwxrwx  1 root root       14 Aug 31 01:00 libnetapi.so -> libnetapi.so.0
-rwxr-xr-x  1 root root   320768 Aug 31 01:41 libnetapi.so.0
-rwxr-xr-x  1 root root   152684 Aug 31 01:41 libnspr4.so
-rwxr-xr-x  1 root root   844468 Aug 31 01:41 libnss3.so
-rwxr-xr-x  1 root root   459788 Aug 31 01:41 libnssckbi.so
-rwxr-xr-x  1 root root    93728 Aug 31 01:41 libnssdbm3.so
-rwxr-xr-x  1 root root   119704 Aug 31 01:41 libnssutil3.so
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libnss_winbind.so ->
libnss_winbind.so.2
-rwxr-xr-x  1 root root    13568 Aug 31 01:41 libnss_winbind.so.2
lrwxrwxrwx  1 root root       16 Aug 31 01:00 libnss_wins.so ->
libnss_wins.so.2
-rwxr-xr-x  1 root root     9472 Aug 31 01:41 libnss_wins.so.2
lrwxrwxrwx  1 root root       28 Aug 31 00:21 libparted-fs-resize.so ->
libparted-fs-resize.so.0.0.0
lrwxrwxrwx  1 root root       28 Aug 31 00:21 libparted-fs-resize.so.0 ->
libparted-fs-resize.so.0.0.0
-rwxr-xr-x  1 root root    78288 Aug 31 01:41 libparted-fs-resize.so.0.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:21 libparted.so ->
libparted.so.2.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:21 libparted.so.2 ->
libparted.so.2.0.0
-rwxr-xr-x  1 root root   281692 Aug 31 01:41 libparted.so.2.0.0
lrwxrwxrwx  1 root root       12 Aug 30 23:59 libpcap.so -> libpcap.so.1
lrwxrwxrwx  1 root root       16 Aug 30 23:59 libpcap.so.1 ->
libpcap.so.1.7.4
-rwxr-xr-x  1 root root   205708 Aug 31 01:41 libpcap.so.1.7.4
-rwxr-xr-x  1 root root     9380 Aug 31 01:41 libplc4.so
-rwxr-xr-x  1 root root     7476 Aug 31 01:41 libplds4.so
lrwxrwxrwx  1 root root       16 Aug 30 23:45 libpopt.so -> libpopt.so.0.0.0
lrwxrwxrwx  1 root root       16 Aug 30 23:45 libpopt.so.0 ->
libpopt.so.0.0.0
-rwxr-xr-x  1 root root    37000 Aug 31 01:41 libpopt.so.0.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:23 libprocps.so ->
libprocps.so.4.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:23 libprocps.so.4 ->
libprocps.so.4.0.0
-rwxr-xr-x  1 root root    57196 Aug 31 01:41 libprocps.so.4.0.0
lrwxrwxrwx  1 root root       19 Aug 30 23:59 libpython2.7.so ->
libpython2.7.so.1.0
-rwxr-xr-x  1 root root  1600528 Aug 31 01:41 libpython2.7.so.1.0
lrwxrwxrwx  1 root root       18 Aug 31 00:02 libracoon.so ->
libracoon.so.0.0.0
lrwxrwxrwx  1 root root       18 Aug 31 00:02 libracoon.so.0 ->
libracoon.so.0.0.0
-rwxr-xr-x  1 root root    18412 Aug 31 01:41 libracoon.so.0.0.0
lrwxrwxrwx  1 root root       16 Aug 30 23:25 libreadline.so ->
libreadline.so.6
lrwxrwxrwx  1 root root       18 Aug 30 23:25 libreadline.so.6 ->
libreadline.so.6.3
-r-xr-xr-x  1 root root   266227 Aug 30 23:25 libreadline.so.6.3
lrwxrwxrwx  1 root root       20 Aug 31 01:00 libregistry.so ->
libregistry.so.0.0.1
lrwxrwxrwx  1 root root       20 Aug 31 01:00 libregistry.so.0 ->
libregistry.so.0.0.1
-rwxr-xr-x  1 root root   116204 Aug 31 01:41 libregistry.so.0.0.1
lrwxrwxrwx  1 root root       29 Aug 31 01:00 libsamba-credentials.so ->
libsamba-credentials.so.0.0.1
lrwxrwxrwx  1 root root       29 Aug 31 01:00 libsamba-credentials.so.0 ->
libsamba-credentials.so.0.0.1
-rwxr-xr-x  1 root root    58636 Aug 31 01:41 libsamba-credentials.so.0.0.1
lrwxrwxrwx  1 root root       28 Aug 31 01:00 libsamba-hostconfig.so ->
libsamba-hostconfig.so.0.0.1
lrwxrwxrwx  1 root root       28 Aug 31 01:00 libsamba-hostconfig.so.0 ->
libsamba-hostconfig.so.0.0.1
-rwxr-xr-x  1 root root   113912 Aug 31 01:41 libsamba-hostconfig.so.0.0.1
lrwxrwxrwx  1 root root       25 Aug 31 01:00 libsamba-passdb.so ->
libsamba-passdb.so.0.24.1
lrwxrwxrwx  1 root root       25 Aug 31 01:00 libsamba-passdb.so.0 ->
libsamba-passdb.so.0.24.1
-rwxr-xr-x  1 root root   222516 Aug 31 01:41 libsamba-passdb.so.0.24.1
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libsamba-policy.so ->
libsamba-policy.so.0.0.1
lrwxrwxrwx  1 root root       24 Aug 31 01:00 libsamba-policy.so.0 ->
libsamba-policy.so.0.0.1
-rwxr-xr-x  1 root root    50500 Aug 31 01:41 libsamba-policy.so.0.0.1
lrwxrwxrwx  1 root root       22 Aug 31 01:00 libsamba-util.so ->
libsamba-util.so.0.0.1
lrwxrwxrwx  1 root root       22 Aug 31 01:00 libsamba-util.so.0 ->
libsamba-util.so.0.0.1
-rwxr-xr-x  1 root root   386620 Aug 31 01:41 libsamba-util.so.0.0.1
lrwxrwxrwx  1 root root       17 Aug 31 01:00 libsamdb.so ->
libsamdb.so.0.0.1
lrwxrwxrwx  1 root root       17 Aug 31 01:00 libsamdb.so.0 ->
libsamdb.so.0.0.1
-rwxr-xr-x  1 root root    75388 Aug 31 01:41 libsamdb.so.0.0.1
lrwxrwxrwx  1 root root       15 Aug 31 00:13 libsensors.so ->
libsensors.so.4
lrwxrwxrwx  1 root root       19 Aug 31 00:13 libsensors.so.4 ->
libsensors.so.4.3.2
-rwxr-xr-x  1 root root    45380 Aug 31 01:41 libsensors.so.4.3.2
lrwxrwxrwx  1 root root       31 Aug 30 23:31 libsmartcols.so ->
../../lib/libsmartcols.so.1.1.0
lrwxrwxrwx  1 root root       25 Aug 31 01:00 libsmbclient-raw.so ->
libsmbclient-raw.so.0.0.1
lrwxrwxrwx  1 root root       25 Aug 31 01:00 libsmbclient-raw.so.0 ->
libsmbclient-raw.so.0.0.1
-rwxr-xr-x  1 root root   177420 Aug 31 01:41 libsmbclient-raw.so.0.0.1
lrwxrwxrwx  1 root root       21 Aug 31 01:00 libsmbclient.so ->
libsmbclient.so.0.2.3
lrwxrwxrwx  1 root root       21 Aug 31 01:00 libsmbclient.so.0 ->
libsmbclient.so.0.2.3
-rwxr-xr-x  1 root root   124160 Aug 31 01:41 libsmbclient.so.0.2.3
lrwxrwxrwx  1 root root       15 Aug 31 01:00 libsmbconf.so ->
libsmbconf.so.0
-rwxr-xr-x  1 root root   350636 Aug 31 01:41 libsmbconf.so.0
-rwxr-xr-x  1 root root   107556 Aug 31 01:41 libsmime3.so
-rwxr-xr-x  1 root root   184348 Aug 31 01:41 libsoftokn3.so
lrwxrwxrwx  1 root root       19 Aug 31 00:09 libsqlite3.so ->
libsqlite3.so.0.8.6
lrwxrwxrwx  1 root root       19 Aug 31 00:09 libsqlite3.so.0 ->
libsqlite3.so.0.8.6
-rwxr-xr-x  1 root root   576888 Aug 31 01:41 libsqlite3.so.0.8.6
-rwxr-xr-x  1 root root   199620 Aug 31 01:41 libssl3.so
lrwxrwxrwx  1 root root       15 Aug 30 23:39 libssl.so -> libssl.so.1.0.0
-rwxr-xr-x  1 root root   331408 Aug 31 01:41 libssl.so.1.0.0
lrwxrwxrwx  1 root root       10 Aug 30 23:32 libss.so -> libss.so.2
lrwxrwxrwx  1 root root       12 Aug 30 23:32 libss.so.2 -> libss.so.2.0
-rwxr-xr-x  1 root root    16456 Aug 31 01:41 libss.so.2.0
lrwxrwxrwx  1 root root       19 Aug 30 23:20 libstdc++.so.6 ->
libstdc++.so.6.0.20
-rwxr-xr-x  1 root root   653580 Aug 31 01:41 libstdc++.so.6.0.20
-rwxr-xr-x  1 root root     2452 Aug 30 23:20 libstdc++.so.6.0.20-gdb.py
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libtevent-util.so ->
libtevent-util.so.0.0.1
lrwxrwxrwx  1 root root       23 Aug 31 01:00 libtevent-util.so.0 ->
libtevent-util.so.0.0.1
-rwxr-xr-x  1 root root     9472 Aug 31 01:41 libtevent-util.so.0.0.1
lrwxrwxrwx  1 root root       18 Aug 30 23:21 libtirpc.so ->
libtirpc.so.1.0.10
lrwxrwxrwx  1 root root       18 Aug 30 23:21 libtirpc.so.1 ->
libtirpc.so.1.0.10
-rwxr-xr-x  1 root root   101548 Aug 31 01:41 libtirpc.so.1.0.10
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libtorture.so ->
libtorture.so.0.0.1
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libtorture.so.0 ->
libtorture.so.0.0.1
-rwxr-xr-x  1 root root    17716 Aug 31 01:41 libtorture.so.0.0.1
lrwxrwxrwx  1 root root       26 Aug 30 23:31 libuuid.so ->
../../lib/libuuid.so.1.3.0
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libwbclient.so ->
libwbclient.so.0.12
lrwxrwxrwx  1 root root       19 Aug 31 01:00 libwbclient.so.0 ->
libwbclient.so.0.12
-rwxr-xr-x  1 root root    42240 Aug 31 01:41 libwbclient.so.0.12
lrwxrwxrwx  1 root root       21 Aug 31 01:22 libwireshark.so ->
libwireshark.so.5.0.8
lrwxrwxrwx  1 root root       21 Aug 31 01:22 libwireshark.so.5 ->
libwireshark.so.5.0.8
-rwxr-xr-x  1 root root 41647128 Aug 31 01:41 libwireshark.so.5.0.8
lrwxrwxrwx  1 root root       19 Aug 31 01:22 libwiretap.so ->
libwiretap.so.4.0.8
lrwxrwxrwx  1 root root       19 Aug 31 01:22 libwiretap.so.4 ->
libwiretap.so.4.0.8
-rwxr-xr-x  1 root root   287020 Aug 31 01:41 libwiretap.so.4.0.8
lrwxrwxrwx  1 root root       18 Aug 31 01:22 libwsutil.so ->
libwsutil.so.4.1.0
lrwxrwxrwx  1 root root       18 Aug 31 01:22 libwsutil.so.4 ->
libwsutil.so.4.1.0
-rwxr-xr-x  1 root root   104988 Aug 31 01:41 libwsutil.so.4.1.0
lrwxrwxrwx  1 root root       20 Aug 31 00:01 libxtables.so ->
libxtables.so.10.0.0
lrwxrwxrwx  1 root root       20 Aug 31 00:01 libxtables.so.10 ->
libxtables.so.10.0.0
-rwxr-xr-x  1 root root    39228 Aug 31 01:41 libxtables.so.10.0.0
lrwxrwxrwx  1 root root       13 Aug 30 23:29 libz.so -> libz.so.1.2.8
lrwxrwxrwx  1 root root       13 Aug 30 23:29 libz.so.1 -> libz.so.1.2.8
-rwxr-xr-x  1 root root    69320 Aug 31 01:41 libz.so.1.2.8
drwxr-xr-x  2 root root     4096 Aug 31 01:41 lighttpd
drwxr-xr-x  2 root root     4096 Aug 31 01:41 netatalk
drwxr-xr-x 21 root root    12288 Aug 31 01:41 python2.7
drwxr-xr-x  2 root root     4096 Aug 31 01:41 sa
drwxr-xr-x  7 root root     4096 Aug 31 01:41 samba
drwxr-xr-x  2 root root     4096 Aug 31 01:41 tc
lrwxrwxrwx  1 root root       19 Aug 30 23:25 terminfo ->
/usr/share/terminfo
drwxr-xr-x  3 root root     4096 Aug 31 01:41 traceevent
-rwxr-xr-x  1 root root     5372 Aug 31 01:41 winbind_krb5_locator.so
drwxr-xr-x  3 root root     4096 Aug 31 01:22 wireshark
drwxr-xr-x  2 root root     4096 Aug 31 01:41 xtables




On Wed, Aug 31, 2016 at 3:01 AM, Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Lijun" == Lijun QIN <lijun.qin2008@gmail.com> writes:
>
> Hi,
>
>  > I got Marvell's  buildroot-2015.11-16.06.0 which is  buildroot-2015.11 +
>  > Mavell packages
>
> No idea what those marvell changes are about.
>
>  > Compiler: gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
>  > Kernel: 3.10.70
>  > CPU: Marvell A38x
>  > When I boot up rootfs,  I got the following errors:
>
>  > VFS: Mounted root (ext3 filesystem) on device 8:1.
>  > devtmpfs: mounted
>  > Freeing unused kernel memory: 248K (c08b1000 - c08ef000)
>  > /sbin/init: error while loading shared libraries: libtirpc.so.1: cannot
>  > open shared object file: No such file or directory
>  > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
>
>  > I checked the libtirpc.so, it is in  /usr/lib and I also copy
> ibtirpc.so*
>
> The error message was about libtirpc.so.1 (notice the .1!) and you
> mentioned you looked for libtirpc.so (without .1). Can you verify that
> you have usr/lib/libtirpc.so.1?
>
> What is the output of:
> arm-linux-gnueabihf-readelf -d target/sbin/init | grep NEEDED
>
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160831/699bddaf/attachment.html>
