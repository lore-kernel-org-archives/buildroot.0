From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Apr 2021 15:48:34 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <CAK4VdL0qsvVUYsJr1S9OsnPG-Lc_Whn6zRzpWCsLaTfJzxsH0A@mail.gmail.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
 <20210429150143.276e4aec@windsurf>
 <CAK4VdL0qsvVUYsJr1S9OsnPG-Lc_Whn6zRzpWCsLaTfJzxsH0A@mail.gmail.com>
Message-ID: <20210429154834.5b70c1a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Apr 2021 15:26:06 +0200
Erico Nunes <nunes.erico@gmail.com> wrote:

> Ok, thanks, I will give it a try anyway.
> I noticed that the manual build instructions in
> https://wiki.seeedstudio.com/BeagleV-Make-File-System-Compile-uboot-Kernal/#compile-u-boot
> suggest a CONFIG_SYS_TEXT_BASE=0x80020000 change and as far as I see
> this is not in the build here, so maybe that could be related too.

The kernel is relocated to 80020000 by U-Boot before booting, in the
configuration I'm providing. See the boot log in the cover letter:

"""
Moving Image from 0x84000000 to 0x80200000, end=80f1b000
"""

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
