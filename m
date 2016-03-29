From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 16:55:11 +0200
Subject: [Buildroot] [PATCH] freescale-imx: add
 BR2_PACKAGE_FREESCALE_IMX_HAS_VPU config
In-Reply-To: <CAAMH-ysfk8FJQ6R6TzZFOhUZc3fPYi_EZPTi6OP80YhEcCHeww@mail.gmail.com>
References: <1457535909-12591-1-git-send-email-gary.bisson@boundarydevices.com>
 <20160329162913.276b43a6@free-electrons.com>
 <CAAMH-ysfk8FJQ6R6TzZFOhUZc3fPYi_EZPTi6OP80YhEcCHeww@mail.gmail.com>
Message-ID: <20160329165511.4886b001@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Mar 2016 16:45:32 +0200, Gary Bisson wrote:

> > People who want to use those Freescale specific packages are indeed
> > supposed to use Freescale specific kernels. Just like it's the case for
> > i.MX6 I believe, no?
> 
> Yes it is true. The difference is that the i.MX6 kernel is still
> active and moving forward whereas those old platforms are stuck with a
> 2.6.x kernel. My understanding of Yocto move is that those 2.6 kernels
> won't even build with recent toolchains (gcc > 5.1) but I might be
> wrong.

We still provided gcc 4.8 and 4.9 in Buildroot, which are believe are
OK to build 2.6 kernels. And people can still use external toolchains
to get even older gcc versions if needed. We support things all the way
to gcc 4.3, since that's what the Blackfin external toolchain is using.

> > However, what I don't really understand here is whether imx-lib in its
> > latest version packaged in BR will build/work fine or not for those old
> > Freescale platforms (of course, provided you build the Freescale
> > specific kernel that is relevant for that old platform).
> >
> > If the latest version of imx-lib still supports those old platforms,
> > then I don't see where the problem is.
> 
> The imx-lib package will still be fine for those platforms as long as
> their 2.6.x kernel can build.

So we're good. imx-lib has anyway never built with anything but the
Freescale specific kernel, so the issue you're raising is not new.


> >> +ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
> >> +GST_FSL_PLUGINS_DEPENDENCIES += libfslvpuwrap
> >> +endif
> >
> > So the gst-fsl-plugins code autodetects if libfslvpuwrap is available?
> 
> No actually in this case it will build vpu-related plugins only if the
> $PLATFORM supports it.

OK. So it indeed autodetects the availability of libfslvpuwrap to
decide whether it should build the VPU plugins or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
