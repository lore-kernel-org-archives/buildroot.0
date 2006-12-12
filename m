From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 14:00:45 +0100
Subject: [Buildroot] targetting buildroot at vmware
In-Reply-To: <010e01c71de9$943efd50$0f31b10a@atmel.com>
References: <Pine.LNX.4.64.0612112143590.26350@q7.q7.com>
	<20061212085344.GA5002@aon.at>
	<010e01c71de9$943efd50$0f31b10a@atmel.com>
Message-ID: <20061212130045.GB30226@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 12:56:14PM +0100, Ulf Samuelsson wrote:
>> On Mon, Dec 11, 2006 at 09:45:36PM -0800, Joe Pruett wrote:
>>>i haven't found any obvious hits on the web yet, but it seems like this 
>>>shouldn't be too hard.  i want to make a very small vmware image using 
>>>buildroot.  has anyone else done this and have suggestions?  i figure i'll 
>>>just start with defaults for 386 and see where i get...
>> 
>> There is no difference whether you build a rootfs for real hardware or
>> for any simulator, be it vmware, bochs, plex86, qemu, you-name-it). Just
>> build your rootfs, install a bootloader into an empty "disk" (you'd
>> normally use a file for this) and put your rootfs into a partition on
>> your "disk". Boot and enjoy.
>
>I think he wants to create a complete disk for VMware, 
>and I believe that is it not possible.

As long as you can cnofigure vmware to use file as disk or partition it
certainly is possible.
I regularly use qemu to boot a file that acts as disc-image, including
grub as a bootloader etc. If vmware doesn't support using a file as disk
or a spare partition, then bug vmware. It's a commercial program, AFAIK.

>Once a complete disk is available, the file system created in 
>VMware can be copied to the disk.

create a file, partition it, format the partitions. Install a bootloader
if you want (qemu can also boot a given kernel/initrd, so that's
optional) and untar the rootfs on it. Done, no magic involved :)

qemu is free software and may also work on windows or BSD-apple, so just
use that instead of vmware.

HTH,
