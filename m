From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Thu, 05 Mar 2015 16:58:47 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for RIoTboard
In-Reply-To: <20150305153739.6ae1bbf0@free-electrons.com>
References: <1425565907-26222-1-git-send-email-picmaster@mail.bg>
 <20150305153739.6ae1bbf0@free-electrons.com>
Message-ID: <54F86F27.7070806@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 03/05/2015 04:37 PM, Thomas Petazzoni wrote:
> Dear Nikolay Dimitrov,
>
> On Thu,  5 Mar 2015 16:31:47 +0200, Nikolay Dimitrov wrote:
>
>> +Create 2 partitions on the SD-card using your favourite tool. Partition 1
>> +should be around 32MiB, partition 2 should be big enough to hold your rootfs,
>> +for example 128MiB. Here's how an example of such partition layout:
>> +
>> +   Device Boot      Start         End      Blocks   Id  System
>> +/dev/sdX1            2048       67583       32768   83  Linux
>> +/dev/sdX2           67584      329727      131072   83  Linux
>> +
>> +Format these SD-card partitions with your favourite filesystem:
>> +
>> +sudo mkfs.ext2 /dev/sdX1
>> +sudo mkfs.ext2 /dev/sdX2
>> +
>> +Copy the kernel, device tree and extlinux configuration to SD-card partition 1:
>> +
>> +sudo mkdir /mnt/sdcard/
>> +sudo mount /dev/sdX1 /mnt/sdcard/
>> +sudo mkdir -p /mnt/sdcard/boot/extlinux/
>> +sudo cp -v board/embest/riotboard/extlinux.conf /mnt/sdcard/boot/extlinux/
>> +sudo cp -v uImage /mnt/sdcard/boot/
>> +sudo cp -v imx6dl-riotboard.dtb /mnt/sdcard/boot/
>> +sudo umount /dev/sdX1
>> +
>> +Then deploy your rootfs on SD-card partition 2:
>> +
>> +sudo mount /dev/sdX2 /mnt/sdcard/
>> +sudo tar xf rootfs.tar -C /mnt/sdcard/
>> +sudo umount /dev/sdX2
>
> Is there a particular reason to have two ext2 partitions? Why not one
> single partition with the rootfs, also
> containing /boot/extlinux/extlinux.conf, /boot/uImage
> and /boot/imx6dl-riotboard.dtb ?

Not really. Now as you're asking, I found that I'm doing this by habit
(probably inherited by some weird ARM board boot-requirements in the
past).

Would you prefer me to re-send the patch with instructions only for
single partition layout?

Kind regards,
Nikolay
