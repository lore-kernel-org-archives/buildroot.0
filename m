From: Mitesh Gupta <guptamitesh@gmail.com>
Date: Tue, 3 Feb 2009 19:01:25 +0530
Subject: [Buildroot] MySql make error
Message-ID: <8ebba8c20902030531i350c2c46vf2981f88947863ea@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I used build root and did a make menuconfig in that I jus added mysql
client. Then edited  vim package/database/mysql_client/mysql_client.mk and
removed the line --without-server for mysql to build with the server and did
a make after making the change. I encounted the following error while make
(just including the short output)

/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-g++
-Os -pipe -Os
-I/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir -mtune=i686
-march=i686 -Os -pipe -Os
-I/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/usr/include
-I/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/include
--sysroot=/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/ -isysroot
/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir -mtune=i686
-march=i686 -fno-implicit-templates -fno-exceptions -fno-rtti
--sysroot=/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/ -rdynamic
-o gen_lex_hash gen_lex_hash.o
-L/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/lib
-L/mnt/rootfs/buildroot/buildroot/build_i686/staging_dir/usr/lib
../vio/libvio.a ../mysys/libmysys.a ../dbug/libdbug.a ../regex/libregex.a
../strings/libmystrings.a ../zlib/.libs/libzlt.a -lpthread -lcrypt -lnsl -lm
-lpthread
make[3]: Leaving directory
`/mnt/rootfs/buildroot/buildroot/build_i686/mysql_client-5.1.23-rc/sql'
./gen_lex_hash > lex_hash.h-t
/bin/bash: ./gen_lex_hash: No such file or directory
make[2]: *** [lex_hash.h] Error 127
make[2]: Leaving directory
`/mnt/rootfs/buildroot/buildroot/build_i686/mysql_client-5.1.23-rc/sql'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/mnt/rootfs/buildroot/buildroot/build_i686/mysql_client-5.1.23-rc'
make: ***
[/mnt/rootfs/buildroot/buildroot/build_i686/mysql_client-5.1.23-rc/.stamp_built]
Error 2


I think the problem is it try to execute gen_lex_hash file which was
compiled and generated using the cross toolchain for the target machine and
cant be run on the machine on which I am building the system and hence the
error " /bin/bash: ./gen_lex_hash: No such file or directory ".

Is there a way this problem can be solved?

Thanks

Mitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090203/626e9abe/attachment.htm 
