From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 12:17:51 +0100
Subject: [Buildroot] [PATCH 5/5 v2] configs: add a DT-enabled Raspberry
 Pi defconfig
In-Reply-To: <b65d009bf4aeb83b97e02a9fd03c14888b5f1ce2.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
 <b65d009bf4aeb83b97e02a9fd03c14888b5f1ce2.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <20150110121751.0bddd30b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  9 Jan 2015 23:46:23 +0100, Yann E. MORIN wrote:

>   - we can not use the minimalist RPi defconfig bundled with the kernel,
>     namely bcmrpi_quick_defconfig, because it is not DT-enabled, and
>     sets CONFIG_ARM_PATCH_PHYS_VIRT to 'n', which prompts a value for
>     CONFIG_PHYS_OFFSET, as it as no default for the bcm familly;
> 
>   - we have to use the 'default' but bloated bcmrpi_defconfig, which
>     makes for a very fat kernel with lots of modules, and takes ages to
>     build;
> 
>   - most importantly, the rpi-3.18.y branch is constantly rebased, so
>     there is no guarantee that the sha1 I use today will still be usable
>     in the long term. Using the name of hte branch is not better either.

Well, you could alternatively decide to have a custom kernel defconfig
in board/raspberrypi/, which would be the same as bcmrpi_quick, with
just the modifications you need for DT. Sure it means it will have to
be updated from time to time, but hopefully at some point in the future
the official bcmrpi_quick defconfig will have DT support enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
