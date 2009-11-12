From: Mark Constable <markc@renta.net>
Date: Fri, 13 Nov 2009 01:22:29 +1000
Subject: [Buildroot] Creating a filesystem for QEMU
In-Reply-To: <200911121703.07478.cristeab@gmail.com>
References: <200911121623.45929.cristeab@gmail.com>	<4d28d4b50911120658h67155758k54a7d95599cee1fe@mail.gmail.com>
	<200911121703.07478.cristeab@gmail.com>
Message-ID: <4AFC2835.9050000@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bogdan Cristea wrote:
>    Thank you for your feedback, I'll try to explore these options in the next 
> days. IMHO it could be extremely useful to have these indications into the 
> help page of buildroot.
>    Could you expand a little more the last option (Create an ext2 filesystem 
> and write it on a qemu disk through an install cdrom). I don't understand that 
> part.

It's also possible to loop mount a qemu image if you do not
use -f qcow...

> qemu-img create qemu.img 4G
> mount -o loop,offset=32256 qemu.img /mnt

then, for instance, if you created a tarball from Buildroot
then you should be able to extract the tarball to a temp
directory and rsync -av /temp/ /mnt

I haven't tried this but it might work.

--markc
