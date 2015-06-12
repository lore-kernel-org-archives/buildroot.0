From: Patricia Holden <patholdn@gmail.com>
Date: Fri, 12 Jun 2015 17:49:57 -0400
Subject: [Buildroot] Building bootable usb drive for target board with
	ext2
In-Reply-To: <CANKYLMF9crxgDKVuHBZHHkhh=iw=O_o=Sq0cafM_HusVWAPd2w@mail.gmail.com>
References: <CANKYLME21pAifC-tb+HC=tRhy5k9ka0W-gywZCPrOdpq1aOTMA@mail.gmail.com>
 <20150612211031.3a684e7d@free-electrons.com>
 <CANKYLMF9crxgDKVuHBZHHkhh=iw=O_o=Sq0cafM_HusVWAPd2w@mail.gmail.com>
Message-ID: <CANKYLME+Dh85AHMX5yQdwuBU_WbsbMLurUf8d6Hn3pf=Ybpw8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, so I'm still not quite out of the woods.  I copied over the boot
directory from output to my usb drive, copied bzImage to usb drive.  It
hangs on target.  Do I need to edit grub files for the usb?  Do I need to
install grub instead of copying?  Sorry for such mundane questions, but I'm
just getting back into the linux world and my mind is a bit foggy.

On Fri, Jun 12, 2015 at 4:04 PM, Patricia Holden <patholdn@gmail.com> wrote:

> Thanks, I totally forgot I had the BR2_TARGET_ROOTFS_INITRAMFS option in
> use.  Guess I'm chasing my tail here.  I just need a very minimal system
> that I made a couple linux changes for custom development board, nothing
> fancy.  I have no CD to boot from but I do have a 16GB usb drive so I
> thought it would be easier for debugging the prototype if the USB is used
> to run OS.
>
> On Fri, Jun 12, 2015 at 3:10 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Dear Patricia Holden,
>>
>> On Fri, 12 Jun 2015 14:20:59 -0400, Patricia Holden wrote:
>>
>> > I'm following examples of how to create a bootable usb for a target
>> board
>> > i'm doing some work for.  I am stuck at setting up grub for booting.  I
>> > can't seem to get buildroot to put the bzImage into /boot directory for
>> > grub to load.  My target ends up hanging.
>>
>> If all you need is to have bzImage installed in /boot, then make sure
>> to enable BR2_LINUX_KERNEL_INSTALL_TARGET.
>>
>> However, you have BR2_TARGET_ROOTFS_INITRAMFS=y, which means your
>> rootfs is inside your kernel image. So it is not possible for your
>> kernel image to be inside your rootfs!
>>
>> So if you want to use a rootfs inside the kernel image (using
>> initramfs), then all you have to do it to build yourself a small
>> filesystem with just the necessary Grub bits in /boot and the
>> bzImage.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150612/3f2a203c/attachment.html>
