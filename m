From: Pieter Smith <pieter@boesman.nl>
Date: Sat, 23 Apr 2016 13:39:19 +0200
Subject: [Buildroot] [PATCH v4 7/7] beaglebone: adds barebox bootloader
	defconfig
In-Reply-To: <5716AD73.30309@mind.be>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-8-git-send-email-pieter@boesman.nl>
 <5702FACA.6080001@mind.be> <20160419202649.GA20663@smipidev>
 <5716AD73.30309@mind.be>
Message-ID: <20160423113919.GA10355@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Apr 20, 2016 at 12:13:07AM +0200, Arnout Vandecappelle wrote:
> On 04/19/16 22:26, Pieter Smith wrote:
> >On Tue, Apr 05, 2016 at 01:37:46AM +0200, Arnout Vandecappelle wrote:
> >>On 03/20/16 23:35, Pieter Smith wrote:

[snip]

> >>>+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
> >>
> >>  Does the default (console) not work well?
> >
> >I inherited this from the beaglebone_defconfig. I know that the beaglebone uses
> >a different serial port for the console than the Phytec am33xx modules (the
> >default for the BSP), so I am quite sure this is necessary.
> 
>  The serial port is already set in the barebox config, and is already passed
> on the kernel command line, so there shouldn't be a need to set it
> explicitly again in the buildroot config. The default getty port is
> 'console', which means to use the kernel console as getty port. In most
> cases that's what you want.
> 
>  The beaglebone defconfig still had an explicit getty port because it is
> still from the time that the default getty port was tty1.
> 
>  So, ideally, please test that it still works without this line. But since
> you don't have a working beaglebone at the moment that will be tough...

Tested and it works. Will be gone in patch v5.

> [snip]
> >>>+# Use the barebox built-in dtb
> >>>+# BR2_LINUX_KERNEL_DTS_SUPPORT is not set
> >>
> >>  Good to put this here!
> >
> >As per your recommendation on v4 of the patch-set.
> 
>  I'm so great :-)

Smile once a while when you look down on us mere mortals ;-)

[snip]

- Pieter Smith
