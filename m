From: Hedwin Koning <hedwin.koning@gmail.com>
Date: Tue, 17 Nov 2009 01:18:41 +0100
Subject: [Buildroot] Creating a filesystem for Real Time Linux using QEMU
In-Reply-To: <200911161134.15726.cristeab@gmail.com>
References: <200911160805.13709.cristeab@gmail.com>
	<4B011295.8080801@gmail.com>
	<200911161134.15726.cristeab@gmail.com>
Message-ID: <4B01EBE1.2050302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bogdan Cristea wrote:
> On Monday 16 November 2009 10:51:33 you wrote:
>   
>> Add "rw" to your append command.
>>
>> So change it to -append "root=/dev/sda rw"
>>
>>     
>
> Thanks for the tip, it allows me to write to the virtual hard disk, but still 
> the changes are not permanent.
>
>   
Hi,

Hmm weird.

This is what I use to start qemu for 386:

    qemu -kernel bzImage.1 -hda hd.img -append "root=/dev/sda rw 
init=./init"


And this is what I use for mips emulation:

    ../repos/mipsel-softmmu/qemu-system-mipsel -M malta --kernel 
./vmlinux -hda hda256m-img -append "root=/dev/hda rw" -m 128 -nographic

In both cases any changes I make in the file system during emulation is 
persistent.

Did you also check the file permission of the virtual disk drive you are 
using? But if rw the you should have seen that the kernel is complaining
when trying to write anything to the disk.

Hedwin Koning.
