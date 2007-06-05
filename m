From: kevint <kevint@lanl.gov>
Date: Tue, 5 Jun 2007 10:16:26 -0700
Subject: [Buildroot] problems building x86_64 target
Message-ID: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is my first post to this mailing list, so please excuse (and  
point out) anything that doesn't follow the list's protocol.

I have been trying to build an x86_64 toolchain using different  
buildroot snapshots, uClibc versions, gcc versions.  I have  
successfully built i386 images with several configuration  
combinations, but no configuration combinations are providing a  
successful build for x86_64.

The two most common errors I come across are the following (using  
buildroot-20070605.tar.bz2):

(1)
Target Architecture: x86_64
Target Architecture Variant: opteron
uClibc C library version (uClibc 0.9.29)
(toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to  
use?
GCC Compiler version (gcc 3.4.6)

All other options are default.  This is my desired configuration, but  
I tried different compiler versions, described in (2).

This configuration appears to build the target toolchain with no  
errors, but when it starts to compile busybox, it errors out on:

/tmp/buildroot/build_x86_64/staging_dir/lib/gcc/x86_64-linux-uclibc/ 
3.4.6/../../../../x86_64-linux-uclibc/sys-include/asm/param.h:5:32:  
asm-x86_64/param.h: No such file or directory

I tried linking /tmp/buildroot/build_x86_64/staging_dir/include/asm  
to /tmp/buildroot/build_x86_64/staging_dir/include/asm-x86_64 just to  
see how far it would get, and the busybox compile fails here:

console-tools/resize.c: In function `resize_main':
console-tools/resize.c:61: error: `TIOCSWINSZ' undeclared (first use  
in this function)
console-tools/resize.c:61: error: (Each undeclared identifier is  
reported only once
console-tools/resize.c:61: error: for each function it appears in.)


(2)
Target Architecture: x86_64
Target Architecture Variant: opteron
uClibc C library version (uClibc 0.9.29)
(toolchain/uClibc/uClibc-0.9.29.config) uClibc configuration file to  
use?
GCC Compiler version (gcc 4.1.2)

Almost the same as above, except for compiler versions.  This  
configuration does not successfully build gcc, and errors out on:

In file included from /tmp/buildroot/toolchain_build_x86_64/gcc-4.1.2/ 
libmudflap/mf-hooks1.c:58:
/tmp/buildroot/build_x86_64/staging_dir/x86_64-linux-uclibc/sys- 
include/unistd.h:243: error: two or more data types in declaration  
specifiers


I would appreciate any insight you are willing to offer on x86_64  
builds, as we will be using buildroot extensively in the months ahead.

Thank you for your help,

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070605/0679f3c5/attachment.htm 
