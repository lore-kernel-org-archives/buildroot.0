From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:29:00 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1515357573-10780-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20180107232900.63de8126@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Jan 2018 21:39:33 +0100, Kurt Van Dijck wrote:
> This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> properly in autoconf. This becomes necessary for static builds.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Nit: when sending a new version of a patch, it is strongly recommended
to use [PATCH v2], [PATCH v3], and include a changelog...

> ---

... right here.


> +-#if HAVE_LIBMOUNT_LIBMOUNT_H
> +-#include <libmount/libmount.h>
> +-#endif	/* HAVE_LIBMOUNT_H */
> ++#include <libmount.h>
> + 
> + #include <stdarg.h>
> + #include <errno.h>
> +diff --git a/sbin/mount/umount_libmount.c b/sbin/mount/umount_libmount.c
> +index ae5a337..2987f5d 100644
> +--- a/sbin/mount/umount_libmount.c
> ++++ b/sbin/mount/umount_libmount.c
> +@@ -59,9 +59,7 @@
> + #include <syslog.h>
> + #endif	/* HAVE_SYSLOG_H */
> + 
> +-#if HAVE_LIBMOUNT_LIBMOUNT_H
> + #include <libmount/libmount.h>
> +-#endif	/* HAVE_LIBMOUNT_H */

You still haven't fixed the <libmount/libmount.h> vs. <libmount.h>
discrepancy here :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
