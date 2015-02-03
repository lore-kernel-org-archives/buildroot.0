From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 11:32:58 +0100
Subject: [Buildroot] [PATCH 1/5] initscripts: new package
In-Reply-To: <1413643624-14757-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150203113258.059896c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat, 18 Oct 2014 16:47:00 +0200, Maxime Hadjinlian wrote:
> The folder init.d is currently installed by default since it's part of
> our skeleton.
> This patch creates a package out of it and make busybox/sysvinit depends
> on it.
> 
> This way, if you chose another init, you don't end up with a useless
> init.d folder.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

We reviewed this and believe this is a good idea. However, we would
like:

 1/ To keep the sysvinit inittab in the sysvinit package.

 2/ Move the Busybox inittab in the busybox package, and install it
 when the Busybox init applet is enabled in the Busybox configuration
 file.

 3/ Have a Config.in file for BR2_PACKAGE_INITSCRIPTS, which is
 selected by both BR2_INIT_BUSYBOX and BR2_INIT_SYSV. Then the busybox
 and sysvinit would no longer have initscripts in their _DEPENDENCIES,
 because initscripts is not a build-time dependency for those packages,
 but only a runtime dependency.

Could you work on those 3 items, and resend an updated version of your
series?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
