From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Sep 2016 20:16:41 +0200
Subject: [Buildroot] [PATCH] board: add support for liteBoard
In-Reply-To: <cc4a8663-d5cf-6669-32c6-bd242f09e48a@grinn-global.com>
References: <20160913112747.3886-1-m.niestroj@grinn-global.com>
 <20160913173753.03f99f51@free-electrons.com>
 <cc4a8663-d5cf-6669-32c6-bd242f09e48a@grinn-global.com>
Message-ID: <20160913201641.486e7700@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Sep 2016 19:08:43 +0200, Marcin Niestroj wrote:

> > This generally looks very good. I've seen on the LAKML that you have
> > submitted upstream the support of this platform to the Linux kernel, I
> > assume you've done the same for the U-Boot part. We generally don't
> > like carrying the entire support for a new board in Buildroot in the
> > form of patches, but if those patches are clean and on their way
> > upstream (which is the case here, then it's fine).  
> 
> I've not posted U-Boot patch yet, but will do so in near future. For now
> I wait for response on mainling list about separate liteSOM and
> liteBoard support in U-Boot. Anyway, there should be not much
> difference between this patch and the one I will post to mainline
> U-Boot.

OK, good.

> > It's not exactly identical to your genimage file as it's using a single
> > U-Boot image called u-boot.imx instead of the split SPL / u-boot.img
> > that you're using. But since your platform is i.MX6 based, I suppose
> > the u-boot.imx should also work (Cc'ing Fabio on this).  
> 
> I've added SPL on purpose. We will have boards with 256 and 512 MB RAM.
> So right now we check in SPL how much RAM we have and configure memory
> subsystem accordingly. I believe we cannot configure it in full U-Boot.
> 
> In single U-Boot image there are hardcoded values that are copied to
> processor's registers (DDR configuration is among them) from the "IMX"
> U-Boot image just before running it.
> 
> Also, in mainline U-Boot there is support for imx6ul EVK with separate
> SPL by default.

OK, makes sense. Then I'll apply your patch as-is.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
