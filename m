From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 31 Aug 2012 22:10:09 +0000 (UTC)
Subject: [Buildroot] [Bug 5486] libglib2 build fails on:
 libs/libglib-2.0.so: undefined reference to `qsort_r'
In-Reply-To: <bug-5486-163@https.bugs.busybox.net/>
References: <bug-5486-163@https.bugs.busybox.net/>
Message-ID: <20120831221009.DD5979940B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5486

--- Comment #8 from twobob <seetwobob@live.co.uk> 2012-08-31 22:10:09 UTC ---
So I deleted everything again and resynced from GIT.

I now cannot replicate the earlier failure on qsort_r. However I now still
fail:

make V=99 2>&1 | tee build.log

...
libs/libglib-2.0.lax/libpcre.a/pcre_try_flipped.o
.libs/libglib-2.0.lax/libpcre.a/pcre_ucp_searchfuncs.o
.libs/libglib-2.0.lax/libpcre.a/pcre_xclass.o 
libtool: link:
/home/simon/GIT/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-ranlib
.libs/libglib-2.0.a
libtool: link: rm -fr .libs/libglib-2.0.lax
libtool: link: ( cd ".libs" && rm -f "libglib-2.0.la" && ln -s
"../libglib-2.0.la" "libglib-2.0.la" )
/bin/sh ../libtool  --tag=CC   --mode=link
/home/simon/GIT/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc  -pipe
-Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall  
-o gtester gtester.o libglib-2.0.la  
libtool: link:
/home/simon/GIT/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -pipe
-Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Wall -o
gtester gtester.o  ./.libs/libglib-2.0.so -lrt -Wl,-rpath
-Wl,/home/simon/GIT/buildroot/output/build/libglib2-2.30.2/glib/.libs
./.libs/libglib-2.0.so: undefined reference to `qsort_r'
collect2: ld returned 1 exit status
make[5]: *** [gtester] Error 1
make[5]: Leaving directory
`/home/simon/GIT/buildroot/output/build/libglib2-2.30.2/glib'
make[4]: *** [all-recursive] Error 1
make[4]: Leaving directory
`/home/simon/GIT/buildroot/output/build/libglib2-2.30.2/glib'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/home/simon/GIT/buildroot/output/build/libglib2-2.30.2/glib'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/simon/GIT/buildroot/output/build/libglib2-2.30.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/simon/GIT/buildroot/output/build/libglib2-2.30.2'
make: *** [/home/simon/GIT/buildroot/output/build/libglib2-2.30.2/.stamp_built]
Error 2


The .config has nothing in it aside from libglib2 (and auto-selected
dependencies)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
