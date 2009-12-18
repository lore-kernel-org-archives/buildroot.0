From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Dec 2009 08:53:07 +0100
Subject: [Buildroot] [Bug 757] U-Boot: mkimage cannot be installed using
 external toolchain
In-Reply-To: <2c9a759f0912172332wb40a41fm4b79427ff40ce11d@mail.gmail.com>
References: <bug-757-163@https.bugs.busybox.net/>
	<20091209102836.8A5177776F@busybox.osuosl.org>
	<2c9a759f0912172332wb40a41fm4b79427ff40ce11d@mail.gmail.com>
Message-ID: <20091218085307.4fd6de27@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anders,

Le Fri, 18 Dec 2009 08:32:00 +0100,
Anders Darander <anders.darander@gmail.com> a ?crit :

> I'm just bumping this issue, as I've not heard anything.

Good idea. Even if the bug is registered in our bug tracker, it's
always good to push patches when we don't include them quickly.

> Recap: The problem is that $(STAGING_DIR)/usr/bin, does not exist when
> u-boot tries to install the mkimage binary. Thus, the installation
> will fail. This occurs when using an external toolchain.

I think the patch is ok to solve the immediate problem. But since
mkimage is a host tool, I would rather prefer changing the u-boot
Makefile.in to install mkimage to $(HOST_DIR)/usr/bin.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
