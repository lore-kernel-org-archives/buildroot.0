From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 17:52:23 +0100
Subject: [Buildroot] [PATCH v2 5/7] board/qemu/*/launch.sh: add qemu
 launch script
In-Reply-To: <584f74c1-c7a1-a529-a6f1-f57f4d153865@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-6-git-send-email-jugurtha.belkalem@smile.fr>
 <20190802235829.17b89102@windsurf.home>
 <584f74c1-c7a1-a529-a6f1-f57f4d153865@smile.fr>
Message-ID: <20191027175223.573ace6c@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 17:44:54 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> > So just:
> > 
> > #!/bin/bash
> > qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel ${0:-output}/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=${0:-output}/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0  
> 
> Each time I test a Qemu defconfig I always build in a specific build directory.
> So each time I have to go through this command line to replace output by
> something else.
> 
> So using a script that support an optional argument to pass to the output
> directory would be handy.

I think that's what I wanted to do with ${0:-output}, as it says "use
${0} if not empty, otherwise use output". But of course $0 is the
script name itself, not the first argument. So ${1:-output} should do
the trick.

> Agree, so if we go to the launch.sh way, what we should keep in the readme.txt?
> The only remaining information is the Qemu recommended version and a comment on
> how to use the launch.sh script.
> 
> Does it worth it to keep the readme.txt beside launch.sh?

Maybe not.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
