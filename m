From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 17 May 2017 19:36:40 +0200
Subject: [Buildroot] RPi B+ update
In-Reply-To: <24ea86ee-9b48-816f-3e7a-6d5a985ea339@gmail.com>
References: <38b2ad6e-f9bd-c0f7-e5be-c0531fd22f2a@gmail.com>
 <20170516232354.2080bf15@gmx.net>
 <224ff827-03b8-16d6-34fd-8be05cea607d@gmail.com>
 <24ea86ee-9b48-816f-3e7a-6d5a985ea339@gmail.com>
Message-ID: <2C134724-B0DB-4EAB-907E-3C97364972DC@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

what happens if you keep your old kernel and dtb and just update the firmware (start.elf, fixup.dat and the other file)?

I think new firmware can handle dt and non-dt kernel. You might need to add the trailer magic to the old kernel with mkknlimg.

best regards
 Waldemar 

> Am 17.05.2017 um 17:28 schrieb Marco Trapanese <marcotrapanese@gmail.com>:
> 
> Il 17/05/2017 08:05, Marco Trapanese ha scritto:
>> I'm trying to do what you suggested. By the way the br version was 2014.11-git-00057-g86b4d75-dirty.
>> Updating firmware and device tree should not be a pain.
>> 
>> I'm afraid about the kernel because I had to use a custom repository version (353043394c99ed37a4075da228af64468fdf6c06) and I changed some settings to fit my application.
> 
> 
> Well, some good news. 
> Using the latest versions of buildroot (2017.05-rc1-00062-g4b4fc27) and kernel (4.9.21) I built an "empty" environment (without any additional package but the rpi-firmware). Copying both zImage and the fw files into the boot partition of the existing sd-card, leads to boot-up again!
> 
> The problem now is related to the kernel drivers (wifi, rtc, cdc, etc...) that I manually selected using make linux-menuconfig and that were available (in the old rootfs) under /lib/modules/3.12.26. I'm afraid the new kernel doesn't know where to find them - and perhaps it cannot use them anyway because they are related to a different version.
> 
> It seems I need to update the whole system...
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
