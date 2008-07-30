From: Brian Beattie <beattie@beattie-home.net>
Date: Wed, 30 Jul 2008 15:43:57 -0700
Subject: [Buildroot] buildroot failing when jffs2 output selected
Message-ID: <1217457837.6526.6.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying the build a jffs2 filesystem but buildroot fails when trying
the build the host utilities with a missing include file "acl.h" (see
error log) after faking that file and two others the link fails due to
missing -llzo2.

Any hints?

--------------------------------------
make[1]: Entering directory
`/work/users/beattie/buildroot/toolchain_build_arm/m
td_orig'
mkdir -p /work/users/beattie/buildroot/toolchain_build_arm/mtd_orig
gcc -I./include -O2 -Wall -g -c
-o /work/users/beattie/buildroot/toolchain_build
_arm/mtd_orig/mkfs.jffs2.o mkfs.jffs2.c -g
-Wp,-MD,/work/users/beattie/buildroot
/toolchain_build_arm/mtd_orig/.mkfs.jffs2.c.dep
mkfs.jffs2.c:69:21: error: sys/acl.h: No such file or directory
mkfs.jffs2.c: In function ?formalize_posix_acl?:
mkfs.jffs2.c:1084: error: ?ACL_USER_OBJ? undeclared (first use in this
function)
mkfs.jffs2.c:1084: error: (Each undeclared identifier is reported only
once
mkfs.jffs2.c:1084: error: for each function it appears in.)
mkfs.jffs2.c:1085: error: ?ACL_GROUP_OBJ? undeclared (first use in this
function
)
mkfs.jffs2.c:1086: error: ?ACL_MASK? undeclared (first use in this
function)
mkfs.jffs2.c:1087: error: ?ACL_OTHER? undeclared (first use in this
function)
mkfs.jffs2.c:1093: error: ?ACL_USER? undeclared (first use in this
function)
mkfs.jffs2.c:1094: error: ?ACL_GROUP? undeclared (first use in this
function)
mkfs.jffs2.c: In function ?process_buffer?:
mkfs.jffs2.c:1507: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 2 has type ?long int?
mkfs.jffs2.c:1531: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 3 has type ?long int?
mkfs.jffs2.c:1548: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 3 has type ?long int?
mkfs.jffs2.c:1557: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 3 has type ?long int?
mkfs.jffs2.c:1567: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 3 has type ?long int?
mkfs.jffs2.c:1581: warning: format ?%08x? expects type ?unsigned int?,
but argum
ent 3 has type ?long int?
make[1]: ***
[/work/users/beattie/buildroot/toolchain_build_arm/mtd_orig/mkfs.jf
fs2.o] Error 1
make[1]: Leaving directory
`/work/users/beattie/buildroot/toolchain_build_arm/mt
d_orig'
make: ***
[/work/users/beattie/buildroot/toolchain_build_arm/mtd_orig/mkfs.jffs2
] Error 2


-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto
