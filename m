From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 15:30:24 +0100
Subject: [Buildroot] [PATCH 1/1] [PATCH v2 1/1] Add support for gold
 linker and LTO for GCC.
In-Reply-To: <BLU436-SMTP186D00E2AE794694F2CA956A8130@phx.gbl>
References: <BLU436-SMTP186D00E2AE794694F2CA956A8130@phx.gbl>
Message-ID: <20150307153024.1996a936@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Thomas,

On Thu, 19 Jun 2014 22:55:23 +0000, Steve Thomas wrote:
> Link Time Optimisations (LTO) from GCC needs the linker plugin. It also
> needs support from the tools, in particular the archiver (AR) to
> properly form archives that can be used by the linker.  The linker needs
> to support the plugin also.
> 
> This patch changes the linker from BFD to GOLD and wraps the ar, nm and
> ranlib utilities with a wrapper that calls the gcc-wrapper version that
> call the actual utilities with an additional argument. This is a
> temporary measure until the binutils supoort LTO natively.
> 
> Changes v1 -> v2:
>     - removed unecessary configuration option for binutils
>     - added siginging off to patches.
>     - cleaned up formatting and added missing comments.
> 
> Signed-off-by: Steve Thomas <scjthm@live.com>

I have just applied a patch adding LTO support to gcc and binutils. Can
you have a look at it, and see if it does all you need? See
http://git.buildroot.net/buildroot/commit/?id=814f63ec32585f281855587fe0a287cee32e4232.

If it does not, can you send an updated set of patches that add what's
missing for your use case?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
