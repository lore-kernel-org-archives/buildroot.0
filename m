From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Fri, 13 Nov 2009 10:24:09 -0800
Subject: [Buildroot] br-2009.08 X11 problem
Message-ID: <4AFDA449.6020005@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using br-2009.08 and I am trying to build x-org server.  X11
compilation fails because openssl/sha.h is not found:

glyph.c:30:25: error: openssl/sha.h: No such file or directory
glyph.c: In function 'HashGlyph':
glyph.c:207: error: 'SHA_CTX' undeclared (first use in this function)

I checked that the openssl package is chosen and is present in my
package directory.  Also, xserver_xorg-server.mk located in
<br_dir>/package/x11r7/xserver_xorg-server lists openssl as the
dependency.  However, during the build process there is no include flag
that points to the openssl/include directory.  What is the quick and
dirty way to fix this?  If I modify the x11 Makefile, it gets over
written during the buildroot make.

Thanks,

Roman
