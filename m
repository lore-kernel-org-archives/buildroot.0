From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sat, 4 Aug 2007 01:23:20 +0200 (CEST)
Subject: [Buildroot] [PATCH] undefined symbol BR2_PACKAGE_LIBDAEMON
In-Reply-To: <015001c7d615$67ba0510$8200000a@k2>
References: <0708032117420.13739@somehost> <015001c7d615$67ba0510$8200000a@k2>
Message-ID: <0708040028590.13739@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 3 Aug 2007, Rick Foos wrote:

> Had the same problem here. Attached is a simple patch to fix it
> preserving the current function.

Thanks.

> The libdaemon Config.in was never included in the past, but the
> libdaemon.mk file was in place.
>
> Avahi.mk refereces the libdaemon make target.
>
> Now that the select dependency is in avahi/Config.in, the missing source
> libdaemon/Config.in is a problem.

Right.  That was a miss.
libdaemon is not "networking" related in any way, AFAIK.  I would think
a better place is among the "Other stuff", one level above networking
(next to the other libs).

Index: package/Config.in
===================================================================
--- package/Config.in   (revision 19307)
+++ package/Config.in   (working copy)
@@ -63,6 +63,7 @@
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
 endif
+source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"


Cheers,

-- 
Cristian
