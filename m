From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 14:54:15 +0100
Subject: [Buildroot] [PATCH] package/xen: fix build failure on x86 after
 bump to 4.7
In-Reply-To: <1477989452-26462-1-git-send-email-yann.morin.1998@free.fr>
References: <1477989452-26462-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161101145415.6f9dbad5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 09:37:32 +0100, Yann E. MORIN wrote:
> Since the bump to 4.7, Xen fails to build because of a double definition
> of __OBJECT_FILE__. This is due to (who would have guessed) the weirdness
> of their buildsystem.
> 
> Fix that with a dirty hack: undefine the macro before defining it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> [Alistair: Tested on ARMv7 (little endian) boot.]
> Tested-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...mk-fix-build-with-CFLAGS-from-environment.patch | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/xen/0002-xen-Rules.mk-fix-build-with-CFLAGS-from-environment.patch

This is indeed not the prettiest solution, but it's good enough. Has
one of you reported the problem upstream to the Xen people?

I've applied Yann's patch anyway.

Thanks a lot for the investigation and workaround!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
