From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:27:34 +0100
Subject: [Buildroot] [PATCH v2] package/xserver_xorg-server: fix arm
 glibc-2.30 compile
In-Reply-To: <20191113103417.3443751-1-thomas.preston@codethink.co.uk>
References: <20191113103417.3443751-1-thomas.preston@codethink.co.uk>
Message-ID: <20191115222734.4cc65b09@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 13 Nov 2019 10:34:17 +0000
Thomas Preston <thomas.preston@codethink.co.uk> wrote:

> Fixes:
> 
>   In file included from lnx_init.c:33:
>   ../../../../hw/xfree86/common/compiler.h:767:10: fatal error: sys/io.h: No such file or directory
>    #include <sys/io.h>
>           ^~~~~~~~~~
>   compilation terminated.
> 
> The ARM sys/io.h has been removed from upstream glibc, which is in
> buildroot. This causes the xorg-server build to fail on ARM when using
> the glibc toolchain. See [1], [2].
> 
> The following patches ([3], [4]) from upstream xserver fix this, but
> have not yet been released.
> 
> [1] https://sourceware.org/glibc/wiki/Release/2.30#A.3Csys.2BAC8-io.h.3E_removed_on_32-bit_Arm
> [2] https://gitlab.freedesktop.org/xorg/xserver/issues/840
> [3] https://gitlab.freedesktop.org/xorg/xserver/commit/6a2ce6c5da9456b97683db6224f38ef3b02cce4b
> [4] https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  ...-only-use-inx-outx-on-ARM-with-glibc.patch | 34 ++++++++++
>  ...t-include-sys-io.h-on-ARM-with-glibc.patch | 62 +++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
