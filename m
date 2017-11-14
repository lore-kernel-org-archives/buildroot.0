From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 14 Nov 2017 22:11:25 +0300
Subject: [Buildroot] [PATCH/next 4/5] solidrun/macchiatobin: add new
 board
In-Reply-To: <20171113195145.oiv7psm4w3hzmcou@speedy.hunter>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-5-geomatsi@gmail.com>
 <20171113145215.vc3ip3kxuawcpogx@sapphire.tkos.co.il>
 <20171113195145.oiv7psm4w3hzmcou@speedy.hunter>
Message-ID: <20171114191125.etma4hsumozmavk3@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Baruch,

> > > +BR2_TARGET_ARMADA_FIRMWARE=y
> > > +BR2_TARGET_ARMADA_FIRMWARE_IMAGE="mrvl_scp_bl2_8040.img"
> > > +BR2_TARGET_ARMADA_FIRMWARE_VERSION="binaries-marvell-armada-17.10"
> > 
> > It turns out that this firmware is not required, at least for the mainline 
> > kernel. The system boots just fine without it. It might be needed for the 
> > Marvell provided kernel. I didn't check that.
> 
> Thanks for checking! I followed BSP HOWTO at http://wiki.macchiatobin.net.
> But it looks slightly outdated since it refers to 17.06 versions for all
> the repositories. I will check both mainline and vendor BSPs to clarify
> whether it is needed at all.

I tried to build both vendor and mainline BSP w/o this firmware. Both appear
to be working fine without this firmware. According to ATF firmware design doc
https://github.com/ARM-software/arm-trusted-firmware, this SCP_BL2 image is
for platform-specific power/clock/reset/sysctl coprocessor available on
some systems.

As I mentioned, I didn't notice any issues during quick smoke test of images
built w/o SCP_BL2 firmware. However, according to MacchiatoBin wiki page
quite a few Linux power management features depend on this firmware:
http://wiki.macchiatobin.net/tiki-index.php?page=Enable+Power+Management+on+MACCHIATObin

So it makes a lot of sense to keep using it. To summarize, I would prefer
to keep this package, fixing all the issues.

Regards,
Sergey
