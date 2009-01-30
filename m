From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 30 Jan 2009 11:01:25 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <87eiymru7j.fsf@macbook.be.48ers.dk>
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk>
Message-ID: <1233309685.6293.17.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, 2009-01-29 at 16:46 +0100, Peter Korsgaard wrote:

>         default apcs-gnu        if BR2_ARM_OABI
>         default atpcs           if BR2_arm_dunno
>         default aapcs           if BR2_arm_dunno
>         default aapcs-linux     if BR2_ARM_EABI
> 
> [...]
> Could you give it a try with those 2 lines changed?

Does not work for my configuration. The error when compiling gcc is:

  Unknown ABI used in --with-abi=aapcs-linux

The relevant bits from my .config are:

BR2_iwmmxt=y
BR2_ARM_TYPE="ARM_IWMMXT"
# BR2_ARM_OABI is not set
BR2_ARM_EABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="iwmmxt"
BR2_GCC_TARGET_ARCH="iwmmxt"
BR2_GCC_TARGET_ABI="aapcs-linux"
BR2_GCC_VERSION="4.3.2"

Anything else you want me to try ?


Sven
