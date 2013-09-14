From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 07:41:24 +0200
Subject: [Buildroot] BeagleBoneBlack Updates?
In-Reply-To: <20130913153827.46f1c747d8fb425408b5c75b@lavabit.com>
References: <CA+-urNRrUA_M45M_99OuGJvpvzRi40tCWoqPWVgUuGtpRPjj4w@mail.gmail.com>
 <20130913153827.46f1c747d8fb425408b5c75b@lavabit.com>
Message-ID: <20130914074124.2e98d5db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear rh,

On Fri, 13 Sep 2013 15:38:27 -0700, rh wrote:

> I've heard that someone (TI) was supposed to be getting code into
> the kernel 3.12-rc series. But I saw a message recently and it looked
> like the 3.12 merge window was missed so 3.13 is the target.

A patch adding a basic Device Tree for the BBB has been posted on the
Linux ARM kernel mailing list. But the support is fairly minimal, i.e
MMC/SD is not even supported, for example.

> Some in the linux kernel aren't fond of ARM devices so maybe there's
> a logjam.

I really don't see where this statement comes from. There are
gazillions of patches being integrated to support ARM devices. I've
myself worked over the last year on upstreaming the support for some
ARM processors, and while it certainly requires some work, I clearly
don't think there is some resistance against ARM devices at all.

> But I've also been told that it's due to lack of resources at
> TI.

I believe this is more the problem. TI already had issues getting the
complete support for their SoCs merged in mainline (due to the
complexity of their SoC, and also probably due to the internal
organization of TI), but now TI has laid off a huge number of
engineers, including some of which where working on upstreaming work.
So there's even less work force in TI to do this work.

And on the other hand, the CircuitCo guys have not tried at all to
submit any of their patches to mainline (the Device Tree patch
mentioned above being the first one). Their excuse is that they have
been having issues to cooperate with TI on upstreaming effort, but when
we see how long it takes TI to bring stuff in mainline, there is
certainly room for others to contribute. However, I admit it is hard to
do mainline work when the SOC vendor is also doing something, but you
don't know what.

> So maybe BBB will truly be a DIY platform. The problem that exists
> is that using the wrong device tree code can result in destroying devices.
> It seems that some people have done that and blown up their HDMI
> interface.

This is if you use the mainline kernel. The BBB defconfig in Buildroot
will use the BBB-custom kernel provided by CircuitCo, because we should
certainly offer to our users a kernel that allows to use as many
features as possible of the BBB.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
