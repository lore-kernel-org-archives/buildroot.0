From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Jul 2010 09:08:28 +0000 (UTC)
Subject: [Buildroot] [Bug 1981] zlib: bump to 1.2.5
In-Reply-To: <bug-1981-163@https.bugs.busybox.net/>
References: <bug-1981-163@https.bugs.busybox.net/>
Message-ID: <20100714090828.895DB8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1981

--- Comment #6 from Paul Jones <paul.jones@iwtech.com.au>  ---
I just had another look at this and I can't seem to reproduce the problem.
Manually running the same command where yours fails seems to work here:

/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-pipe -Os -mtune=arm920t -march=armv4t -mabi=aapcs-linux -msoft-float
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include
--sysroot=/media/dev/buildroot-arm/output/staging/ -isysroot
/media/dev/buildroot-arm/output/staging -shared
-Wl,-soname,libz.so.1,--version-script,zlib.map -pipe -Os  -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include
--sysroot=/media/dev/buildroot-arm/output/staging/ -isysroot
/media/dev/buildroot-arm/output/staging -fPIC -fPIC -o libz.so.1.2.5 adler32.lo
compress.lo crc32.lo deflate.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo
infback.lo inffast.lo inflate.lo inftrees.lo trees.lo uncompr.lo zutil.lo  -lc 
-L. libz.a

(as an aside - how did you get so many repeated command line options?)

This is the output from the normal build:

./configure --shared --prefix=/usr
--libdir=/media/dev/buildroot-arm/output/staging/usr/lib
--includedir=/media/dev/buildroot-arm/output/staging/usr/include )
Checking for shared library support...
Building shared library libz.so.1.2.5 with
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/media/dev/buildroot-arm/output/staging.
Checking for off64_t... Yes.
Checking for fseeko... Yes.
Checking for unistd.h... Yes.
Checking whether to use vs[n]printf() or s[n]printf()... using vs[n]printf().
Checking for vsnprintf() in stdio.h... Yes.
Checking for return value of vsnprintf()... Yes.
Checking for attribute(visibility) support... Yes.
>>> zlib 1.2.5 Building
/usr/bin/make -j3 -C /media/dev/buildroot-arm/output/build/zlib-1.2.5 all
libz.a
.....
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/media/dev/buildroot-arm/output/staging -shared
-Wl,-soname,libz.so.1,--version-script,zlib.map -pipe -O2  -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include -fPIC -fPIC
-D_LARGEFILE64_SOURCE=1 -o libz.so.1.2.5 adler32.lo compress.lo crc32.lo
deflate.lo gzclose.lo gzlib.lo gzread.lo gzwrite.lo infback.lo inffast.lo
inflate.lo inftrees.lo trees.lo uncompr.lo zutil.lo  -lc
-L/media/dev/buildroot-arm/output/staging/lib
-L/media/dev/buildroot-arm/output/staging/usr/lib -L. libz.a
rm -f libz.so libz.so.1
ln -s libz.so.1.2.5 libz.so
ln -s libz.so.1.2.5 libz.so.1
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/media/dev/buildroot-arm/output/staging -pipe -O2  -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include -fPIC -D_LARGEFILE64_SOURCE=1
-o examplesh example.o -L. libz.so.1.2.5
/media/dev/buildroot-arm/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
--sysroot=/media/dev/buildroot-arm/output/staging -pipe -O2  -mtune=arm920t
-march=armv4t -mabi=aapcs-linux -msoft-float -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/media/dev/buildroot-arm/output/staging/usr/include
-I/media/dev/buildroot-arm/output/staging/include -fPIC -D_LARGEFILE64_SOURCE=1
-o minigzipsh minigzip.o -L. libz.so.1.2.5
make[1]: Leaving directory `/media/dev/buildroot-arm/output/build/zlib-1.2.5'
>>> zlib 1.2.5 'Installing to staging directory'

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
