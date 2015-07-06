From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jul 2015 16:36:06 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <559A89D7.5010400@lucaceresoli.net>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150706151750.456bbb6c@free-electrons.com>
 <559A89D7.5010400@lucaceresoli.net>
Message-ID: <20150706163606.796f37e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 06 Jul 2015 15:59:51 +0200, Luca Ceresoli wrote:

> Unless I'm wrong, this feature is only available since 3.7
> (abb139e75c2: "firmware: teach the kernel to load firmware files
> directly from the filesystem").

Right, it's been there for a "while" :-)

> So I should drop the dependency on
> !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS and clearly point out in
> the help text that you must set up some firmware loading mechanism, and
> let users discover on their own how they should achieve that.

Correct. In the linux-firmware package for example, we don't have
anything that enforces having a firmware loading mechanism available.

> Overall, the available choices for firmware loading are:
>   - the kernel-only mechanism (3.7+ only)
>   - /dev management by mdev ot udev
>   - static /dev management + BR2_ROOTFS_MDEV_FIRMWARE_LOADING (patch 1
>     of this series).
> 
> Should we add a section to the manual about this? We have a few words 
> under "/dev management", but they do not encompass the kernel-only
> loading.

Yes, that might be great.

> BTW, my use case here is a 2.6.30 kernel, which has no devtmpfs and no
> kernel-only firmware loading. So I must use static /dev management, and
> still install mdev as a hotplug helper for firmware loading.

Poor soul :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
