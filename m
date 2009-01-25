From: Mitesh Gupta <guptamitesh@gmail.com>
Date: Mon, 26 Jan 2009 01:49:02 +0530
Subject: [Buildroot] Mysql compilation error with Buildroot
Message-ID: <8ebba8c20901251219x4419089mf9afb5970882ebb1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I am getting the following error when adding mysql client to the buildroot
configuration

g++ -Os
-I/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/usr/include
-I/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/include
--sysroot=/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/
-isysroot /home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir
-mtune=i686 -march=i686 -fno-implicit-templates -fno-exceptions -fno-rtti
--sysroot=/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/
-rdynamic -o mysql mysql.o readline.o sql_string.o completion_hash.o
-L/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/lib
-L/home/mitesh/buildroot-2009.02-rc2/build_i686/staging_dir/usr/lib
-lreadline -lncurses -lpthread ../libmysql/.libs/libmysqlclient.so
../zlib/.libs/libzlt.a -lcrypt -lnsl -lm -Wl,--rpath
-Wl,/home/mitesh/buildroot-2009.02-rc2/build_i686/mysql_client-5.1.23-rc/libmysql/.libs
-Wl,--rpath -Wl,/usr/lib/mysql
/usr/bin/ld: this linker was not configured to use sysroots
collect2: ld returned 1 exit status
make[3]: *** [mysql] Error 1
make[3]: Leaving directory
`/home/mitesh/buildroot-2009.02-rc2/build_i686/mysql_client-5.1.23-rc/client'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/mitesh/buildroot-2009.02-rc2/build_i686/mysql_client-5.1.23-rc/client'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/mitesh/buildroot-2009.02-rc2/build_i686/mysql_client-5.1.23-rc'
make: ***
[/home/mitesh/buildroot-2009.02-rc2/build_i686/mysql_client-5.1.23-rc/.stamp_built]
Error 2

The main error seems to be /usr/bin/ld: this linker was not configured to
use sysroots. I have googled but cant find any solutions to it. Kindly help
me with it.

Thanks

Mitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090126/df6ac24d/attachment.htm 
