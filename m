From: Peter Kuemmel <syntheticpp@gmx.net>
Date: Sat, 15 Feb 2014 10:19:17 +0100
Subject: [Buildroot] enable eglfs
In-Reply-To: <CAAXf6LVZ2i6XhV+3uVV86ru=adVjS9NkC1S873+wbL+-0VtUng@mail.gmail.com>
References: <52FF0E04.6030800@gmail.com>,
 <CAAXf6LVZ2i6XhV+3uVV86ru=adVjS9NkC1S873+wbL+-0VtUng@mail.gmail.com>
Message-ID: <trinity-1adbe988-4720-49e0-bac8-44452d6d42f5-1392455957094@3capp-gmx-bs31>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
> You need to enable a provider of opengl. In your case, you need
> rpi-userland, but in general these are the current choices:

In the menu -> Target packages -> Hardware handling -> rpi-userland

> 
> grep -rn 'select BR2_PACKAGE_HAS_OPENGL_' package/
> package/freescale-imx/gpu-viv-bin-mx6q/Config.in:7:     select
> BR2_PACKAGE_HAS_OPENGL_EGL
> package/freescale-imx/gpu-viv-bin-mx6q/Config.in:8:     select
> BR2_PACKAGE_HAS_OPENGL_ES
> package/ti-gfx/Config.in:3:     select BR2_PACKAGE_HAS_OPENGL_EGL
> package/ti-gfx/Config.in:4:     select BR2_PACKAGE_HAS_OPENGL_ES
> package/rpi-userland/Config.in:7:       select BR2_PACKAGE_HAS_OPENGL_EGL
> package/rpi-userland/Config.in:8:       select BR2_PACKAGE_HAS_OPENGL_ES
> package/sunxi-mali/Config.in:3: select BR2_PACKAGE_HAS_OPENGL_EGL
> package/sunxi-mali/Config.in:4: select BR2_PACKAGE_HAS_OPENGL_ES
> 
> To know which symbol to grep for, I looked at the help of the comment
> you mentioned, to see what it depended on.
> 
> Best regards,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
