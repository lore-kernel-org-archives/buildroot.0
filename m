From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:10:38 +0200
Subject: [Buildroot] [PATCH] board/pc: drop unused grub-efi.cfg file
In-Reply-To: <20190510073856.12136-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 10 May 2019 09:38:56 +0200")
References: <20190510073856.12136-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pno5mvht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Following commit fee29b05bb7db25e37c8a5175ce00dc712554edf
 > ("configs/pc_x86_64_efi: use a GPT partition table"),
 > board/pc/grub-efi.cfg is no longer used anywhere: the
 > post-image-efi-gpt.sh script generates the grub configuration.

 > Also, since post-image-efi-gpt.sh generates a grub configuration file
 > that uses the root filesystem partition UUID as the root= kernel
 > argument, the instructions in the readme.txt file to tweak root= from
 > /dev/sda2 to /dev/vda2 is no longer relevant. This was noted in the
 > commit log of fee29b05bb7db25e37c8a5175ce00dc712554edf:

 >     The root filesystem location is passed to the kernel by a partition
 >     UUID, so it is possible to boot on QEMU, directly from the disk image,
 >     or dump the image to a physical device.

 > Fixes: #11841
 > Cc: Pete Morici <pmorici@dev295.com>
 > Cc: Carlos A. M. dos Santos <unixmania@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
