From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 14 Mar 2008 15:33:08 +0200
Subject: [Buildroot] [PATCH] Add thumb support to buildroot for the ARM
 architecture
In-Reply-To: <20080314090331.11f1bddc@crazy>
References: <20080312090846.2cfecec8@crazy> <20080314090331.11f1bddc@crazy>
Message-ID: <47DA7E94.2070302@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Hi,
> 
> Any comments on that ? Are you interested in merging such a patch ?
> 
> Thanks,
> 
> Thomas
> 

Hi Thomas!

Thanks for your excellent work! Before committing your patch I have a question:
have you tested it? on which CPU? which buildroot configs?
I'm asking this because for almost half of year I did not managed to build a good ARM EABI toolchain with buildroot.
Toolchain seems emit invalid instructions when building busybox. So I managed only to run
 very simple hello-world when set in cmdline init=hello-world, but not a busybox binary with shell, etc.
Boot process just hangs when busybox running. Magic-SysRq key shows that illegal instruction trap was involved.
What is surprising that rootfs can be launched ok on qemu with versatilepb machine emulation, but as I told fails
to run on real hardware S3C2440 CPU - 920T target.

Regards,
Ivan
