From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 16 Dec 2010 10:27:07 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
	5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <AANLkTin5Ykrqe8KEXkpyA=nXYqJkd+88fHWAxTQx6oUE@mail.gmail.com>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
	<20101213174444.3b328c36@surf>
	<AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
	<20101213205936.10a69e66@surf> <87d3p5i34o.fsf@macbook.be.48ers.dk>
	<AANLkTi=r5L2L1Cch5=XVw_Ek+7fkhtB1crQYtywFqddS@mail.gmail.com>
	<AANLkTin5Ykrqe8KEXkpyA=nXYqJkd+88fHWAxTQx6oUE@mail.gmail.com>
Message-ID: <AANLkTimWbBxHRC4CFNodpzAa=4r94YhTdLwGrPC=615c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kelvin,

On Thu, Dec 16, 2010 at 4:21 AM, Kelvin Cheung <keguang.zhang@gmail.com> wrote:
> Hi Belisko,
>
> The ARMv4(including arm920t) does not support pld instruction.
> So, try to patch armv4l/dsputil_arm_s.S with following code:
>
> #if !HAVE_PLD
> .macro pld reg
> .endm
> #endif
Thanks it helps!
>
> 2010/12/15 Belisko Marek <marek.belisko@gmail.com>
>>
>> Hi,
>>
>> On Tue, Dec 14, 2010 at 1:56 AM, Peter Korsgaard <jacmet@uclibc.org>
>> wrote:
>> >>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> >>>>>> writes:
>> >
>> > ?Thomas> On Mon, 13 Dec 2010 19:30:57 +0100
>> > ?Thomas> Belisko Marek <marek.belisko@gmail.com> wrote:
>> >
>> > ?>> Sorry for spamming. My mistake. I accidently select arm920 not
>> > arm926t.
>> > ?>> It's correct now.
>> >
>> > ?Thomas> Well, even with arm920 it should still build. But I'd prefer to
>> > look at
>> > ?Thomas> those issues once the newer mplayer package is merged, since it
>> > has
>> > ?Thomas> quite significantly improved how processor-specific
>> > optimizations are
>> > ?Thomas> handled.
>> >
>> > It's merged now. Care to retest?
>> retest with latest HEAD (update yesterday) but mplayer isn't build for
>> arm920
>> (same ASM problem like reported)
>> >
>> > --
>> > Bye, Peter Korsgaard
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>> >
>>
>> thanks,
>>
>> marek
>>
>> --
>> as simple and primitive as possible
>> -------------------------------------------------
>> Marek Belisko - OPEN-NANDRA
>> Freelance Developer
>>
>> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> Tel: +421 915 052 184
>> skype: marekwhite
>> icq: 290551086
>> web: http://open-nandra.com
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
> Best Regards!
> Kelvin
>
>

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
