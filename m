From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Tue, 14 Sep 2010 23:17:02 +0200
Subject: [Buildroot] m4 seems to have a dependency to WCHAR-SUPPORT
Message-ID: <4C8FE64E.8090508@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hello mailinglist,

I'm trying to build a rootfs without WCHAR support for util-linux-ng 
integration test purposes.
It seems, that m4 has a dependency to WCHAR.
The build breaks with current git tree and deactivated WCHAR support. 
I'm pretty sure that it worked before unselecting WCHAR.

Regards,
Marcus

/home/ossy/buildroot/buildroot-dev/output/staging/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc 
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging  -I.     -Os 
-pipe -Os  -mtune=arm926ej-s -march=armv5te -mabi=aapcs-linux 
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-D_FILE_OFFSET_BITS=64 
-I/home/ossy/buildroot/buildroot-dev/output/staging/usr/include 
-I/home/ossy/buildroot/buildroot-dev/output/staging/include -MT 
printf-parse.o -MD -MP -MF .deps/printf-parse.Tpo -c -o printf-parse.o 
printf-parse.c
In file included from printf-args.c:21:
printf-args.h:101: error: expected specifier-qualifier-list before 'wint_t'
printf-args.c: In function 'printf_fetchargs':
printf-args.c:83: error: 'union <anonymous>' has no member named 
'a_wide_char'
printf-args.c:84: error: 'wint_t' undeclared (first use in this function)
printf-args.c:84: error: (Each undeclared identifier is reported only once
printf-args.c:84: error: for each function it appears in.)
printf-args.c:86: error: expected specifier-qualifier-list before 'wint_t'
printf-args.c:90: error: 'union <anonymous>' has no member named 'a_string'
printf-args.c:94: error: 'union <anonymous>' has no member named 'a_string'
printf-args.c:95: error: 'union <anonymous>' has no member named 'a_string'
printf-args.c:117: error: 'union <anonymous>' has no member named 
'a_pointer'
printf-args.c:120: error: 'union <anonymous>' has no member named 
'a_count_schar_pointer'
printf-args.c:123: error: 'union <anonymous>' has no member named 
'a_count_short_pointer'
printf-args.c:126: error: 'union <anonymous>' has no member named 
'a_count_int_pointer'
printf-args.c:129: error: 'union <anonymous>' has no member named 
'a_count_longint_pointer'
printf-args.c:133: error: 'union <anonymous>' has no member named 
'a_count_longlongint_pointer'
