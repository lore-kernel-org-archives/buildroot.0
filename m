From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Jul 2017 14:17:20 +0200
Subject: [Buildroot] Syslinux: mbr build failure
In-Reply-To: <20170704093707.5984ba32@armant.office.greenbone.net>
References: <b2f7acb4-a732-92dc-445f-65834091bc9b@smile.fr>
 <20170704093707.5984ba32@armant.office.greenbone.net>
Message-ID: <80b99c25-1ca6-c4d5-2284-d3aedb611746@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit,

Le 04/07/2017 ? 09:37, Beno?t Allard a ?crit :
> On Mon, 3 Jul 2017 21:43:54 +0200
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> Hi Benoit,
>>
>> There is another issue with syslinux since the build with the target
>> toolchain is enabled.
>>
>> syslinux-6.03/bios/core/../lzo/prepcore ldlinux.raw ldlinux.bin
>> syslinux-6.03/bios/core/../lzo/prepcore: ldlinux.raw: write error
>>
>> You should be able to reproduce with this defconfig:
>>
>> BR2_x86_64=y
>> BR2_x86_steamroller=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TARGET_SYSLINUX=y
>> BR2_TARGET_SYSLINUX_MBR=y
>>
> 
> Indeed, I can reproduce it. I'll try to have a look, thanks for
> reporting !

After some discussion on IRC, Beno?t found a bug report about binutils 2.26
breaking the syslinux build:

https://sourceware.org/bugzilla/show_bug.cgi?id=19538
https://sourceware.org/bugzilla/show_bug.cgi?id=19615

Since it's already fixed in Buildroot with the bump to binutils 2.26.1, the only
toolchain affected by this issue is the prebuilt CodeSourcery AMD64.

See:
http://patchwork.ozlabs.org/patch/783918/
http://patchwork.ozlabs.org/patch/783916/

Best regards,
Romain

> 
> Ben.
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
