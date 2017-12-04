From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 08:59:16 +0100
Subject: [Buildroot] [PATCH 3/3] orangepi-pc-plus: enable WiFi support
In-Reply-To: <CAMty3ZApVQOY6TbyD3-p=teHpB1TKZWzQymB4-B0owVEzwBD+w@mail.gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
 <20171108194334.10031-4-geomatsi@gmail.com>
 <CAMty3ZApVQOY6TbyD3-p=teHpB1TKZWzQymB4-B0owVEzwBD+w@mail.gmail.com>
Message-ID: <20171204085916.6c91c973@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 09:55:53 +0530, Jagan Teki wrote:

> > +# wireless driver and firmware
> > +BR2_PACKAGE_RTL8189FS=y
> > +BR2_PACKAGE_LINUX_FIRMWARE=y
> > +BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX=y
> > +  
> 
> I'm trying to understand here about minimal defconfig vs custom
> selection of packages, like adding qt5 on this patch[1]. Does wifi
> here not considered as custom config? if ie true if should be
> orangepi_pc_plus_wif_defconfig?

As usual, the boundaries are not 100% strict and fixed. However, we
have considered for a number of boards that have WiFi support that it
makes sense to enable the relevant driver and firmware to enable WiFi.

This is quite different from Qt5: for WiFi, there is basically no other
option than using this firmware and this driver. For graphics, you may
want to use Qt5. But you may also want to use X11, or Wayland/Weston,
or, etc. So Qt5 is a lot less "the obvious thing that everybody will
obviously want to use on this board".

Also, installing this firmware file and building this driver probably
adds 20 seconds to the build time of the defconfig. It's not exactly
the same for Qt5 :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
