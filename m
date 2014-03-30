From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 17:24:13 +0200
Subject: [Buildroot] [PATCH 1/1 v2] xdriver_xf86-video-intel: Bump
 version to 2.99.911
In-Reply-To: <t9jl0bxj2h.ln2@ID-313208.user.individual.net>
References: <1396178545-12912-1-git-send-email-bernd.kuhls@t-online.de>
 <20140330151109.658eb835@skate>
 <t9jl0bxj2h.ln2@ID-313208.user.individual.net>
Message-ID: <20140330172413.049cd7d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 30 Mar 2014 15:37:33 +0200, Bernd Kuhls wrote:

> > Do we want KMS vs. UMS to be a configurable option?
> 
> this is not necessary because the driver can have both options compiled, 
> therefore I removed the kms/ums-related options.

Ok.

> > Then in the Config.in file, if BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is
> > enabled, you want to select MESA3D.
> 
> +       select BR2_PACKAGE_MESA3D if BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
> 
> leads to
> 
> package/mesa3d/Config.in:1:error: recursive dependency detected!
> package/mesa3d/Config.in:1:     symbol BR2_PACKAGE_MESA3D is selected by BR2
> _PACKAGE_MESA3D_DRI_DRIVER_I965
> package/mesa3d/Config.in:70:    symbol BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 
> depends on BR2_PACKAGE_MESA3D

Aaah, yes, I was mistaken. If BR2_PACKAGE_MESA3D_DRI_DRIVER_I965 is
enabled, then of course BR2_PACKAGE_MESA3D is already enabled. Sorry
for the noise.

Can you look into the other circular dependency that your patch series
has introduced? I've reported it to you yesterday evening.

Also, by any chance, are you on IRC ? It would sometimes be useful to
be able to discuss things directly with you. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
