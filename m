From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jul 2013 12:54:35 +0200
Subject: [Buildroot] [PATCH 1/2] linux: install firmware to staging.
In-Reply-To: <20130708175221.GE3206@free.fr>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <20130708175221.GE3206@free.fr>
Message-ID: <20130709125435.68e83fc2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 8 Jul 2013 19:52:21 +0200, Yann E. MORIN wrote:

> > +# This option is used to install firmware to staging. Other packages such as
> > +# beagle-capes then install the firmware into the target. This avoids
> > +# installing all linux firmware.
> 
> I would also states that this applies to special firmware files that are
> *not* distributed with the linux-firmware package. All 'standard'
> firmwares should be installed via linux-firmware. This knob is for very
> special cases such as the BBB capes. Waht about:
> 
> # This option can be selected by other packages that require special
> # firmwares bundled in some fiorks of the Linux kernell (eg. the BBB
> # capes firmwares (.dtbo) as distributed in the TI Linux kernel fork).
> # To install other firmwares, please use the linux-firmware package.

The thing that worries me here is that this .dtbo thing for capes is
custom to the BBB kernel, and as far as I know, not in the upstream
kernel. So it annoys me a bit to have this within the linux/linux.mk
logic, because if we started to add vendor-specific logic in this
generic kernel .mk file, where are we going to end?

In order to have a better understanding of the problem, could someone
summarize how things work with those .dtbo? Where are they located
source wise, how they are built, where they should be installed,
how/when they are loaded/used in the system, etc.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
