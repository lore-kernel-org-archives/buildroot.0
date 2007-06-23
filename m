From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sat, 23 Jun 2007 20:32:28 +0700
Subject: [Buildroot] buildroot-20070622.tar.bz2 vs. util-linux/fdisk
Message-ID: <5d75f4610706230632l20cdcb46me89c0b339be189e9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

    With buildroot-20070622.tar.bz2 it fails to build fdisk in
util-linux with this message:

/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-c -Os -pipe  -I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
-isysroot /var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
-I../lib -Wall -Wmissing-prototypes -Wstrict-prototypes -DNCH=1
-D_FILE_OFFSET_BITS=64 -DSBINDIR=\"/sbin\" -DUSRSBINDIR=\"/usr/sbin\"
-DLOGDIR=\"/var/log\" -DVARPATH=\"/var\"
-DLOCALEDIR=\"/usr/share/locale\" -Os -pipe
-I/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/usr/include
--sysroot=/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir/
-isysroot /var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/staging_dir
llseek.c -o llseek.o
llseek.c:34: error: expected declaration specifiers or '...' before '_llseek'
llseek.c:34: error: expected declaration specifiers or '...' before 'fd'
llseek.c:34: error: expected declaration specifiers or '...' before
'offset_high'
llseek.c:35: error: expected declaration specifiers or '...' before 'offset_low'
llseek.c:35: error: expected declaration specifiers or '...' before 'result'
llseek.c:36: error: expected declaration specifiers or '...' before 'origin'
llseek.c:50: warning: return type defaults to 'int'
llseek.c: In function '_syscall5':
llseek.c:52: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '{' token
llseek.c:68: error: expected '=', ',', ';', 'asm' or '__attribute__'
before '{' token
llseek.c:34: error: parameter name omitted
llseek.c:34: error: parameter name omitted
llseek.c:34: error: parameter name omitted
llseek.c:35: error: parameter name omitted
llseek.c:35: error: parameter name omitted
llseek.c:36: error: parameter name omitted
llseek.c:93: error: expected '{' at end of input
make[2]: *** [llseek.o] Error 1
make[2]: Leaving directory
`/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/util-linux-2.12r/fdisk'
make[1]: *** [all] Error 1
make[1]: Leaving directory
`/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/util-linux-2.12r'
make: *** [/var/www/htdocs/download/bls1.0/sourcecd/source/4/isolinux/initrd2/buildroot/build_i586/util-linux-2.12r/misc-utils/chkdupexe]
Error 2
