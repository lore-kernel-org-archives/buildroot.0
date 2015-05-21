From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 23:11:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] flashrom: Bump to version 0.9.8
In-Reply-To: <1431850584-6913-1-git-send-email-florent.valette@gmail.com>
References: <1431850584-6913-1-git-send-email-florent.valette@gmail.com>
Message-ID: <20150521231130.6cf333fa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Florent Valette,

On Sun, 17 May 2015 10:16:24 +0200, Florent Valette wrote:
> This version adds support for new Intel SoC (e.g. BayTrail) and
> spi over usb devices such as pickit2 and ftdi usb-spi.
> 
> Signed-off-by: Florent Valette <florent.valette@gmail.com>
> 
> ---
> Changes v1 -> v2:
>  propagate the dependencies for libusb and libftdi
>  Note, libftdi1 is not supported, it only uses libftdi.

Applied, thanks. I've done a few changes:

    [Thomas:
      - add missing Config.in comment about the thread dependency
      - remove 'Requires PCIUtils libraries' from the Config.in help text,
        since flashrom now requires more than PCIUtils library, and we
        typically don't document such dependencies in Config.in help
        texts.]

Also, I did some followup commits to improve the Config.in help text,
and add a hash file.

Finally, the pciutils, libusb and libftdi dependencies could be made
optional, since they are only needed for some of the flashrom drivers.
However, the mechanism to select each flashrom drivers is a bit
annoying, and I'm not sure it's really worth the effort.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
