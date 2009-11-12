From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 12 Nov 2009 16:14:16 +0100
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <200911121703.07478.cristeab@gmail.com>
References: <200911121623.45929.cristeab@gmail.com>
	<4d28d4b50911120658h67155758k54a7d95599cee1fe@mail.gmail.com>
	<200911121703.07478.cristeab@gmail.com>
Message-ID: <4d28d4b50911120714g3366b8e0q915ef7604e9231cc@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Once your have created an ext2 filesystem you can boot a debian cdrom image
(for example), edit partitions from the debian rescue console and write the
ext2 filesystem using dd.
Then mount the filesystem and run some grub-install to get the bootloader
installed.
Or just boot with a vmlinux using the -kernel qemu option (if I remember
correctly).

Regards,

On Thu, Nov 12, 2009 at 4:03 PM, Bogdan Cristea <cristeab@gmail.com> wrote:

> On Thursday 12 November 2009 16:58:15 you wrote:
> >   - You can generate a cloop root filesystem using buildroot, and then
> >    convert it to the format you want using qemu-img
> >    - Create an initramfs, and boot it using qemu
> >    - Create an ext2 filesystem and write it on a qemu disk through an
> >    install cdrom
> >    - and so on....
> >
>    Thank you for your feedback, I'll try to explore these options in the
> next
> days. IMHO it could be extremely useful to have these indications into the
> help page of buildroot.
>   Could you expand a little more the last option (Create an ext2 filesystem
> and write it on a qemu disk through an install cdrom). I don't understand
> that
> part.
>
> thanks
> Bogdan
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091112/0123f1c1/attachment.htm>
