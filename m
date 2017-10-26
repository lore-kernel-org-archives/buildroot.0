From: Seamus Connor <sconnor@lynx.com>
Date: Thu, 26 Oct 2017 09:32:19 -0700
Subject: [Buildroot] Multiple root filesystems for single
	kernel/toolchain
In-Reply-To: <87po9a2ovu.fsf@dell.be.48ers.dk>
References: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
 <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
 <87po9a2ovu.fsf@dell.be.48ers.dk>
Message-ID: <d00f1836-8acf-b6ac-3d65-3836b963edb2@lynx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately the bootloader is not an option for my system.? The 
bootloader we must use is targeted at a specific market segment, and the 
vendor only gave me two things: a binary, and an NDA.

Here is where I am ending up. I have created a script that builds a 
secondary rootfs.cpio that includes a statically compiled busybox and an 
init script.? I am currently working to integrate this new rootfs into 
the buildroot build system so that it will automatically build it into 
the kernel in the same way that the current mechanism works 
(linux-rebuild-with-initramfs).

Again, thanks to everyone on the list who took the time to look at my 
question.? If what I end up building doesn't turn out to be a complete 
hack, I will send another message.? Maybe there would be interest in 
having the ability to create a "filtered" rootfs.cpio in usptream buildroot?


On 10/26/2017 03:18 AM, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> Hi,
>
>   >  However, if all you need is a to toggle a few bits and to wait until the device
>   > is available, you might even get away with a simple C program that does that,
>   > mounts the rootfs, does a pivot_root(), and exec()s /sbin/init. Then you make a
>   > cpio archive with just that executable. Perhaps more work but you're very sure
>   > that it's small :-)
>
> Or alternatively do it in the boot loader if it is so simple.
>
