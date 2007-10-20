From: bjornfor at stud.ntnu.no <bjornfor@stud.ntnu.no>
Date: Sat, 20 Oct 2007 19:11:13 +0200
Subject: [Buildroot] mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or
	directory
Message-ID: <20071020191113.9hu3pqcnk80k0ws4@webmail.ntnu.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When trying to build a jffs2 image I get this error (using mostly
default Buildroot options, only set up build for arm and of course
jffs2 image):

gcc -I./include -O2 -Wall -g -c -o
/home/bjornfor/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2.o
mkfs.jffs2.c -g
-Wp,-MD,/home/bjornfor/buildroot/toolchain_build_arm/mtd_orig/.mkfs.jffs2.c.dep
mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
mkfs.jffs2.c: In function ?formalize_posix_acl?:
mkfs.jffs2.c:1084: error: ?ACL_USER_OBJ? undeclared (first use in this
function)
mkfs.jffs2.c:1084: error: (Each undeclared identifier is reported only once
mkfs.jffs2.c:1084: error: for each function it appears in.)
mkfs.jffs2.c:1085: error: ?ACL_GROUP_OBJ? undeclared (first use in
this function)
mkfs.jffs2.c:1086: error: ?ACL_MASK? undeclared (first use in this function)
mkfs.jffs2.c:1087: error: ?ACL_OTHER? undeclared (first use in this function)
mkfs.jffs2.c:1093: error: ?ACL_USER? undeclared (first use in this function)
mkfs.jffs2.c:1094: error: ?ACL_GROUP? undeclared (first use in this function)
make[1]: ***
[/home/bjornfor/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2.o]
Error 1
make[1]: Leaving directory
`/home/bjornfor/buildroot/toolchain_build_arm/mtd_orig'
make: ***
[/home/bjornfor/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2]
Error 2


I found the acl.h file in question and changed some lines in  
toolchain_build_arm/mtd_orig/mkfs.jffs2.c:

#ifndef WITHOUT_XATTR
#include <sys/xattr.h>
//#include <sys/acl.h>
#include "/home/bjornfor/buildroot/build_arm/mtd_orig/include/sys/acl.h"
#endif

But now I get other complaints:
compr_lzo.c:29:23: error: lzo/lzo1x.h: No such file or directory
compr_lzo.c: In function ?jffs2_lzo_cmpr?:
compr_lzo.c:54: warning: implicit declaration of function ?lzo1x_999_compress?
compr_lzo.c:56: error: ?LZO_E_OK? undeclared (first use in this function)

Has anyone else had this problem? How do you fix it?

Regards,
Bj?rn Forsman, Student, Norway
