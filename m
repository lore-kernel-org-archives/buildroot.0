From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Aug 2010 23:38:28 +0200
Subject: [Buildroot] luafilesystems breaks build in current git tree
In-Reply-To: <4C7AC886.2080709@googlemail.com> (Marcus Osdoba's message of
	"Sun, 29 Aug 2010 22:52:22 +0200")
References: <4C7AC886.2080709@googlemail.com>
Message-ID: <871v9hyu97.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Osdoba <marcus.osdoba@googlemail.com> writes:

 Marcus>  Hello mailinglist,
 Marcus> I'm pretty sure, that I was able to compile the package luafilesystem
 Marcus> without any problems with 2010-08-rc1.
 Marcus> Even after make flush and removing the output-build directory I
 Marcus> encounter the following error:

 >>>> luafilesystem 1.5.0 Extracting
 >>>> luafilesystem 1.5.0 Patching package/luafilesystem

 Marcus> Applying luafilesystem-without_large_file.patch using plaintext:
 Marcus> patching file src/lfs.c
 >>>> luafilesystem 1.5.0 Configuring
 >>>> luafilesystem 1.5.0 Building
 Marcus> /usr/bin/make -j2 -C 
 Marcus> /home/ossy/buildroot/buildroot-dev/output/build/luafilesystem-1.5.0
 Marcus> CC="/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 Marcus> --sysroot=/home/ossy/buildroot/buildroot-dev/output/staging"
 Marcus> CFLAGS="-Os -pipe -Os  -mtune=arm926ej-s -march=armv5te
 Marcus> -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
 Marcus> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 Marcus> -I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include
 Marcus> -I/home/ossy/buildroot/buildroot-dev/output/staging/include
 Marcus> -D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE -fPIC"
 Marcus> make[1]: Entering directory
 Marcus> /home/ossy/buildroot/buildroot-dev/output/build/luafilesystem-1.5.0'
 Marcus> /home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
 Marcus> --sysroot=/home/ossy/buildroot/buildroot-dev/output/staging -Os -pipe
 Marcus> -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
 Marcus> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 Marcus> -I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include
 Marcus> -I/home/ossy/buildroot/buildroot-dev/output/staging/include
 Marcus> -D_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE -fPIC   -c -o src/lfs.o
 Marcus> src/lfs.c
 Marcus> arm-unknown-linux-uclibcgnueabi-gcc: _LARGEFILE64_SOURCE: No such file
 Marcus> or directory
 Marcus> make[1]: *** [src/lfs.o] Fehler 1

Yes, it's a typo (missing -D before _LARGEFILE64_SOURCE). Fixed in git,
thanks!

-- 
Bye, Peter Korsgaard
