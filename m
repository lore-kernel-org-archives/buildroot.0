From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 29 Mar 2014 14:11:56 +0100
Subject: [Buildroot] rsync fails to build
Message-ID: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

With the latest pull :

Rsync build seems to be broken

S=64 -c xattrs.c -o xattrs.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c progress.c -o progress.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c pipe.c -o pipe.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c params.c -o params.o
/home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c loadparm.c -o loadparm.o
In file included from xattrs.c:25:0:
lib/sysxattrs.h:4:24: fatal error: attr/xattr.h: No such file or directory
compilation terminated.

Package attr is not build.

rsync seems to mis the dependency to attr.
(rsync should select attr)

.
Sagaert Johan
