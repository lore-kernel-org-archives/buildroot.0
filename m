From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 25 Jun 2010 10:12:27 +0000 (UTC)
Subject: [Buildroot] [Bug 1981] zlib: bump to 1.2.5
In-Reply-To: <bug-1981-163@https.bugs.busybox.net/>
References: <bug-1981-163@https.bugs.busybox.net/>
Message-ID: <20100625101227.4AAC18004E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1981

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  ---
Thanks, but it doesn't seem to work here:

./configure --shared --prefix=/usr
--libdir=/home/peko/source/buildroot/output/staging/usr/lib
--includedir=/home/peko/source/buildroot/output/staging/usr/include )
Checking for shared library support...
Building shared library libz.so.1.2.5 with
/home/peko/source/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-pipe -Os -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-I/home/peko/source/buildroot/output/staging/usr/include
-I/home/peko/source/buildroot/output/staging/include
--sysroot=/home/peko/source/buildroot/output/staging/ -isysroot
/home/peko/source/buildroot/output/staging.
Checking for off64_t... No.
Checking for fseeko... Yes.
Checking for unistd.h... Yes.
Checking whether to use vs[n]printf() or s[n]printf()... using vs[n]printf().
Checking for vsnprintf() in stdio.h... Yes.
Checking for return value of vsnprintf()... Yes.
Checking for attribute(visibility) support... Yes.
>>> zlib 1.2.5 Building
/usr/bin/make -j2 -C /home/peko/source/buildroot/output/build/zlib-1.2.5 all
libz.a

...

/home/peko/source/buildroot/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc
-pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux -msoft-float
-I/home/peko/source/buildroot/output/staging/usr/include
-I/home/peko/source/buildroot/output/staging/include
--sysroot=/home/peko/source/buildroot/output/staging/ -isysroot
/home/peko/source/buildroot/output/staging -shared
-Wl,-soname,libz.so.1,--version-script,zlib.map -pipe -Os  -mtune=arm926ej-s
-march=armv5te -mabi=aapcs-linux -msoft-float
-I/home/peko/source/buildroot/output/staging/usr/include
-I/home/peko/source/buildroot/output/staging/include
--sysroot=/home/peko/source/buildroot/output/staging/ -isysroot
/home/peko/source/buildroot/output/staging -fPIC -fPIC -o libz.so.1.2.5
adler32.lo compress.lo crc32.lo deflate.lo gzclose.lo gzlib.lo gzread.lo
gzwrite.lo infback.lo inffast.lo inflate.lo inftrees.lo trees.lo uncompr.lo
zutil.lo  -lc -L. libz.a
arm-unknown-linux-uclibcgnueabi-gcc: libz.a: No such file or directory
make[1]: *** [libz.so.1.2.5] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory
`/home/peko/source/buildroot/output/build/zlib-1.2.5'
make: *** [/home/peko/source/buildroot/output/build/zlib-1.2.5/.stamp_built]
Error 2

Maybe we shouldn't do make libz.a when we build with --shared?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
