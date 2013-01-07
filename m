From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jan 2013 18:45:11 +0100
Subject: [Buildroot] [PATCH 3/3] rpi-fw: New package
In-Reply-To: <CAGduivxAVfkwsmqjjk1JY7_gU70VmBrsUcVeEtzPtYUh70k1Ng@mail.gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0a82214a34f519691ff795260820907a7a8b4cfc.1357394983.git.maxime.hadjinlian@gmail.com>
 <50E8E406.60407@je-eigen-domein.nl> <87d2xigzgj.fsf@dell.be.48ers.dk>
 <CAGduivxAVfkwsmqjjk1JY7_gU70VmBrsUcVeEtzPtYUh70k1Ng@mail.gmail.com>
Message-ID: <50EB09A7.80705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/01/13 15:47, Maxime Hadjinlian wrote:
>> >    Floris>  But another question would be if bootloader files really should be
>> >    Floris>  installed under target.
>> >    Floris>  Keep in mind that the Raspberry Pi boot files are normally kept on a
>> >    Floris>  FAT partition seperate from the root file system.
>> >
>> >  Indeed, it probably makes more sense to just put it in IMAGES_DIR
>> >  instead.
> How about putting them all in a rpi-firmware folder inside IMAGES_DIR
> ? I don't want to just throw them in this folder, it would be a pain
> afterwards since they all go in the same place.

  I think typically everything in the images directory goes into the boot 
partition, except the rootfs.* (exception to the exception: rootfs.cpio*, 
unless it's an initramfs)

  I have thought about creating a boot/ subdirectory in the images 
directory that collects everything that is supposed to go to the boot 
partition. But I'm afraid that there is no generic way to decide what has 
to go to the boot partition. For instance, if you generate a U-Boot for 
Flash but boot from SD card, you would have only kernel and device tree 
in the boot partition. In addition, you often want to add some additional 
things to the boot partition.

  Therefore I think that what we have now is quite OK. You can easily 
wrap the build in a script that copies things to the right place.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
