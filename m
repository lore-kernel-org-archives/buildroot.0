From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 7 Apr 2015 20:34:49 +0300
Subject: [Buildroot] [PATCH] configs/raspberrypi: remove
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
In-Reply-To: <20150407170126.GA4216@free.fr>
References: <4c57acb52a45749057a0ca92d1d982a78c6f8cc2.1428401645.git.baruch@tkos.co.il>
 <20150407170126.GA4216@free.fr>
Message-ID: <20150407173449.GE2241@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Apr 07, 2015 at 07:01:26PM +0200, Yann E. MORIN wrote:
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

There are a few other differences between raspberrypi_defconfig and 
raspberrypi_dt_defconfig:

   * Kernel version 3.12.28 vs 3.19

   * Kernel provided config vs local config

   * Toolchain with C++ support

Should the dt version take precedence on all these differences?

The readme file seems to indicate that device tree support is experimental. Is 
this no longer the case?

Note that I don't own the hardware, so I can't test the result.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
