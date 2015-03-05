From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 15:37:39 +0100
Subject: [Buildroot] [PATCH v2 1/1] board: add support for RIoTboard
In-Reply-To: <1425565907-26222-1-git-send-email-picmaster@mail.bg>
References: <1425565907-26222-1-git-send-email-picmaster@mail.bg>
Message-ID: <20150305153739.6ae1bbf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nikolay Dimitrov,

On Thu,  5 Mar 2015 16:31:47 +0200, Nikolay Dimitrov wrote:

> +Create 2 partitions on the SD-card using your favourite tool. Partition 1
> +should be around 32MiB, partition 2 should be big enough to hold your rootfs,
> +for example 128MiB. Here's how an example of such partition layout:
> +
> +   Device Boot      Start         End      Blocks   Id  System
> +/dev/sdX1            2048       67583       32768   83  Linux
> +/dev/sdX2           67584      329727      131072   83  Linux
> +
> +Format these SD-card partitions with your favourite filesystem:
> +
> +sudo mkfs.ext2 /dev/sdX1
> +sudo mkfs.ext2 /dev/sdX2
> +
> +Copy the kernel, device tree and extlinux configuration to SD-card partition 1:
> +
> +sudo mkdir /mnt/sdcard/
> +sudo mount /dev/sdX1 /mnt/sdcard/
> +sudo mkdir -p /mnt/sdcard/boot/extlinux/
> +sudo cp -v board/embest/riotboard/extlinux.conf /mnt/sdcard/boot/extlinux/
> +sudo cp -v uImage /mnt/sdcard/boot/
> +sudo cp -v imx6dl-riotboard.dtb /mnt/sdcard/boot/
> +sudo umount /dev/sdX1
> +
> +Then deploy your rootfs on SD-card partition 2:
> +
> +sudo mount /dev/sdX2 /mnt/sdcard/
> +sudo tar xf rootfs.tar -C /mnt/sdcard/
> +sudo umount /dev/sdX2

Is there a particular reason to have two ext2 partitions? Why not one
single partition with the rootfs, also
containing /boot/extlinux/extlinux.conf, /boot/uImage
and /boot/imx6dl-riotboard.dtb ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
