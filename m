From: Sven Neumann <s.neumann@phase-zero.de>
Date: Thu, 29 Jan 2009 17:11:03 +0100
Subject: [Buildroot] meaning of BR2_arm_dunno
In-Reply-To: <87eiymru7j.fsf@macbook.be.48ers.dk>
References: <1233243053.15375.33.camel@sven>
	<87eiymru7j.fsf@macbook.be.48ers.dk>
Message-ID: <1233245463.15375.41.camel@sven>
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

That looks more reasonable to me and it is in line with what was
suggested on the linux-arm-kernel mailing-list, see
http://lists.arm.linux.org.uk/lurker/message/20090124.152540.2d9a4947.en.html

As you can see from the linked thread, the compiler we ended up with
works nicely for userspace, but it cannot be used to build a kernel. It
may be a good idea to set BR2_GCC_TARGET_ABI to aapcs-linux even if
BR2_iwmmxt is selected.

> Could you give it a try with those 2 lines changed?

What exactly do you want me to try? I guess I would have to remove
my .config and go thru menuconfig, select ARM iwmmxt and then check what
gets sets for BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH and
BR2_GCC_TARGET_ABI? Is that correct?


Sven
