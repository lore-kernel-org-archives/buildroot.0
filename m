From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun, 7 Feb 2021 18:36:57 +0300
Subject: [Buildroot] [RFC PATCH] stm32mp1: modify gpt partitions to fix
 BSP update
In-Reply-To: <871rdt53z8.fsf@dell.be.48ers.dk>
References: <20210130204456.793098-1-geomatsi@gmail.com>
 <87eeht5bnx.fsf@dell.be.48ers.dk> <YB75BHzVtUdwxWLv@curiosity>
 <871rdt53z8.fsf@dell.be.48ers.dk>
Message-ID: <YCAJGUQq4czlFHqX@curiosity>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  >> If upstream wants to use a separate partition for the environment, then
>  >> that is fine by me - But I would prefer to not patch u-boot and just
>  >> name the environment partition ssbl.
> 
>  > Sure, I would also prerfer not to patch u-boot. However on stm32mp1
>  > platform, ATF attempts to load BL33 bootloader from 'ssbl' partition.
>  > So using this name for environment partition does not work.
> 
> So is upstream U-Boot broken? Why doesn't it get fixed? Sorry, I don't
> follow?

Unless I am missing something, it looks like 'trusted' u-boot defconfig
has an issue. Let me re-iterate a brief summary. Previously stm32mp1
u-boot by default stored its environment as a file on ext4 filesystem.
Recently default option has been changed. Now stm32mp1 u-boot keeps its
environment at the end of its own SSBL partition. This is ok for 'basic'
boot chain. However this is not the case for the 'trusted' boot chain
since ATF verifies SSBL partition checksum.

P.S. I have not yet tried to communicate with u-boot upstream.

Regards,
Sergey
