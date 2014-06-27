From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jun 2014 20:30:29 +0200
Subject: [Buildroot] How to control kernel header version?
In-Reply-To: <CAHvj1qaaXv6dGD6do7oED=uNKMpwZMFwOOdyjhGHC0J8KxykiA@mail.gmail.com>
References: <CAHvj1qaaXv6dGD6do7oED=uNKMpwZMFwOOdyjhGHC0J8KxykiA@mail.gmail.com>
Message-ID: <20140627203029.338fcaf7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jun 2014 11:37:30 +0100, bruce bushby wrote:

> # Kernel headers
> #BR2_LINUX_KERNEL_SAME_AS_HEADERS=y
> 
> # Kernel
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_VERSION="master"
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/torvalds/linux.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3493860c76eb4e5b222f1016d1458615afac9fc4"
> BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x40008000"
> BR2_LINUX_KERNEL_APPENDED_UIMAGE=n
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_APPENDED_DTB=n
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun7i-a20-pcduino3.dts"
> 
> 
> I think the current master is 3.16.0-rc3 .... but I keep seeing buildroot
> downloading linux-headers-3.15.1 (current stable)
> 
> Is there a way to force using the headers from the the same source as
> "KERNEL_CUSTOM_REPO" ?

No, not at this time. But using the 3.15 kernel headers is perfectly
fine if you actually run a 3.15, 3.16 or any other later kernel
version. So generally, people use a moderately recent, but not
necessarily latest kernel version of the kernel headers, as there's no
need for the kernel headers to match the kernel version. They only need
to be at least older or of the same version.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
