From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Mar 2017 00:21:21 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] xlib_libXv: correct
	license info
Message-ID: <20170317234445.93DC2825C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e386020722b85aaf89b9dccc0263905763c8d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The license is actually closer to ISC than MIT, E.G.:

https://opensource.org/licenses/ISC
vs
https://opensource.org/licenses/MIT

From COPYING:
Permission to use, copy, modify, and distribute this software and its
documentation for any purpose and without fee is hereby granted,
provided that the above copyright notice appear in all copies and that
both that copyright notice and this permission notice appear in
supporting documentation, and that the names of Digital or MIT not be
used in advertising or publicity pertaining to distribution of the
software without specific, written prior permission.

E.G.  this is very similar to the normal ISC text which has been extended
with a BSD-3c style advertisinc clause.  Both are permissive licenses, but
it is more correct to call it ISC-like.

Notice: As pointed out by Rahul Bedarkar, this may actually be more closely
related to the OpenBSD template license:

http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/share/misc/license.template?rev=HEAD

But that is also based on the ISC license, so calling it ISC-like is still
correct.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aad15918520391ea0952d742db9c52c3ac2b1f7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 26f8bad..0e02439 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -7,7 +7,7 @@
 XLIB_LIBXV_VERSION = 1.0.11
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBXV_LICENSE = MIT
+XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_INSTALL_STAGING = YES
 XLIB_LIBXV_DEPENDENCIES = xlib_libX11 xlib_libXext xproto_videoproto xproto_xproto
