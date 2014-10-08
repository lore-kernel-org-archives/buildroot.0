From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 08 Oct 2014 21:44:20 +0200
Subject: [Buildroot] syslinux on target
In-Reply-To: <20141008170923.GA4718@free.fr>
References: <543520E6.3000307@gmail.com> <20141008170923.GA4718@free.fr>
Message-ID: <54359414.3030807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 10/08/2014 07:09 PM, Yann E. MORIN wrote:
> Zoltan, All,
>
> On 2014-10-08 13:32 +0200, Zoltan Gyarmati spake thusly:
>> is there any supported way to install syslinux (the utility which installs
>> syslinux on a partition) on the target? If not (i couldn't find it), is
>> there any specific reason to not support this in Buildroot?
> Currently, we do not install 'syslinux' (the command) on the target.
> Neither do we install 'extlinux' or 'isolinux' (the commands).
>
> syslinux (the package) is very special. It does not cross-compile nicely
> in my experience. So, we build it as a native package, using the native
> host toolchain.
>
> Also, we fully install syslinux in the host/ directory, even though it
> contains blobs (e.g. the .c32 modules) for the target. That's the
> traditional way syslinux exxpects to fins it files.
>
> Finally, even if we were to install the 'syslinux' (or 'extlinux' or
> 'isolinux') programs in the target, we'd also need to install a few
> other files, such as:
>
>    - the mbr blobs: for BIOS- or GPT- or CD-based boots, 'alt' versions,
>      the '_c' and '_f' versions (wtf are those?),
>
>    - all of the .c32 modules (even though only a sbuset is really used to
>      actually boot the target,
>
>    - and a lot of other stuff.
>
> Also, the reason is that Buildroot mostly targets simple devices, and we
> did not so far see a valid reason for having the syslinux tools on the
> target.
>
> So, what is the use-case to have those tools on the target?
>
> Regards,
> Yann E. MORIN.
>

Dear Yann,

yes, by looking into it i also came to the conclusion that it probably 
doesn't worth the effort.
My use case is that i have to distribute my Buildroot built appliance to 
the targets on the field (target is an x86 box), and instead of getting 
out the disks from each of them and dump the needed content from a 
laptop, i decided to make a "live" Buildroot system running from usb 
stick which contains the rootfs.tar.gz, the kernel image, the config 
data and a script which creates the needed partitions and copies the 
content to the target disk. For this script it would have been handy to 
have syslinux (utility) available on the system, but of course there are 
several other ways to get the bootloader installed on the target disk, 
so i just chose an other one, just wondered when saw that it's not 
available.


Thanks, regards
zgyarmati
