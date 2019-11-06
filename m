From: Andreas Ziegler <br015@umbiko.net>
Date: Wed, 06 Nov 2019 08:54:15 +0100
Subject: [Buildroot] ISO image creation: x86_64 architecture
In-Reply-To: <mailman.3367.1573024282.158800.buildroot@busybox.net>
References: <mailman.3367.1573024282.158800.buildroot@busybox.net>
Message-ID: <f3ce4019f973549558651457739b4177@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-11-06 08:11, buildroot-request at busybox.net wrote:
> ...
> I'm new to Buildroot and using x86_64 architecture and squashfs root
> filesystem, please help me with the process of creating an iso image 
> that I
> can run on VM.
> ...

Hi Anushka,

You might take a look at the readme.txt in buildroot/board/pc, it 
describes how to generate a bootable image and also how to run it on 
qemu.

Qemu will also boot the kernel file directly, without bootable image. 
This is what I use for testing builds (kernel image contains the root 
file system):

   # qemu-system-x86_64 -enable-kvm -m 256 \
	-device e1000,netdev=lan0 -netdev user,id=lan0 \
	-kernel /tmp/bzImage -append root=/dev/ram

Kind regards,
Andreas
