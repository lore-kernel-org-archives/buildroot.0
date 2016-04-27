From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 21:49:46 +0200
Subject: [Buildroot] [PATCH 2/8] package/glmark2: gl support also
 depends on X.org
In-Reply-To: <5721153E.6040608@free-electrons.com>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
 <20160427213230.0ee9fe71@free-electrons.com>
 <5721153E.6040608@free-electrons.com>
Message-ID: <20160427214946.2e9dcb25@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 16:38:38 -0300, Gustavo Zacarias wrote:

> I'm fine with nitpicking, however we already use
> BR2_PACKAGE_MESA3D_OPENGL_EGL and BR2_PACKAGE_MESA3D_OPENGL_ES in 
> glmark2 and weston, which could also ostensibly be replaced by the more 
> verbose conditional.

I don't feel super strongly about using BR2_PACKAGE_MESA3D_OPENGL_GL
vs. BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_MESA3D. The former is
admittedly shorter.

> Granted, for weston what it really wants is wayland-egl, which AFAIK 
> with our current packages is only provided by mesa3d.

Not sure what you mean here. Do you mean we should have a
BR2_PACKAGE_MESA3D_WAYLAND_EGL blind option?

> Also while nitpicking the xorg drivers only want DRI so we can keep that 
> as is since the xorg conditional is in there already (packages in x11r7/ 
> already depend on xorg, plus mesa3d_dri gives opengl). Kind of a maybe 
> take back my ACKs for the drivers.

Hum, yes for the X.org drivers, I don't see why the patches are needed
indeed. Unless Bernd disagrees, I will mark patches 5, 6, 7 and 8 as
Rejected.

Bernd, can you respin patches 1, 2, 3 and 4 to take into account the
comments Gustavo and I made (as well as include the Acked-by from
Gustavo on patches 2, 3 and 4) ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
