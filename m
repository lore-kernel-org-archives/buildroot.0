From: Johannes Schmitz <johannes.schmitz1@gmail.com>
Date: Thu, 4 Jan 2018 00:32:19 +0100
Subject: [Buildroot] ffmpeg issue with MIPS
In-Reply-To: <CAMbDF3K-ei+hx8+f4-hSVLF+rZ52q2aZgPaSb9uw9DM+_ciMaA@mail.gmail.com>
References: <CAMbDF3KbAxppKmMVLWduL6B1RSLPriuErWcVTOt2wx-=+TE7GQ@mail.gmail.com>
 <20180103225057.79846679@windsurf.lan>
 <CAMbDF3+pfHWMz1iYOxY-rnBJkBRhxw534dGacPbKMLF_+OQTHg@mail.gmail.com>
 <20180103230507.11741c21@windsurf.lan>
 <CAMbDF3K-ei+hx8+f4-hSVLF+rZ52q2aZgPaSb9uw9DM+_ciMaA@mail.gmail.com>
Message-ID: <CAMbDF3KR98iSpobm1S39FGHLAGPLkdY-0a688CPWp58QTY0t-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guys, please also see the related GCC option

-mabi=

https://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html

"GCC supports a variant of the o32 ABI in which floating-point registers
are 64 rather than 32 bits wide. You can select this combination with
-mabi=32 -mfp64. This ABI relies on the mthc1 and mfhc1 instructions and is
therefore only supported for MIPS32R2, MIPS32R3 and MIPS32R5 processors."

Ingenic JZ4780 is a MIPS32R2 architecture

https://elinux.org/Ingenic_JZ4780

Am 03.01.2018 23:13 schrieb "Johannes Schmitz" <johannes.schmitz1@gmail.com
>:

>
> 2018-01-03 23:05 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com>:
>
>> Hello,
>>
>> Please keep the Buildroot mailing list in Cc. Thanks!
>>
>> On Wed, 3 Jan 2018 22:56:33 +0100, Johannes Schmitz wrote:
>>
>> > >  - What is your Buildroot configuration ?
>> > >
>> > >  - What is the exact MIPS processor you're running this on ?
>> > >
>> > >  - Does it work when --disable-mipsfpu is passed, or when
>> > >    --enable-mipsfpu is passed ?
>> > >
>> >
>> > - glibc toolchain
>>
>> I need the exact Buildroot .config file, to see which specific CPU you
>> have chosen, and other configuration knobs.
>>
>
> Here is the .config
> https://pastebin.com/kHK8H9hh
>
>
>> > - It does work when --disable-mipsfpu is forced
>>
>> OK.
>>
>> > - See hardware information here: https://elinux.org/CI20_Hardware
>> >
>> > - additional FPU related information we found during the discussion:
>> > https://dmz-portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_
>> Interlinking#10.5.2._Setting_the_FPU_mode
>>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180104/1a85483d/attachment.html>
