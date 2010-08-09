From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Aug 2010 16:18:26 +0200
Subject: [Buildroot] setting a driver in directfb through buildroot
In-Reply-To: <AANLkTi=_+g2q3yxoF+hH18vYPsWZXFq25nYwUf118WQ1@mail.gmail.com>
References: <AANLkTi=_+g2q3yxoF+hH18vYPsWZXFq25nYwUf118WQ1@mail.gmail.com>
Message-ID: <20100809161826.319e58f3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anthony,

On Mon, 9 Aug 2010 13:05:25 +0100
anthony henderson <development@fair-games.com> wrote:

> I hope someone can help me out on this.
> I've compiled my rootfs in build root with directfb set.  I'm using a cirrus
> logic FB93xx, which as far as I can see it has a driver.  I can't see any
> way of setting the driver in make menuconfig.  I can however see in the
> directory buildroot/package/directfb a file called config.in.  Can I set
> here?  If so can anyone tell me what to put in for the EP93XX driver, I
> can't find anything documented?  I have tried setting from my ARM system
> using the directfb-config  with
> directfb-config --graphics=ep93xx.  This doesn't work.  I just says driver
> none.
> 
> I think I need the correct driver as directfb examples are crashing with
> directfbcreate(&dfb) initialization error!

I've cooked the attached patch to allow a Buildroot option to enable
the DirectFB ep9x driver. Could you apply the patch to Buildroot, enable
the BR2_PACKAGE_DIRECTFB_EP9X option, and rebuild ?

Note: I haven't tested the patch, so it may not work.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Add-support-for-DirectFB-EP9x-driver.patch
Type: text/x-patch
Size: 1320 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100809/0469523e/attachment.bin>
