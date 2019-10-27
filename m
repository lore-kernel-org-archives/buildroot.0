From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 15:34:03 +0100
Subject: [Buildroot] [PATCH v2 6/7] support/scripts/qemu-boot-*: gitlab
 tests for Qemu
In-Reply-To: <c1aa9ebc-3717-d53b-bd0f-5f41c28730ff@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-7-git-send-email-jugurtha.belkalem@smile.fr>
 <20190803002437.768b3fab@windsurf.home>
 <c1aa9ebc-3717-d53b-bd0f-5f41c28730ff@smile.fr>
Message-ID: <20191027153403.18feefeb@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 15:32:00 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > For the x86_64 case, maybe we should simply rename board/qemu/x86_64 to
> > board/qemu/x86-64, so that it matches the other directories, where we
> > have the same name as the defconfig, with just the _ replaced by -.
> > This would entirely remove those special conditions.  
> 
> Instead of renaming this directory and using the name of the defconfig file to
> search for the right readme.txt containing the qemu command line to use.
> 
> We can instead add a comment in the defconfig
> 
> $ cat qemu_aarch64_virt_defconfig
> # Use the Qemu command line from board/qemu/arm-vexpress/readme.txt to start Qemu.
> 
> or if we use a script launch.sh to start qemu (as suggested in the previous
> patch review)
> 
> # Use the script from board/qemu/arm-vexpress/launch.sh to start Qemu.
> 
> Doing so, we don't have a naming rule between defconfig file and board/qemu
> directory.

Yes, why not. Could be useful to point people at the readme.txt or
launch.sh script.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
