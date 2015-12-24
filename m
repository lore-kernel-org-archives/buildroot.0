From: Mathew Benson <mathew.benson@gmail.com>
Date: Wed, 23 Dec 2015 19:04:05 -0600
Subject: [Buildroot] Newbie boot and fs mount question
In-Reply-To: <20151222210930.7929c662@free-electrons.com>
References: <CA+C+_XSCm9Q1uE7Zg2VcK6xCa3ASEUNFTX=0GF3=KwaUYQWTzQ@mail.gmail.com>
 <20151222210930.7929c662@free-electrons.com>
Message-ID: <04294576-64CB-4232-80B7-362A7A7DC2FF@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have root=/dev/sda1 on my kernel command line.

Yes, I ran make qemu_x86_64_defconfig followed by make.  I'm eventually going to load this build on a small PC, but for now, temporarily, I'm using virtual box.  I added a shared drive to both my development VM and my simulated PC VM.  I setup the first partition as bootable with grub.  I also enabled the creation of a rootfs.tar file.  After I run make, I mount the shared drive, and untar the rootfs.tar over the mounted drive, and copy the bzImage over.  The file system is still read only.

I have a possible dumb question.  I enabled initrd to be linked into the kernel, thinking boot time might be faster.  I enabled the "remount filesystem" option, thinking that would remount it from the hard drive rather than the linked in rootfs.  Is that an incorrect assumption?

Sent from my iPad

> On Dec 22, 2015, at 2:09 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Dear Mathew Benson,
> 
>> On Tue, 22 Dec 2015 10:07:35 -0600, Mathew Benson wrote:
>> How do I mount / from sda1 rather than RAM disk?
> 
> Pass root=/dev/sda1 on your kernel command line.
> 
>> Sorry for the simple question and let me know if there is a better forum
>> for this.  I'm new to buildroot and busybox and haven't compiled a custom
>> kernel in at least 15 years.  I'm using the latest version of buildroot as
>> of this weekend, used the predefined i386 config, and built with kernel
>> version 3.8.17.  It seems to boot just fine but it appears the file system
>> is mounted from the initial RAM disk.  Any change I make to the file system
>> is volatile.  What do I need to do to make it mount / from sda1 instead of
>> the RAM disk?
> 
> We don't have anything like a "predefined i386 config".
> 
> However, you can see how to use a root filesystem from storage by
> looking/building our Qemu x86-64 configuration:
> 
>    make qemu_x86_64_defconfig
>    make
> 
> And then read board/qemu/x86_64/readme.txt for the details on how to
> start this configuration under Qemu. You can see in this readme file
> that we're booting the kernel with root=/dev/sda, since the first hard
> drive is emulated using the contents of output/images/rootfs.ext2.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
