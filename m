From: Alexander Dahl <post@lespocky.de>
Date: Tue, 29 Mar 2016 13:30:18 +0200
Subject: [Buildroot] [PATCH] raspberrypi,
 raspberrypi2: add a serial console
In-Reply-To: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
References: <1459202897-21440-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <127322ee36893ff22f57884a111b3434@idefix.lespocky.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

Am 2016-03-29 00:08, schrieb Luca Ceresoli:
> The current Buildroot defconfigs for Raspberry Pi and Raspberry Pi 2
> instantiate a console on tty1, which appears on HDMI. Add a console on
> the serial port (ttyAMA0) to be more consistent with other defconfigs
> and provide a better out-of-the-box experience to users used to have a
> serial console from Buildroot defconfigs.

I ran in the very problem last week. So +1 for the idea.

> This requires two changes:
>  1. have two 'console=' entries in the kernel command line;
>  2. add a new getty process to the generated inittab.

Then why not split up those two changes in two patches? ;-)

> -BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"

+1

> diff --git a/package/rpi-firmware/cmdline.txt b/package/rpi-firmware/cmdline.txt
> index 38aa3782621b..155a54693bff 100644
> --- a/package/rpi-firmware/cmdline.txt
> +++ b/package/rpi-firmware/cmdline.txt
> @@ -1 +1 @@
> -root=/dev/mmcblk0p2 rootwait
> +root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200

+1

Not sure about the post build script though, maybe someone with more
experience in buildroot could comment on that.

Greets
Alex

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: C28E E6B9 0263 95CF 8FAF  08FA 34AD CD00 7221 5CC6 ***
