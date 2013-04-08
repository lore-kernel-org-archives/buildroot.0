From: Sonic Zhang <sonic.adi@gmail.com>
Date: Mon, 8 Apr 2013 14:43:24 +0800
Subject: [Buildroot] [PATCH v2 4/7] arch: toolchain: Introduce binary
 format FLAT types.
In-Reply-To: <20130407225132.38a9471c@skate>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-4-git-send-email-sonic.adi@gmail.com>
 <20130407225132.38a9471c@skate>
Message-ID: <CAJxxZ0POdZkGkdPhXP9qz8sS9Q49g09TbSX-W_=-tF0NkAB1mg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 8, 2013 at 4:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 29 Mar 2013 17:50:40 +0800, Sonic Zhang wrote:
>
>> +# Set up flat binary type
>> +choice
>> +     prompt "FLAT Binary type"
>> +     depends on BR2_BINFMT_FLAT
>> +     default BR2_BINFMT_FLAT_ONE
>> +config BR2_BINFMT_FLAT_ONE
>> +     bool "One binary"
>> +config BR2_BINFMT_FLAT_SEP_DATA
>> +     bool "Separate data and code"
>
>         depends on BR2_bfin || BR2_m68k
>
> I know I've suggested on PATCH 3/7 to make FLAT depend on bfin, so
> technically this isn't needed. But since -msep-data is really an option
> that is only available on bfin and m68k, while the flat format can be
> used potentially on other architectures, I'd prefer to make this
> architecture dependency explicit here as well.
>
>> +config BR2_BINFMT_FLAT_SHARED
>> +     bool "Shared binary"
>
>         depends on BR2_bfin || BR2_m68k
>
> Same reason: -mid-shared-library is only available for Blackfin and
> m68k.

OK.

>
>> +endchoice
>
> I would have originally thought of putting those choices directly
> within the list of BR2_BINFMT_* (i.e have a list containing elf, fdpic,
> flat-one, flat-sep-data, flat-shared). But maybe it makes more sense
> the way you did, some I'm fine with that.
>
> Having some help text for each choice would be nice.
>
OK.

Regards,

Sonic
