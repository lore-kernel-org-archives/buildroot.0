From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 28 Apr 2014 15:58:30 -0400
Subject: [Buildroot] [PATCH 9/9] boot/syslinux: add an option to install
 an MBR blob
In-Reply-To: <20140428195241.GG3501@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
 <ccf1ac950371fe7411ff812bb17958a8824be30d.1398378217.git.yann.morin.1998@free.fr>
 <535E8070.9090405@mind.be> <20140428195241.GG3501@free.fr>
Message-ID: <CA+-urNQjYMOO1bFMQ4uJjqmMXqBUVvgXxZcFT-a6D4PbrtZafg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann and all,

On Mon, Apr 28, 2014 at 3:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Arnout, All,
>
> On 2014-04-28 18:23 +0200, Arnout Vandecappelle spake thusly:
>               ^^^^^
>
> I don't know why, but I only received it now (delivered to my server
> at 21:03:30 +0200) ? ... :-/
>
>> On 25/04/14 00:30, Yann E. MORIN wrote:
>> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> >
>> > This MBR blob will look for an active partition, and boot the bootcode
>> > present in that partition. This can be used to boot an extlinux-prepared
>> > partition.
>> >
>> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>> > Cc: Thomas Lundquist <lists@zelow.no>
>> > Cc: Frank Hunleth <fhunleth@troodon-software.com>
>> > ---
>> >  boot/syslinux/Config.in   | 13 ++++++++++++-
>> >  boot/syslinux/syslinux.mk |  1 +
>> >  2 files changed, 13 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
>> > index d556c55..7d4dd08 100644
>> > --- a/boot/syslinux/Config.in
>> > +++ b/boot/syslinux/Config.in
>> > @@ -15,7 +15,7 @@ choice
>> >
>> >  config BR2_TARGET_SYSLINUX_LEGACY_BIOS
>> >     bool "bios (legacy)"
>> > -   select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_PXELINUX
>> > +   select BR2_TARGET_SYSLINUX_ISOLINUX if !BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
>>
>>  Hm, I don't really like this very much. Adding complexity like this for
>> behaviour which is not even really perfect...
>
> Since you replied to my other reply (he!), I think switching all of this
> to a all-choice makes this comment moot, right? :-)
>
>> > +config BR2_TARGET_SYSLINUX_MBR
>> > +   bool "mbr"
>> > +   select BR2_TARGET_SYSLINUX_HAS_BIOS_IMG
>> > +   help
>> > +     Install the legacy BIOS 'mbr' image, to boot off a
>>
>>  See my comment in 4/9 about "legacy".
>
> Ditto, already covered.
>
>>  BTW, while you're at it, perhaps you can add options for syslinux (=fat)
>> and extlinux?
>
> For extlinux, please see my previous answer.
>
> I'll have a look at syslinux, but I believe it is the same as extlinux.

I'm actually using syslinux. E.g. in a post build script, I run
"output/host/usr/bin/syslinux -i myfatbootpartition.vfat" and then use
the MBR in "output/host/user/share/syslinux/mbr.bin".

Yann - your patch series appears to work fine for me! I'm using the
same syslinux.cfg file that I was using with 4.0.7, so it has been a
pretty easy upgrade. Thanks!

Frank
