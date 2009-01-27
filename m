From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 27 Jan 2009 01:24:34 +0100
Subject: [Buildroot] Error encountered while doing make after
	adding	u-boot
In-Reply-To: <87wsci88t8.fsf@macbook.be.48ers.dk>
References: <8ebba8c20901260506t271f675avd114aefdf82be711@mail.gmail.com>
	<20090126144012.4e62179b@hcegtvedt>
	<87wsci88t8.fsf@macbook.be.48ers.dk>
Message-ID: <1233015874.2298.137.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-01-26 klockan 15:02 +0100 skrev Peter Korsgaard:
> >>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:
> 
>  Hans-Christian> On Mon, 26 Jan 2009 18:36:16 +0530
>  Hans-Christian> Mitesh Gupta <guptamitesh@gmail.com> wrote:
> 
>  Hans-Christian> <snipp>
> 
>  >> make[1]: Entering directory
>  >> `/mnt/rootfs/buildroot/project_build_i686/uclibc/u-boot-2008.10'
>  >> make[1]: *** No rule to make target `_config'.  Stop.
> 
>  Hans-Christian> You need to set the variable BR2_TARGET_UBOOT_BOARDNAME.
> 
> Why is it again we don't default to $(PROJECT) for this?
> 

Theyt way u-boot is build is that you enter U_BOOT_DIR and do:

?make <board>_config
make

<board> has to be selected from a list of valid board names.

$(PROJECT) is clearly wrong, because that will limit you
to one project per board.

BR
Ulf Samuelsson
> This BOARD_NAME variable seems to be an ARM/Atmel specific thing.
> 
> 
