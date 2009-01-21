From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 22:52:52 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <87d4egpe9f.fsf@macbook.be.48ers.dk>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<87vds9t51h.fsf@macbook.be.48ers.dk>
	<1232538049.11888.16.camel@elrond.atmel.com>
	<87wscosv1f.fsf@macbook.be.48ers.dk>
	<1232560373.11888.36.camel@elrond.atmel.com>
	<87d4egpe9f.fsf@macbook.be.48ers.dk>
Message-ID: <1232574772.11888.88.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 21:58 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> Here is the same with the 4.3.2/bu-2.19/uclib-0.9.30
> 
>  Ulf> mk	libconfuse                     FAIL	""
> 
> Builds here after r24944.
> 
>  Ulf> mk	ntp                            FAIL	""
> 
> Builds here.
> 
>  Ulf> mk	openssh                        FAIL	""
> 
> Builds here.
> 
>  Ulf> mk	openssl                        OK	
> 
> Failed before, but builds after r24943.
> 
>  Ulf> mk	libcurl                        FAIL	""
> 
> Builds here.
> 
>  Ulf> mk	libtheora                      FAIL	""
> 
> Dies with an ICE:
> 
> dec/fragment.c: In function 'oc_frag_recon_inter2_c':
> dec/fragment.c:83: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> 
>  Ulf> mk	mpg123                         FAIL	""
> 
> Dies with an ICE:
> 
> layer2.c: In function 'II_step_two':
> layer2.c:251: internal compiler error: Segmentation fault
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> 
>  Ulf> mk	directfb                       FAIL	""
> 
> Builds here.

If you have multi enabled, then there is a dependency on linux-fusion,
which in it's turn depends on the linux kernel.
Since the linux kernel is using uImage, there is a dependency on u-boot.
In the configuration, u-boot-2008.10 is used but this is broken
for at91 boards in buildroot, since they use

make at91sam9260ek_dataflash_config or similar, 
which is a recent change.

u-boot-2008.10 requires

?make at91sam9260ek_config

The fix is to enable 2009.01-rc3.
2009.01 will be available later this week.

Either we upgrade or make -rc3 the default for AT91 boards
in the release.

BR
Ulf Samuelsson

> 
>  Ulf> mk	u-boot                         FAIL	""
> 

There  has been some changes for AT91 circuits
and the setup only works for 1.2.0-atmel or 
2009.01-rc3, not the default 2008.10.

If u-boot does not build, then linux does not build,
and then if you have "multi" enabled


> Builds here.
> 
