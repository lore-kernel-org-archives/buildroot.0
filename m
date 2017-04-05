From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Wed, 5 Apr 2017 11:17:20 +0530
Subject: [Buildroot] [PATCH v6] Add defconfig for MIPS Creator ci40
In-Reply-To: <20170404221332.342b1fd7@free-electrons.com>
References: <1491306498-18165-1-git-send-email-abhimanyu.v@gmail.com>
 <20170404221332.342b1fd7@free-electrons.com>
Message-ID: <CA+V_ovs55OYv9CEF6EpeiG8eaRG6r4u3XE+Q3QrxpgEa5+7H-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thankyou Thomas, for review!
I will prepare new patch and sent it over.

On Wed, Apr 5, 2017 at 1:43 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue,  4 Apr 2017 17:18:18 +0530, Abhimanyu Vishwakarma wrote:
> > From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> >
> > Add post-image script to generate sdcard.img for
> > preparing sdcard/usb device.
> >
> > Signed-off-by: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
>

<snip>


> > +genimage \
> > +  --rootpath "${TARGET_DIR}" \
> > +  --tmppath "${GENIMAGE_TMP}" \
> > +  --inputpath "${BINARIES_DIR}" \
> > +  --outputpath "${BINARIES_DIR}" \
> > +  --config "${GENIMAGE_CFG}"
>
> Please use support/scripts/genimage.sh.
>
> I have seen the patch but must have missed that it is already merged. i
will now use it.

<snip>


> > +Flash new bootloader
> > +--------------------
> > +After booting with above method. Copy file u-boot-pistachio_marduk-2015.
> 10-v1.0.4.img
> > +to /tmp.
>
> Where is the u-boot-pistachio_marduk-2015.10-v1.0.4.img file? Why do
> you need to copy it specifically to /tmp?
>
> It is just a step to copy to some temporary place to be able to flash the
new bootloader. I also need to update
bootloader version number here.


> > Use following command to flash new bootloader:
> > +
> > +# flashcp -v /tmp/u-boot-pistachio_marduk-2015.10-v1.0.4.img /dev/mtd0
> > +
> > +Online docs
> > +-----------
> > +Mostly for OpenWRT but it is applicable to Buildroot
> > +https://docs.creatordev.io/ci40/guides/openwrt-platform/#overview
> > +
> > +Prebuilt uboot
> > +--------------
> > +http://downloads.creatordev.io/?q=u-boot/
>
> Why would we document how to get a pre-built U-Boot if Buildroot is
> already building a working U-Boot ?
>
The rest looks good to me. Could you rework those last small details,
> and send an updated version?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

Regards
Abhimanyu
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/d57cdfd6/attachment.html>
