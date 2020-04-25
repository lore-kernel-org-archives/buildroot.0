From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 23:17:06 +0200
Subject: [Buildroot] [PATCH 1/1] board/raspberrypi/post-build.sh: let
 HDMI console depends on generic getty option
In-Reply-To: <20191028090150.15099-1-mailist@logilin.fr>
References: <20191028090150.15099-1-mailist@logilin.fr>
Message-ID: <20200425231706.37aa1c26@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Oct 2019 10:01:50 +0100
Christophe Blaess <mailist@logilin.fr> wrote:

> From: Christophe Blaess <christophe.blaess@logilin.fr>
> 
> When the BR2_TARGET_GENERIC_GETTY option is disabled, the inittab line
> running getty on serial console is commented out. But the line running
> the HDMI console on Raspberry Pi is still enabled. With this patch the
> HDMI getty line is removed.
> 
> Signed-off-by: Christophe Blaess <christophe.blaess@logilin.fr>

I understand your idea, but I think it is misleading. Indeed, when you
configure a getty with BR2_TARGET_GENERIC_GETTY, you configure on which
tty device this getty will run, using sub-options. So when you disable
this BR2_TARGET_GENERIC_GETTY option, you expect only that one getty to
be disabled.

I don't think this should affect other gettys potentially enabled by
the post-build script.

It is pretty uncommon in our defconfigs to have two gettys running. We
did this for RaspberryPi because a number of newcomers build our
defconfig, and test it on hardware without a serial port.

If you don't like to have this getty, just tweak the post-build, or add
your own, etc. A defconfig provided by upstream Buildroot is anyway
just a starting point to do your own thing.

Due to this, I'm going to mark this patch as Rejected in our patch
tracking system. Of course, if others disagree or there are some
stronger arguments, I'd definitely be willing to revisit this decision.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
