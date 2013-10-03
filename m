From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 18:50:37 +0200
Subject: [Buildroot] Some legal-info observations/problems
In-Reply-To: <OF745746BB.02FF7D3A-ON86257BF9.004D84C8-86257BF9.004E01F3@rockwellcollins.com>
References: <CAAXf6LXHXo2vY8ns61fxoLzD0n2yzLASZqFk75xzYQwgDHp15Q@mail.gmail.com>	<OF28FCBE52.CC9DE764-ON86257BF8.00513AFD-86257BF8.006773C0@rockwellcollins.com>
 <CAAXf6LXj9m1Vo8W5SJGGBHCyiRj=gUP=574Xjcqvn1jhnZZwgg@mail.gmail.com>	<OFA9E6CB32.66C4A13C-ON86257BF9.0049F1F8-86257BF9.004A5509@rockwellcollins.com>
 <CANxTyt5STqs0sVnG0q1PVWm+5OLi=8QbrFLHfGHJr4po4vhKgw@mail.gmail.com>
 <OF745746BB.02FF7D3A-ON86257BF9.004D84C8-86257BF9.004E01F3@rockwellcollins.com>
Message-ID: <524DA05D.50704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/13 16:12, Ryan Barnett wrote:
> Danomi, All,
>
> Danomi Manchego <danomimanchego123@gmail.com> wrote on
> 10/03/2013 08:42:55 AM:
>
>> Ryan,
>>
>> On Thu, Oct 3, 2013 at 9:31 AM, Ryan Barnett
>> <rjbarnet@rockwellcollins.com> wrote:
>>>> While I don't need the URL for my process, I currently also don't
> need
>>>> the name of the tarball in manifest.csv (and I leave out this last
>>>> column anyway). So, I'm not opposed to adding this extra column, but
>>>> there may be some caveats: with the OVERRIDE_SRCDIR mechanism it is
>>>> possible for a project to completely change the sources of an
> existing
>>>> package in buildroot. Strictly speaking this could mean that there is
>>>> no relation whatsoever between the URL specified in the .mk file and
>>>> the actual sources used. This is probably very exotic, though, and
>>>> maybe it doesn't really matter for your process.
>>>
>>> You bring up an interesting point that I never thought of. However, in
>>> the application of OVERRIDE_SRCDIR, I would think that it mainly
> intended
>>> for company's application but I could be wrong.

  It was originally intended for temporarily testing a modified version 
of a package, which you commit by generating patches from it. But I 
expect that in companies it will indeed be mainly used for the application.


>> FWIW, several of our projects regularly use permanent OVERRIDE_SRCDIR
>> settings to compile exploded copies of uboot and xloader checked into
>> our source control system, rather than maintain patches against some
>> off-upstream vendor tarball; it's just easier than educating the folks
>> in remote offices about patching.

  Actually, BR2_TARGET_UBOOT_CUSTOM_GIT and 
BR2_TARGET_UBOOT_CUSTOM_TARBALL exist for exactly this purpose. Of 
course, there's no equivalent for xloader, but you should start using 
U-Boot SPL anyway :-)


> Thanks for the use case as I never though of that since I've just maintain
> a large u-boot/x-loader patch set.
>
> My thought for how this column would work is that if the OVERRIDE_SRCDIR
> is used that in the column, "OVERRIDE_SRCDIR Used" would be placed instead
> of the URL. This will also make sure that someone explicitly knows they
> are
> using the OVERRIDE_SRCDIR feature (not that isn't already obvious in
> local.mk)

  Sounds like a good idea to me.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
