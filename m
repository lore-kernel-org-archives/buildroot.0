From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sat, 28 Jul 2007 23:45:38 +0200 (CEST)
Subject: [Buildroot] latest svn trunk build saga
Message-ID: <0707282336490.8510@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Any of the below will fail when enabled on top of the attached .config :(

--------------------------------------------------------------------------
touch buildroot/build_i486/gawk-3.1.5/.unpacked
...
checking for C compiler default output file name...
configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/gawk-3.1.5/.configured] Error 77

--------------------------------------------------------------------------
touch buildroot/build_i486/strace-4.5.15/.unpacked
...
checking for C compiler default output file name... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/strace-4.5.15/.configured] Error 77

--------------------------------------------------------------------------
touch buildroot/build_i486/libpcap-0.9.5/.unpacked
...
checking for C compiler default output file name... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/libpcap-0.9.5/.configured] Error 77

--------------------------------------------------------------------------
touch buildroot/build_i486/tcpdump-3.9.5/.unpacked
...
checking for C compiler default output file name... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/tcpdump-3.9.5/.configured] Error 77

--------------------------------------------------------------------------
Applying uemacs-4.0.15-lt.02.patch using plaintext:
patching file lock.c
touch buildroot/build_i486/em-4.0.15-lt/.unpacked
...
cc1: error: buildroot/build_i486/staging_dir/include: not a directory
cc1: error: buildroot/build_i486/staging_dir/include: not a directory
make[1]: *** [basic.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [ansi.o] Error 1

--------------------------------------------------------------------------
touch buildroot/build_i486/util-linux-2.12r/.configured
...
cc1: error: buildroot/build_i486/staging_dir/include: not a directory
make[2]: *** [err.o] Error 1
make[2]: Leaving directory `buildroot/build_i486/util-linux-2.12r/lib'

--------------------------------------------------------------------------
touch buildroot/build_i486/wget-1.10.2/.unpacked
...
checking for C compiler default output file name... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/wget-1.10.2/.configured] Error 77

--------------------------------------------------------------------------
touch buildroot/build_i486/which-2.16/.unpacked
...
checking for C compiler default output... configure: error: C compiler cannot create executables
See `config.log' for more details.
make: *** [buildroot/build_i486/which-2.16/.configured] Error 77

--------------------------------------------------------------------------
buildroot/build_i486/staging_dir/usr/bin/fakeroot -- buildroot/build_i486/staging_dir/_fakeroot.rootfs.i486.ext2
rootdir=buildroot/project_build_i486/uclibc/root
table='target/generic/mini_device_table.txt'
makedevs: line 53: regular file 'buildroot/project_build_i486/uclibc/root/usr/share/udhcpc/default.script' does not exist: No such file or directory
-rw-r--r-- 1 cii cii 153564160 Jul 28 23:30 buildroot/binaries/uclibc/rootfs.i486.ext2


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 3477 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070728/0fa1845b/attachment.obj 
