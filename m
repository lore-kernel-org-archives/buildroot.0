From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 28 Sep 2011 11:18:16 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <20110927233638.303328c9@skate>
References: <1317110841.20688.12.camel@sven> <20110927233638.303328c9@skate>
Message-ID: <1317201686.30002.1.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-09-27 at 23:36 +0200, Thomas Petazzoni wrote:
> Le Tue, 27 Sep 2011 10:04:12 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > What could possibly be wrong here? Is there anything else I need to
> > change when changing the version of gcc?
> 
> Other questions:
> 
>  * Is your CPU-specific compiler flags properly set ? Maybe they were
>    slightly wrong but working with gcc 4.3, and they no longer generate
>    appropriate code for your CPU with gcc 4.6. What is your CPU ? What
>    CPU-specific compiler flags are you using ?

This is a Marvell PXA300:

Processor	: XScale-V3 based processor rev 1 (v5l)
BogoMIPS	: 206.64
Features	: swp half thumb fastmult edsp iwmmxt 
CPU implementer	: 0x69
CPU architecture: 5TE
CPU variant	: 0x0
CPU part	: 0x688
CPU revision	: 1

And the relevant parts of the buildroot config are:

BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"
BR2_GCC_TARGET_ABI="aapcs-linux"


Regards,
Sven
