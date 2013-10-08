From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 23:51:46 +0200
Subject: [Buildroot] [PATCH 1/1] xlib_libpthread-stubs: needs thread
 support
In-Reply-To: <1381267637-3957-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1381267637-3957-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20131008235146.63b90c26@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Tue,  8 Oct 2013 23:27:17 +0200, Jerzy Grzegorek wrote:

>  config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
>  	bool "libpthread-stubs"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

No, that doesn't work. When you add a toolchain dependency to one
package, you must propagate it to the reverse dependencies of this
package that are selecting this package.

For example, libdrm and libxcb are both selecting
XLIB_LIBPTHREAD_STUBS, but they do not have the
BR2_TOOLCHAIN_HAS_THREADS, so you should add this dependency to libdrm
and libxcb as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
