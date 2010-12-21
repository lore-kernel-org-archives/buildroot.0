From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Dec 2010 10:36:59 +0100
Subject: [Buildroot] [PATCH] bare-bone support for Soekris net4501
In-Reply-To: <AANLkTim9KWDfq9pkkUodr19FVTNBZsAiYYLt258Uux0d@mail.gmail.com>
References: <AANLkTim9KWDfq9pkkUodr19FVTNBZsAiYYLt258Uux0d@mail.gmail.com>
Message-ID: <20101221103659.08f633f4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Dec 2010 20:26:38 -0500
Chris Schaefer <chris@dtzq.com> wrote:

> I had needed bare-bone configs (kernel, buildroot, busybox, uClibc) as
> a starting point for projects running on a Soekris net4501 device. I'v
> attached what I have been using in hopes it could benefit others. This
> is my first experience w/ buildroot so please let me know any
> feedback/suggestions.

Thanks a lot! Support for such platforms is very welcome!

I have a couple of comments below, though.

> diff --git a/configs/soekris-net4501_defconfig
> b/configs/soekris-net4501_defconfig

Your patch is wrapped, something is wrong in your e-mail configuration.

Moreover, the Buildroot configuration file should be a minimal
configuration. To do so :

	make savedefconfig
	cp defconfig configs/soekris-net4501_defconfig

> diff --git a/target/device/soekris/net4501/busybox.config
> b/target/device/soekris/net4501/busybox.config

Why do you need a special Busybox configuration file ?

> diff --git a/target/device/soekris/net4501/device_table.txt
> b/target/device/soekris/net4501/device_table.txt

Could you detail the differences with the default device table ?

> diff --git a/target/device/soekris/net4501/linux26.config
> b/target/device/soekris/net4501/linux26.config

It should be stored in:

	board/soekris/net4501

And it should be a minimal kernel configuration. So in your kernel tree:

	make savedefconfig

and then

	cp defconfig /path/to/buildroot/board/soekris/net4501/linux-x.y.z.config

> diff --git a/target/device/soekris/net4501/target_skeleton/bin/.empty
> b/target/device/soekris/net4501/target_skeleton/bin/.empty

Could you highlight the differences between this target skeleton and
the default one ? I'm trying to avoid the duplication of skeletons, so
I need to understand what this one adds, and how we can solve it
without duplicating the complete target skeleton.

> diff --git a/target/device/soekris/net4501/uClibc.config
> b/target/device/soekris/net4501/uClibc.config

Could you detail why a specific uClibc configuration is needed compared
to the default one we ship in toolchain/uClibc/ ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
