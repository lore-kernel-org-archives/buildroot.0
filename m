From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2015 19:05:41 +0200
Subject: [Buildroot] [PATCH] configs/raspberrypi: remove
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <20150407170126.GA4216@free.fr>
References: <4c57acb52a45749057a0ca92d1d982a78c6f8cc2.1428401645.git.baruch@tkos.co.il>
 <20150407170126.GA4216@free.fr>
Message-ID: <20150407170541.GD4216@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-04-07 19:01 +0200, Yann E. MORIN spake thusly:
> On 2015-04-07 13:14 +0300, Baruch Siach spake thusly:
> > BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS became ineffective in commit a5ce7590c4b
> > (package/rpi-firmware: bump version), and was removed in commit 4e92ffdc47cc
> > (rpi-firmware: remove no longer used BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS).
> > Remove it from the Pi configs.
> > 
> > Also, remove the now obsolete comment in these config files.
> > 
> > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I basically agree on the change.
> 
> However, this means there is now no reason to have separate sdefconfig
> files for the RPi (version 1) as both now use a DTB.
> 
> So, we should now:
>   - get rid of configs/raspberrypi_defconfig 
>   - rename configs/raspberrypi_dt_defconfig into configs/raspberrypi_defconfig

And of course (given your other two patches:

  - update the readme to account for those changes

Can you rework all three patches, and send them in a single series,
please?

Thank you! :-)

Regards,
Yann E. MORIN.

> Otherwise, looks fine.
> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> >  configs/raspberrypi2_defconfig   | 2 --
> >  configs/raspberrypi_dt_defconfig | 2 --
> >  2 files changed, 4 deletions(-)
> > 
> > diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
> > index 4d4944f9e3f1..814e1820e8d1 100644
> > --- a/configs/raspberrypi2_defconfig
> > +++ b/configs/raspberrypi2_defconfig
> > @@ -19,6 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="23c76b7f608e51258c6fca02aebeb5d588583149"
> >  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> >  BR2_LINUX_KERNEL_ZIMAGE=y
> >  
> > -# Install the DTB files, as the RPi2 uses the Device Tree
> >  BR2_PACKAGE_RPI_FIRMWARE=y
> > -BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
> > diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
> > index ca62084c4d9c..c727a7cdfd1f 100644
> > --- a/configs/raspberrypi_dt_defconfig
> > +++ b/configs/raspberrypi_dt_defconfig
> > @@ -17,6 +17,4 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> >  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/raspberrypi/linux-3.18-rpi-dt.defconfig"
> >  BR2_LINUX_KERNEL_ZIMAGE=y
> >  
> > -# Install the DTB files
> >  BR2_PACKAGE_RPI_FIRMWARE=y
> > -BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
> > -- 
> > 2.1.4
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
