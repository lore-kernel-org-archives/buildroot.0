From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Sun, 29 Aug 2010 22:52:22 +0200
Subject: [Buildroot] luafilesystems breaks build in current git tree
Message-ID: <4C7AC886.2080709@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hello mailinglist,

I'm pretty sure, that I was able to compile the package luafilesystem 
without any problems with 2010-08-rc1.
Even after make flush and removing the output-build directory I 
encounter the following error:

 >>> luafilesystem 1.5.0 Extracting
 >>> luafilesystem 1.5.0 Patching package/luafilesystem

Applying luafilesystem-without_large_file.patch using plaintext:
patching file src/lfs.c
 >>> luafilesystem 1.5.0 Configuring
 >>> luafilesystem 1.5.0 Building
/usr/bin/make -j2 -C 
/home/ossy/buildroot/buildroot-dev/output/build/luafilesystem-1.5.0 
CC="/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging" CFLAGS="-Os 
-pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux 
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 
-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
-I/home/ossy/buildroot/buildroot-dev/output/staging/include 
-D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE -fPIC"
make[1]: Entering directory 
`/home/ossy/buildroot/buildroot-dev/output/build/luafilesystem-1.5.0'
/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging -Os -pipe 
-Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 
-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
-I/home/ossy/buildroot/buildroot-dev/output/staging/include 
-D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE -fPIC   -c -o src/lfs.o src/lfs.c
arm-unknown-linux-uclibcgnueabi-gcc: _LARGEFILE64_SOURCE: No such file 
or directory
make[1]: *** [src/lfs.o] Fehler 1


Since I spotted some commits concerning uClibs, maybe we have a 
regression here.

Regards,
Marcus
