From: =?ISO-8859-1?Q?Marc=2DAndr=E9_H=E9bert?= <hebert.marcandre@gmail.com>
Date: Fri, 18 Jun 2010 15:46:22 -0400
Subject: [Buildroot] Problem building ncurses
Message-ID: <AANLkTikJOmTQ8C91PrGs2wAWWxgvjGvOx8XfXXe6j4ZH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried adding alsa-util to my configuration so ncurses is
automatically included. But the build for ncurses fails. I saw the
patch for updating ncurses to 5.7 but it still fails but differently.
I am using an external toolchain. Here are my error messages:

Error for ncurses-5.6:
/home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc
-Os -pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/vadmin/workdir/git/buildroot/output/staging/ -Os -pipe -Os
-mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/  -o
foldkeys ../obj_s/foldkeys.o
-Wl,-rpath,/home/vadmin/workdir/git/buildroot/output/build/ncurses-5.6/lib
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/
-L/home/vadmin/workdir/git/buildroot/output/staging/lib
-L/home/vadmin/workdir/git/buildroot/output/staging/usr/lib -I../test
-I. -DHAVE_CONFIG_H -I. -I../include  -D_GNU_SOURCE -DNDEBUG -Os -pipe
-Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/  -fPIC
`echo "-L../lib -lform -lmenu -lpanel -lncurses  " | sed -e
's/-lform.*-lpanel[^ ]*//'` -lm
../obj_s/foldkeys.o: In function `demo_foldkeys':
foldkeys.c:(.text+0x30): undefined reference to `_nc_strnames'
foldkeys.c:(.text+0x4c): undefined reference to `_nc_strnames'
collect2: ld returned 1 exit status
make[1]: *** [foldkeys] Error 1
make[1]: Leaving directory
`/home/vadmin/workdir/git/buildroot/output/build/ncurses-5.6/test'

Error for ncurses-5.7:
/home/vadmin/CodeSourcery/Sourcery_G++_Lite/bin/arm-none-linux-gnueabi-gcc
-Os -pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 --sysroot
/home/vadmin/workdir/git/buildroot/output/staging/ -Os -pipe -Os
-mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/  --param
max-inline-insns-single=1200  -o dots ../obj_s/dots.o
-Wl,-rpath,/home/vadmin/workdir/git/buildroot/output/build/ncurses-5.7/lib
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/
-L/home/vadmin/workdir/git/buildroot/output/staging/lib
-L/home/vadmin/workdir/git/buildroot/output/staging/usr/lib -I../test
-I. -DHAVE_CONFIG_H -I. -I../include  -D_GNU_SOURCE -DNDEBUG -Os -pipe
-Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
--sysroot /home/vadmin/workdir/git/buildroot/output/staging/  --param
max-inline-insns-single=1200  -fPIC  -L../lib -lncurses   -lutil  -lm
../obj_s/dots.o: In function `main':
dots.c:(.text+0x12c): undefined reference to `_nc_cur_term'
dots.c:(.text+0x13c): undefined reference to `_nc_cur_term'
dots.c:(.text+0x14c): undefined reference to `_nc_cur_term'
dots.c:(.text+0x160): undefined reference to `_nc_cur_term'
dots.c:(.text+0x174): undefined reference to `_nc_cur_term'
../obj_s/dots.o:dots.c:(.text+0x188): more undefined references to
`_nc_cur_term' follow
collect2: ld returned 1 exit status
make[2]: *** [dots] Error 1
make[2]: Leaving directory
`/home/vadmin/workdir/git/buildroot/output/build/ncurses-5.7/test'

I've tried looking at the code but I don't even get how dots.c (for
5.7) references _nc_cur_term. Any help/suggestion would be welcomed.

Thanks
Marc
