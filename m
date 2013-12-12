From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Dec 2013 08:38:34 +0100
Subject: [Buildroot] [RFC 0/2] uboot: add u-boot.pbl support
In-Reply-To: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20131212083834.3a7b05e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

On Thu, 24 Oct 2013 10:24:24 -0500, Ryan Barnett wrote:
> This patchset introduces support for generating a u-boot.pbl image
> format in u-boot. The u-boot.pbl image format is used by the Freescale?s
> QorIQ series of processors for in a non-NOR flash based boot
> configuration. It also adds support to u-boot to generate a Reset
> Configuration Word (RCW) binary file ? RCW.bin. Customization of the
> RCW can be one of two methods ? using Freescale?s QorIQ Configuration
> Suite (QCS) or by .cfg format specified by docs/README.pblimage in the
> U-Boot source.

[...]

FWIW, I've looked at this code and discussed it with Ryan. The first
thing is that it adds too much stuff in uboot/uboot.mk and
uboot/Config.in, so I've created a patch that moves platform-specific
stuff into other .mk and Config.in files within boot/uboot/, on top of
which I've changed Ryan's patch. It makes things more reasonable I
believe.

See:

   http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=uboot-arch-spec

However, I've asked Ryan to take some significant portions of his cover
letter, and use that to extend the Config.in help text to explain how
this thing can/should be used, and under what conditions.

I guess Ryan will resubmit the set of 3 patches when he is done with
this Config.in help text writing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
