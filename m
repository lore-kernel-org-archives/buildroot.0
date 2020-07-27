From: Tudor Holton <tudor@tudorholton.com>
Date: Tue, 28 Jul 2020 09:51:07 +1000
Subject: [Buildroot] pc defconfig image does not boot
In-Reply-To: <CACef8roF4nq5eu+-jFpxPN01By+sNLtEOmMKNrnVP0nVJ7K_mA@mail.gmail.com>
References: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
 <871rkxwemd.fsf@dell.be.48ers.dk>
 <CACef8roF4nq5eu+-jFpxPN01By+sNLtEOmMKNrnVP0nVJ7K_mA@mail.gmail.com>
Message-ID: <799a49f3da41af68ad0bcc4cc67b7c73@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, my apologies.  I missed a detail.  Peter is right, we need to know
what your target machine is like. 

e.g. My x86_64 boards all have a requirement to authorise the boot EFI. 
You have to go into the BIOS and enable the buildroot option in the boot
list or it will ignore it. 

If you have other things like Secure Boot on then that won't work
either. 

Cheers,
Tudor. 

On 2020-07-28 06:10, David Park wrote:

> I do not see any build errors whatsoever. I tried increasing the image size to 1024m but still the same issue. 
> 
> My machine is a Core i7-4770 with 8GB of RAM. I also tried another machine even more capable but seeing the same result. 
> 
> -- 
> 
> On Mon, Jul 27, 2020 at 1:23 AM Peter Korsgaard <peter@korsgaard.com> wrote: 
> 
>>>>>>> "David" == David Park <djpark121@gmail.com> writes:
>> 
>>> Hi,
>>> I created a PC disk.img from the pc_x86_64_efi_defconfig config file
>>> following exactly the instructions outlined in board/pc/readme.txt.
>> 
>>> make pc_x86_64_efi_defconfig
>> 
>>> Running this disk.img in qemu boots fine with no issues, but when I write
>>> the image to a pendrive using the listed commands:
>> 
>>> dd if=output/images/disk.img of=/dev/sdc; sync
>> 
>>> And then insert it into my PC, it doesn't boot all the way. I only see the
>>> GRUB menu with the Buildroot image listed, but when GRUB tries to run this
>>> image, I only see "Booting Buildroot", and then nothing else.
>> 
>> If it boots with qemu, then the image is probably fine.
>> 
>> What are the specs of the PC that you are trying to boot it on?
>> 
>> -- 
>> Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200728/2f86256e/attachment.html>
