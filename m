From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Sat, 19 May 2018 19:34:21 +0200
Subject: [Buildroot] [PATCH] imx_usb_loader: Allow target build
In-Reply-To: <20180519142914.22ffe1b6@windsurf>
References: <1526462165-1544-1-git-send-email-vincent.prince.fr@gmail.com>
 <20180519142914.22ffe1b6@windsurf>
Message-ID: <CAB2nKc9yv1eLJD2ShXoSgokJV4nqdSXO2Jtrjr+TGcx4k+JR+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

For automatic testing purpose, I use an intermediate target (arm) between
host and DUT.
It uses imx_usb_loader and otp_com (https://github.com/ixonos/utp_com) as
described here:
https://community.nxp.com/thread/441563 to flash imx6 DUT with labgrid.

Indeed, extra arm depends is a mistake.

Sorry for indentation,

Best regards,
Vincent

2018-05-19 14:29 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed, 16 May 2018 11:16:05 +0200, Vincent Prince wrote:
> > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
>
> Could you give some details on the use case for having a target package
> for the imx_usb_loader ? Are you building a system with Buildroot that
> itself is responsible for loading a bootloader over USB to a separate
> i.MX6 target ? If not, what is your use case ?
>
> > diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/
> Config.in
> > new file mode 100644
> > index 0000000..41585e2
> > --- /dev/null
> > +++ b/package/imx-usb-loader/Config.in
> > @@ -0,0 +1,10 @@
> > +config BR2_PACKAGE_IMX_USB_LOADER
> > +     bool "imx-usb-loader"
> > +     depends on BR2_arm
>
> Why do you have this dependency ? If your use case is as explained
> above to build a Buildroot system that itself will be responsible for
> loading over USB the bootloader of a separate i.MX6 device, then this
> system may be running on something else than an ARM platform.
>
> > +    select BR2_PACKAGE_LIBUSB
>
> Indentation is wrong for this line, it should be indented with one tab.
> I can fix this up when applying once the use case is clearer.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180519/07e33e5a/attachment.html>
