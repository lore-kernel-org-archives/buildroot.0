From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:51:02 +0100
Subject: [Buildroot] [PATCH 2/7] linux: add option to rely on a
 bootloader-provided DTB
In-Reply-To: <20150101214435.GJ4360@free.fr>
References: <cover.1420142707.git.yann.morin.1998@free.fr>
 <e330f5c885f762feb6f4d7487fe3f6aa29c7fca3.1420142707.git.yann.morin.1998@free.fr>
 <20150101222449.18453adb@free-electrons.com>
 <20150101214435.GJ4360@free.fr>
Message-ID: <20150101225102.64944ac5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 1 Jan 2015 22:44:35 +0100, Yann E. MORIN wrote:

> Fact is, the prompt reads:
> 
>     [*] Device tree support
> 
> So, I take that as "build a kernel with support for the device tree",
> not as "build a DTB".

Right, the prompt may not be the most appropriate one.

> But Now I think of it, this patch is doing two things:
> 
>   - enable USE_OF when that option is enabled,
> 
>   - add support for bootloader- or board-provided DTB.
> 
> Maybe that should be split up in two, then?
> 
> Or do you still want that option to mean "build a DTB" ?

Yes, I believe the prompt should be changed. I really don't see the
point of adding a new entry in the choice to simply mean "do nothing".

And also, enabling CONFIG_OF should be done by the defconfig of the
platform, not by Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
