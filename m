From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 21:11:40 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <74d82d94462f019fa59a880bfdff422110956f5c.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <74d82d94462f019fa59a880bfdff422110956f5c.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <20131128211140.6003b460@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 22 Nov 2013 23:50:55 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The firmware files must reside in a FAT filesystem, in the first partition
> of the SDcard, so it makes sense to install them in target/ (eg. for a
> post-image script to generate the different partitions from the rootfs.tar).

I don't understand the reasoning here. These files must be at the root
of a specific FAT filesystem, so I fail to see why installing them
inside the root filesystem is of any help to achieve that.

Yes, I've seen that it's probably related to the proposed logic to
generate a bundled image in PATCH 5/5, but for the moment, my feeling
is that if that logic requires *all* files to be present in the root
filesystem to be later installed in a separate FAT/boot filesystem,
then the logic isn't really appropriate, and should be improved, no?

I believe that the existing choice of installing things in
$(BINARIES_DIR)/rpi-firmware/ was a much better choice. That's a choice
I've kept in the series on Grub/Grub2/Gummiboot, by creating a
$(BINARIES_DIR)/efi/ directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
