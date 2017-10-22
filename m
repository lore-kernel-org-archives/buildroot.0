From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 17:26:41 +0200
Subject: [Buildroot] [PATCH v2 2/3] board/pc: add documentation for
	testing with qemu
In-Reply-To: <20171022135426.28901-2-nunes.erico@gmail.com> (Erico Nunes's
 message of "Sun, 22 Oct 2017 15:54:25 +0200")
References: <20171022135426.28901-1-nunes.erico@gmail.com>
 <20171022135426.28901-2-nunes.erico@gmail.com>
Message-ID: <87sheb9pam.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Erico" == Erico Nunes <nunes.erico@gmail.com> writes:

 > Add some documentation about running the pc defconfigs in qemu.
 > In particular, document the use of the -bios parameter to use the OVMF
 > firmware to test the UEFI image.

 > Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

...

 > +Emulation in qemu (UEFI)
 > +========================
 > +
 > +1. Edit grub-efi.cfg
 > +
 > +  Since the driver will show up in the virtual machine as /dev/vda,
 > +  change board/pc/grub-efi.cfg to use root=/dev/vda2 instead of
 > +  root=/dev/sda2. Then rebuild grub2 and the image.
 > +
 > +2. Run the emulation with:
 > +
 > +qemu-system-x86_64 \
 > +	-M pc \
 > +	-bios </path/to/OVMF_CODE.fd> \
 > +	-drive file=output/images/disk.img,if=virtio,format=raw \

Maybe it would be better to not use virtio for the disk image so we can
keep root=/dev/sda? Unless the UEFI firmware doesn't support normal sata
controllers?

-- 
Bye, Peter Korsgaard
