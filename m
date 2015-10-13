From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:42:00 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mesa3d: Fix dri checks
In-Reply-To: <1443263563-13588-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443263563-13588-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151013234200.54681284@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 26 Sep 2015 12:32:43 +0200, Bernd Kuhls wrote:
> "MESA3D_EGL_PLATFORMS = drm" is only needed when dri drivers are
> enabled:
> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n1653
> 
> Unconditionally enable dri support, also for gallium drivers, quoting
> http://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=10.6#n1382
> 
>  # Strictly speaking libgbm does not require --enable-dri, although
>  # both of its backends do. Thus one can build libgbm without any
>  # backends if --disable-dri is set.
>  # To avoid unnecessary complexity of checking if at least one backend
>  # is available when building, just mandate --enable-dri.
>    AC_MSG_ERROR([gbm requires --enable-dri])
> 
> Fixes
> http://autobuild.buildroot.net/results/799/799f505594f668154af38cb2c2a1ed8a90337e9f/
> http://autobuild.buildroot.net/results/d00/d00fe349e8710a1ad557507cf04b006216806868/
> http://autobuild.buildroot.net/results/c7b/c7ba08c8cf54b2e7cf28c5e3454e92a408e724db/
> http://autobuild.buildroot.net/results/cd7/cd717c9a3a1b0080192e7e765d990cce55513005/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Shortened too long lines in commit message (Vicente)

I've applied your patch. However, I really would like to see more
comments/explanations in mesa3d.mk to explain what's going on, because
it's really tricky to understand all the possible combinations.

Also, could you address the comment made by Paul Cercueil on your
patch? He said:

"""
From what I can read from the link you pasted, your assumption is
wrong. the DRM backend of EGL can be enabled without any DRI drivers. 

Besides, there is actually a usecase for using the DRM backend of EGL
without DRI drivers: when your target platform has a DRM driver
(instead of fbdev) and does not use X11.
"""

Please send a follow-up patch to address this if applicable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
