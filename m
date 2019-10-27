From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:55:43 +0100
Subject: [Buildroot] [PATCH] Revert "package/x11r7/xlib_libXvMC: remove
 xlib_libXv dependency"
In-Reply-To: <20191027092902.14244-1-romain.naour@smile.fr>
References: <20191027092902.14244-1-romain.naour@smile.fr>
Message-ID: <20191027115543.3f77be3b@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 10:29:02 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> This reverts commit 52ac6d1c6bc625d8438539a7ff0f35d2057e9acc.
> 
> While looking at mesa3d package, I found this commit [1] about libxv
> refering to an upstream commit [2].
> 
> The commit message is confusing "This library does not itself require
> libXv for anything." but xv is still checked by the configure script
> (pkg-config) and libXvMC still include Xvlib.h from XvMClib.h
> 
> In file included from XvMClibint.h:7:0,
>                  from XvMC.c:5:
> ../include/X11/extensions/XvMClib.h:5:10: fatal error: X11/extensions/Xvlib.h:
> No such file or directory
>  #include <X11/extensions/Xvlib.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> 
> So, xlib_libXv sill use xv library by including a header and using
> XvImageFormatValues.
> 
> [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=2dbf10ba3d129d59e1a6c0e46b24c20629b277c6
> [2] https://gitlab.freedesktop.org/xorg/lib/libxvmc/commit/dd9ae03725990ee9c9336bca4b267dfbb696002f
> 
> Fixes:
> http://autobuild.buildroot.org/results/305/3051f4fbc1ab725de542a550e4f9eeb3cae385b8
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libXvMC/Config.in       | 1 +
>  package/x11r7/xlib_libXvMC/xlib_libXvMC.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
