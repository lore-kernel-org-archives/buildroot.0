From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 21 May 2010 13:36:15 +0200
Subject: [Buildroot] Building DirectFB kernel module
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01C755FC@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
References: <AB12B32E73474741A2C5361C433A44DE01C755FC@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <AANLkTimL83gvO5NX37GN_kUlaAwwRWe6SCyJ_ld8pIIt@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Phil,

I don't think the DirectFB package is supposed to build the sh772x
kernel module. It's just there because the sh772x gfxdriver depends on
the kernel ioctl interface
(gfxdrivers/sh772x/kernel-module/sh772x_gfx.h).

So if you need buildroot to build another kernel module, you will have
to add another package.
You can take package/linux-fusion as an example. It builds/installs
the fusion kernel module for the directfb multi application mode.

Regards,

--
Lionel Landwerlin

On Fri, May 21, 2010 at 12:01 PM, Phil Edworthy
<Phil.Edyworthy@renesas.com> wrote:
> Hi,
>
> I'm new to Buildroot and think I'll use it for a BSP I'm working on. I've
> added a few packages that are specific to us and it's going pretty well.
>
> However, for DirectFB I need to build a kernel module (sh772x gfx). The
> source for this is included in the DirectFB tarball. At the moment, I'm
> building the kernel and this module after building everything else with
> Buildroot.
>
> I'm not sure how to add an additional build step for this. Is there an
> existing BR package that does something similar?
>
> The alternative would be a new package for this, but then how do I get it to
> operate on the source from the DirectFB package?
>
> Thanks
> Phil
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
