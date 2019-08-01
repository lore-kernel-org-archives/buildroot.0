From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 20:54:35 +0200
Subject: [Buildroot] [PATCH] support/testing: use virtio-rng-pci to test
 syslog-ng
In-Reply-To: <87o918u47q.fsf@dell.be.48ers.dk>
References: <20190730231321.10673-1-ricardo.martincoski@gmail.com>
 <87o918u47q.fsf@dell.be.48ers.dk>
Message-ID: <20190801205435.226c1187@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 01 Aug 2019 20:32:09 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:  
> 
>  > Recent versions of syslog-ng need some entropy on startup.
>  > So use VirtIORNG to provide it. In order to accomplish this:
>  >  - build the kernel containing the driver;
>  >  - pass '-device virtio-rng-pci' to qemu.  
> 
>  > Use the same kernel version and kernel config as qemu_arm_versatile.
>  > It already has PCI enabled but it does not have HW_RANDOM_VIRTIO, so add
>  > a defconfig fragment to enable the drivers.  
> 
>  > Fixes:
>  > https://gitlab.com/buildroot.org/buildroot/-/jobs/259856394  
> 
>  > At the same time, fix a typo (missing '#') that resulted in the
>  > generation of root.tar. This file is not used in the test.  
> 
>  > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
>  > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  > ---
>  > https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/262628554  
> 
> Committed, thanks.

Longer term, probably we should rebuild newer versions of the pre-built
kernels, with the appropriate config options enabled. I guess other
use-cases will also need some entropy at boot time.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
