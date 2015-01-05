From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 05 Jan 2015 14:14:00 +0100
Subject: [Buildroot] [PATCH 00/14] Add support for U-Boots Kbuild &
 Kconfig build system
In-Reply-To: <20150102172208.7a2ef5f1@free-electrons.com>
References: <1418426171-3483-1-git-send-email-jkrause@posteo.de>
 <20141221234006.311fcde0@free-electrons.com>
 <20150102172208.7a2ef5f1@free-electrons.com>
Message-ID: <1420463640.2905.8.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Fr, 2015-01-02 at 17:22 +0100, Thomas Petazzoni wrote:
> Hello J?rg,
> 
> On Sun, 21 Dec 2014 23:40:06 +0100, Thomas Petazzoni wrote:
> 
> > Thanks for working on this, definitely good to see someone tackling the
> > bump to the first kconfig-enabled U-Boot version.
> > 
> > There is however one big issue with your patch series: I believe it
> > breaks backward compatibility with U-Boot versions older than 2014.10.
> > And a *lot* of people are using old versions of U-Boot, to which they
> > are stuck due to the old version being their only choice for a given
> > piece of hardware.

You're right, it's not backward compatible.

> > 
> > So we clearly need to continue to support older versions of U-Boot,
> > that don't have the kconfig stuff. I just gave a try, and it seems like
> > the old U-Boot way of configuring/building things apparently still
> > works with U-Boot 2014.10. So your PATCH 01/14 is probably OK. However
> > starting from 02/14, I believe you'll be breaking things for U-Boot
> > versions older than 2014.10.

U-Boot 2014.10 still supports the old <board_name>_config build system.
So it should be safe to update the version number only (in case the
board is still supported).

> > 
> > Can you work on a solution that preserves compatibility?
> 
> Since I had no feedback about this (probably due to the winter
> holidays), 

You're right with the winter holidays..

> I'll mark those patches as "Changes Requested" in patchwork.
> Can you resend a new version that takes into account the need for
> backward compatibility with older versions of U-Boot?

I can do this. Do you have any suggestion for providing backward
compatibility? I have a config option for the U-Boot menu in mind, e.g.:
            U-Boot Version (2014.10) --->
        [ ] Use Kconfig build system (NEW)

Best regards
J?rg Krause
