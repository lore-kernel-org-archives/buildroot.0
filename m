From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Date: Wed, 27 Apr 2016 16:38:38 -0300
Subject: [Buildroot] [PATCH 2/8] package/glmark2: gl support also
 depends on X.org
In-Reply-To: <20160427213230.0ee9fe71@free-electrons.com>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <1461586822-1003-2-git-send-email-bernd.kuhls@t-online.de>
 <20160427213230.0ee9fe71@free-electrons.com>
Message-ID: <5721153E.6040608@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/04/16 16:32, Thomas Petazzoni wrote:

> I know that may sound like a nitpicking debate, but I'm wondering if we
> shouldn't keep BR2_PACKAGE_MESA3D_OPENGL_GL as an internal mesa3d
> symbol, and instead use:
>
> 	depends on BR2_PACKAGE_HAS_LIBGL && BR2_PACKAGE_MESA3D
>
> which really expresses what we want: we want an OpenGL implementation,
> and this OpenGL implementation has to be mesa3d.
>
> Thomas

I'm fine with nitpicking, however we already use
BR2_PACKAGE_MESA3D_OPENGL_EGL and BR2_PACKAGE_MESA3D_OPENGL_ES in 
glmark2 and weston, which could also ostensibly be replaced by the more 
verbose conditional.
Granted, for weston what it really wants is wayland-egl, which AFAIK 
with our current packages is only provided by mesa3d.
Also while nitpicking the xorg drivers only want DRI so we can keep that 
as is since the xorg conditional is in there already (packages in x11r7/ 
already depend on xorg, plus mesa3d_dri gives opengl). Kind of a maybe 
take back my ACKs for the drivers.
Regards.
