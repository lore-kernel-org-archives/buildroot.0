From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Mar 2014 16:32:34 +0100
Subject: [Buildroot] [PATCH v3 2/4] mesa3d: modularize and bump to
 version 10.0.3
In-Reply-To: <gt2suaxvbl.ln2@ID-313208.user.individual.net>
References: <1394285816-7111-1-git-send-email-berndkuhls@hotmail.com>
 <BLU0-SMTP97E4F8E4DBB4C0482F0C9D98A0@phx.gbl>
 <20140308152101.38b8ac66@skate>
 <gt2suaxvbl.ln2@ID-313208.user.individual.net>
Message-ID: <20140309163234.275df357@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 08 Mar 2014 19:08:16 +0100, Bernd Kuhls wrote:

> > In your Config.in, you have a dependency from EGL/OpenVG on udev, but
> > it isn't reflected here. Which one is correct?
> 
> Hi,
> 
> OpenVG depends on EGL (--enable-egl):
> "configure: error: cannot enable OpenVG without EGL"
> 
> EGL depends on gallium support (--enable-gallium-egl):
> "configure: error: cannot enable OpenVG without egl_gallium"
> 
> The EGL drm module depends on gbm:
> "configure: error: EGL platform drm needs gbm"
> 
> gbm depends on udev:
> "error: gbm needs udev"

Ah, ok!

> This dependency chain is present in Config.in, should this also be present 
> in the mesa3d.mk-sections mentioned above? Is
> 
> ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
> MESA3D_DEPENDENCIES += udev
> 
> not enough?

No, as long as the Config.in "select" ensure that
BR2_PACKAGE_MESA3D_GBM is selected in the appropriate cases, then it's
fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
