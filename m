From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 00:13:09 +0100
Subject: [Buildroot] What's the buildroot attitude to u-boot building?
In-Reply-To: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
References: <CAE21AQqMQmKKL0=Q55P2zQhV8+iBdpX416xK+SgZd3+ONi8Mgg@mail.gmail.com>
Message-ID: <20140222001309.143e02f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Manning,

On Fri, 21 Feb 2014 14:53:06 +1300, Charles Manning wrote:

> I am having a look at adding some stuff to generate a signed pre-loader for
> the SoCFPGA architecture.

As you can see, some people are already working on supporting the
SoCKit platform, which uses the SoCFPGA architecture.

> There seem to be two options to doing this:
> 1) Have it fall out of building u-boot (probably the best option once the
> patches I'm pushing into u-vboot have settled down)
> 2) Make an independent build like xloader (probably a better interum
> solution), since for now the SocFPGA preloader building is still somewhat
> haphazard and needs a magic version of u-boot.

I'm not sure to understand here. A defconfig for a SoCFPGA platform was
submitted today, and a single build of U-Boot produces both the
pre-loader and the real U-Boot image.

> For instance, why are there things like  BR2_TARGET_UBOOT_ETHADDR?
> Overriding elements of the u-boot config header by patching over them from
> a complete different config system (buildroot) seems to be asking for
> trouble.

Why is this asking for trouble?

Anyway, I agree that these tuning options for U-Boot are a bit weird.
Since in U-Boot there is no separation between the configuration and
the definition of the hardware platform, most people should patch
U-Boot if they want to change their configuration.

Options such as BR2_TARGET_UBOOT_ETHADDR have been here for many many
years, and we have simply kept them over time. It was added back in
June 2007.

While I don't find it particularly pretty, I kind of fail to see what
troubles you think it could cause. Could you give more details about
this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
