From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 19:08:21 +0200
Subject: [Buildroot] Kernel headers from an externally built kernel
In-Reply-To: <C5029C549AA03148AF1B73C0F27DC86D016F1B7C@mse2003.vanteonrdc.vanteon.com>
References: <C5029C549AA03148AF1B73C0F27DC86D016F1B7C@mse2003.vanteonrdc.vanteon.com>
Message-ID: <20100506190821.3cb51919@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 6 May 2010 12:52:13 -0400
"Wagner, Scott" <swagner@vanteon.com> wrote:

> I would like to use buildroot to create a root file system only - I have
> an external toolchain and an external cross-built kernel made with that
> toolchain.
> 
> How do I configure buildroot to reference the external kernel's headers?
> In poking through the makefiles, it looks like this is possible, but I
> have not yet found a way to specify it through menuconfig or by feeding
> environment variables to make.  I'm currently building with
> BR2_KERNEL_none=y.
> 
> I think that as a result buildroot is trying to use the host platform's
> kernel headers, because the busybox build fails looking for an mtd
> header file, which is not present in the host's kernel headers - but
> this is just a guess.

In external toolchain mode, Buildroot simply uses the kernel headers as
available in the external toolchain. There is no option to use other
kernel headers, as it wouldn't make sense: kernel headers *are* part of
the external toolchain.

Concerning the MTD build problem, you may want to apply the patch
http://git.buildroot.net/~tpetazzoni/git/buildroot/patch/?id=93abe41eefbc1cea9b9a457011f66037772f4265.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
