From: W <wildan.m@gmail.com>
Date: Tue, 4 Sep 2007 18:05:55 +0700
Subject: [Buildroot] cryptsetup, e2fsprogs plus selinux
Message-ID: <4a93f8270709040405w6d394908o969aa04dcdf5d0ab@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i already successfully build
cryptsetup, device mapper and related libraries using this patch
(http://busybox.net/bugs/view.php?id=838).., but i still cannot
create luks partition with this, i thinks this is because e2fsprogs do
not compile with devmapper support (am i right ?)

The following are the shared libraries use by mke2fs on ubuntu and
avr32 (ngw100) :

on ubuntu:
===================
 ldd /sbin/mke2fs
       linux-gate.so.1 =>  (0xffffe000)
       libext2fs.so.2 => /lib/libext2fs.so.2 (0xb7f87000)
       libcom_err.so.2 => /lib/libcom_err.so.2 (0xb7f84000)
       libblkid.so.1 => /lib/libblkid.so.1 (0xb7f7c000)
       libuuid.so.1 => /lib/libuuid.so.1 (0xb7f78000)
       libe2p.so.2 => /lib/libe2p.so.2 (0xb7f72000)
       libc.so.6 => /lib/tls/i686/cmov/libc.so.6 (0xb7e31000)
       libdevmapper.so.1.02 => /lib/libdevmapper.so.1.02 (0xb7e1f000)
       libselinux.so.1 => /lib/libselinux.so.1 (0xb7e09000)
       libsepol.so.1 => /lib/libsepol.so.1 (0xb7dc8000)
       libpthread.so.0 => /lib/tls/i686/cmov/libpthread.so.0 (0xb7db0000)
       /lib/ld-linux.so.2 (0xb7fb1000)
       libdl.so.2 => /lib/tls/i686/cmov/libdl.so.2 (0xb7dac000)


on avr32 :
===========
bash-3.2# ldd /sbin/mke2fs
       libext2fs.so.2 => /lib/libext2fs.so.2 (0x2aab3000)
       libcom_err.so.2 => /lib/libcom_err.so.2 (0x2aac5000)
       libblkid.so.1 => /lib/libblkid.so.1 (0x2aac7000)
       libuuid.so.1 => /lib/libuuid.so.1 (0x2aace000)
       libe2p.so.2 => /lib/libe2p.so.2 (0x2aad1000)
       libc.so.0 => /lib/libc.so.0 (0x2aad6000)
       ld-uClibc.so.0 => /lib/ld-uClibc.so.0 (0x2aaab000)
-------------------------cut ----------------------------------

if i compile e2fsprogs with devmapper support
(--enable-blkid-devmapper). e2fsprogs with link to the libselinux and
libsepol, i can cross compile libsepol to avr32, but the libselinux
one do not yet support avr32 arch ...

The point of my question is, how can i cross compile e2fsprogs with
devmapper support but without selinux support ? it's possible ? Can
any one here give me a hint ?

Regards
Wildan

-- 
---
Person who say it cannot be done should not interrupt person doing it.
Coz.....
Miracles are closer than you think ...
------------
http://wildanm.fisika.ui.edu
HP: 08888378594
Y! : hawking_123
