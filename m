From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 17 Jul 2007 19:59:52 -0700 (PDT)
Subject: [Buildroot] make fontconfig fails due to missing libxml header files
Message-ID: <11661660.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,
While buile Fontconfig with latest buildroot snapsnot i get error as 

/home/project/toolchains/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe
-I/home/project/toolchains/buildroot/build_arm/staging_dir/usr/include
--sysroot=/home/project/toolchains/toolchains/buildroot/build_arm/staging_dir/
-isysroot
/home/project/toolchains/toolchains/buildroot/build_arm/staging_dir
-DHAVE_CONFIG_H -I. -I. -I.. -I.. -I../src
-I/home/project/toolchains/buildroot/build_arm/staging_dir/include/freetype2
-I/home/project/toolchains/toolchains/buildroot/build_arm/staging_dir/include
-Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -fno-strict-aliasing
-DFC_CACHEDIR=\"/var/cache/fontconfig\" -DFONTCONFIG_PATH=\"/etc/fonts\" -g
-O2 -MT fcxml.lo -MD -MP -MF .deps/fcxml.Tpo -c fcxml.c  -fPIC -DPIC -o
.libs/fcxml.o
fcxml.c:32:27: error: libxml/parser.h: No such file or directory

This is because it searched for libxml header files in
staging_dir/usr/include/ whereas it should look inside
staging_dir/usr/include/libxml2 because this is the place where "make
libxml2" places the libxml folder & respective header files.

Also i tried to move libxml folder from staging_dir/usr/include/libxml2 to
staging_dir/usr/include/ and now when i "make fontconfig" i get error as 

./src/.libs/libfontconfig.so: undefined reference to
`xmlCreatePushParserCtxt'
../src/.libs/libfontconfig.so: undefined reference to `xmlSAX2GetLineNumber'
../src/.libs/libfontconfig.so: undefined reference to `xmlParseChunk'
../src/.libs/libfontconfig.so: undefined reference to `xmlCtxtGetLastError'
../src/.libs/libfontconfig.so: undefined reference to `xmlFreeParserCtxt'
collect2: ld returned 1 exit status

These variables are defined inside libxml/parser.h

 Kindly help me to fix these. Thankx in advance

Regards
Gururaja
-- 
View this message in context: http://www.nabble.com/make-fontconfig-fails-due-to-missing-libxml-header-files-tf4100770.html#a11661660
Sent from the BuildRoot mailing list archive at Nabble.com.
