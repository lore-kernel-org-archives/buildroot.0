From: Tudor Holton <tudor@tudorholton.com>
Date: Mon, 27 Jul 2020 16:09:32 +1000
Subject: [Buildroot] pc defconfig image does not boot
In-Reply-To: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
References: <CACef8rpYbbO6p7srvegq0XqwEcVk2LHAiTRsMmLjcpi8CHn8xA@mail.gmail.com>
Message-ID: <084125223ad4566f3570607499ee439e@tudorholton.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David, 

Did you get any errors in your build?  Frequently I find the most common
reason for this is that the contents of the packages doesn't fit into
the image size.  It defaults to 120M which is too small for some larger
packages. 

You can try increasing your image size in Filesystem Images -> Exact
Size. 

Otherwise, check your build logs and see if there's any complaints when
building the image, and always do a complete make clean before your make
in case it's cruft left over from the previous build. 

If you come across build issues after a make clean, drop them and your
config back to the mailing list and we can have a look. 

Cheers,
Tudor. 

On 2020-07-27 15:21, David Park wrote:

> Hi, 
> 
> I created a PC disk.img from the pc_x86_64_efi_defconfig config file following exactly the instructions outlined in board/pc/readme.txt. 
> 
> make pc_x86_64_efi_defconfig 
> 
> Running this disk.img in qemu boots fine with no issues, but when I write the image to a pendrive using the listed commands: 
> 
> dd if=output/images/disk.img of=/dev/sdc; sync 
> 
> And then insert it into my PC, it doesn't boot all the way. I only see the GRUB menu with the Buildroot image listed, but when GRUB tries to run this image, I only see "Booting Buildroot", and then nothing else. 
> 
> Am I missing some steps here that aren't in the readme? 
> 
> -- 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200727/688cde7c/attachment.html>
