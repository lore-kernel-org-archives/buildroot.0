From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 13:23:57 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: vulkan with x11 needs dri3
In-Reply-To: <20180823102029.GE9365@scaer>
References: <20180823090827.4003-1-yann.morin.1998@free.fr>
 <20180823121152.30d51975@windsurf> <20180823102029.GE9365@scaer>
Message-ID: <20180823132357.1dd3a730@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 12:20:29 +0200, Yann E. MORIN wrote:

> > Doesn't this requires a bit more rework to be clean ?  
> 
> Yes, I'll have a further look by the end of the day. I've marked it as
> Changes Requested.
> 
> To be hnest, the whole of mesa3d may need a complete overhaul I think.
> Theree dubious constructs here and there, like:
> 
>     config BR2_PACKAGE_MESA3D_DRI_DRIVER
>         bool
>         select BR2_PACKAGE_MESA3D_DRIVER
>         select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
>                 (BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
> 
> So now I wonder if we shouldn't have something akin to this for Vulkan.
> 
> Really, mesa3d has become quite a nest of snakes. It's hard to follow
> and understand the dependencies between each config options...

Yes, the mesa3d package is quite complicated. But I believe this (at
least partially) reflects that the mesa3d configuration itself is quite
complicated. There are lots of drivers, all having special dependencies.

So, perhaps the Buildroot packaging can be improved (it would be
nice!), but it will remain anyway a complex package.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
