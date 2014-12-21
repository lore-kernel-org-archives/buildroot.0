From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:40:06 +0100
Subject: [Buildroot] [PATCH 00/14] Add support for U-Boots Kbuild &
 Kconfig build system
In-Reply-To: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
Message-ID: <20141221234006.311fcde0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sat, 13 Dec 2014 00:15:57 +0100, J?rg Krause wrote:
> This patch series adds to the bootloader Das U-Boot:
>   * Update to the latest stable version 2014.10
>   * Support for its Kbuild & Kconfig build system
>   * Documentation in the manual
>   * Fixes and adjustments to the packages infrastructure

Thanks for working on this, definitely good to see someone tackling the
bump to the first kconfig-enabled U-Boot version.

There is however one big issue with your patch series: I believe it
breaks backward compatibility with U-Boot versions older than 2014.10.
And a *lot* of people are using old versions of U-Boot, to which they
are stuck due to the old version being their only choice for a given
piece of hardware.

So we clearly need to continue to support older versions of U-Boot,
that don't have the kconfig stuff. I just gave a try, and it seems like
the old U-Boot way of configuring/building things apparently still
works with U-Boot 2014.10. So your PATCH 01/14 is probably OK. However
starting from 02/14, I believe you'll be breaking things for U-Boot
versions older than 2014.10.

Can you work on a solution that preserves compatibility?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
