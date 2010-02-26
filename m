From: Heiko Zuerker <heiko@zuerker.org>
Date: Fri, 26 Feb 2010 07:26:21 -0600
Subject: [Buildroot] mkfs.jffs2 can't find zlib.h
Message-ID: <20100226072621.16992lq3smxxymm8@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,

mkfs.jffs2 fails to compile because it can't find zlib.h.
I'm using the latest GIT version of buildroot and an external toolchain.

Thanks
   Heiko

buildroot.git/output/build/mtd-utils-1.3.1/mkfs.jffs2.o mkfs.jffs2.c  
-g  
-Wp,-MD,/udi/buildroot.git/output/build/mtd-utils-1.3.1/.mkfs.jffs2.c.dep
/usr/local/arm-unknown-linux-gnueabi/bin/arm-unknown-linux-gnueabi-gcc  
-I./include   -DWITHOUT_XATTR -O2 -g -Wall -Wextra -Wwrite-strings  
-Wno-sign-compare -c -o  
/udi/buildroot.git/output/build/mtd-utils-1.3.1/compr_rtime.o  
compr_rtime.c -g  
-Wp,-MD,/udi/buildroot.git/output/build/mtd-utils-1.3.1/.compr_rtime.c.dep
mkfs.jffs2.c:73:18: error: zlib.h: No such file or directory
mkfs.jffs2.c:1519: warning: initialization discards qualifiers from  
pointer target type
mkfs.jffs2.c:1521: warning: initialization discards qualifiers from  
pointer target type
mkfs.jffs2.c: In function 'main':
mkfs.jffs2.c:1881: warning: passing argument 2 of  
'recursive_add_host_directory' discards qualifiers from pointer target  
type
make[1]: ***  
[/udi/buildroot.git/output/build/mtd-utils-1.3.1/mkfs.jffs2.o] Error 1
make[1]: *** Waiting for unfinished jobs....



----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
