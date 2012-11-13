From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 13 Nov 2012 20:07:29 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <50A1EE50.4010008@mind.be>
References: <5099186E.1030409@macrium.com> <509958D9.7050108@petroprogram.com>
 <5099A14C.5000204@mind.be> <509AA0C4.4060506@petroprogram.com>
 <CACpMmu9g8xXNsyQp6DheEqP9z_Q=7DwkorWc120-gW5wQj9+YA@mail.gmail.com>
 <509BA71B.6020009@petroprogram.com> <509BD78A.8050908@macrium.com>
 <509BDDDD.3040002@petroprogram.com> <50A1EE50.4010008@mind.be>
Message-ID: <50A28C61.1060006@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

13.11.2012 8:53, Arnout Vandecappelle kirjoitti:
> On 08/11/12 17:29, Stefan Fr?berg wrote:
>> If you ever want to use the maximum compression method supported by
>> modern kernels (XZ compression)
>> then change that initramfs generation command to this:
>>
>> find .  -not \( -path "./boot" -prune \) -print0 | cpio --null -ov
>> --format=newc
>>   | xz --check=crc32>  /livecd/initramfs.xz
>>
>> Without that --check=crc32 parameter you won't be able to boot
>> XZ-compressed initramfs.
>
>  It would be good to have this in buildroot.  Care to add a config option
> BR2_TARGET_ROOTFS_CPIO_XZ?  Using host-xz, of course, since not all
> systems
> have xz installed.
>

Sure, no problem.

So far I have only done initramfs my own manual way but I will take this
weekend a look how buildroot does its
own initramfs.

Regards
Stefan

>
>  Regards,
>  Arnout
