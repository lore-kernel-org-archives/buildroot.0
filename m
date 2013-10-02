From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 2 Oct 2013 18:06:31 +0200
Subject: [Buildroot] location of libxml2 header files ?
Message-ID: <5B53459BF5874D2CB0A49D06A82B64DC@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
I was wondering why the libxml2 header files are under  ...staging/usr/include/libxml2/libxml 
instead of just   ...staging/usr/include/libxml/
 
I have some problems in an autotools project where the compiler can't locate the libxml header files.
(My eclipse project was building fine, but the conversion to an autotools project gives me this problem.)
Note that in my non-autotools eclipse project I had to add that libxml2 directory to the include list (-I)
 
Coincedance or not, i found this in the gettext-tools/config.log:
(this is the same error that I encounter in my autotools project.)
 
snip from output/build/gettext-0.18.3.1/gettext-tools/config.log ...
 
| # include <unistd.h>
| #endif
| 
| #include <libcroco-0.6/libcroco/libcroco-config.h>
configure:17429: result: no
configure:17429: checking for libxml2/libxml/xmlexports.h
configure:17429: /home/buildroot12git/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -c -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -pipe -O2  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
conftest.c >&5
conftest.c:81:39: fatal error: libxml2/libxml/xmlexports.h: No such file or directory
compilation terminated.
configure:17429: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
 
.....

Maybe I did something stupid in my autotools project...


Sagaert Johan
 
