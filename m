From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Wed, 8 Aug 2012 11:12:59 -0500
Subject: [Buildroot] ext-toolchain-wrapper issues
In-Reply-To: <20120804185814.3c51db5c@skate>
References: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
 <20120804111932.6e0f0481@skate>
 <CAE9DZUROhjmKaqYqPoYPa0gy2RhxnX0dvQ4+XJ+2Z2nwjQed+w@mail.gmail.com>
 <20120804185814.3c51db5c@skate>
Message-ID: <CAE9DZUQp8QONoyfsieHt=vfdk4xreqqY=yekTTHk5yPopSFGeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Just wanted to get back with you on this and let you know that I
narrowed this down further.  There is no fault with the
ext-toolchain-wrapper code.  It does the right thing.  The problem
with my Linux kernel not booting was caused by the use of an incorrect
gcc tune parameter.  This came from a buildroot config file I got from
Marvell.  I simply changed it as follows, and everything is fine now.

#BR2_GCC_TARGET_TUNE="marvell-fv7"
BR2_GCC_TARGET_TUNE="cortex-a9"

Regards,

Dallas

On Sat, Aug 4, 2012 at 11:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Sat, 4 Aug 2012 11:25:40 -0500,
> Dallas Clement <dallas.a.clement@gmail.com> a ?crit :
>
>> > Interesting, I'm also working around the Armada 370 and Armada XP.
>> > What are you doing with this platform?
>>
>> Building a NAS product.
>>
>> > The Armada XP support in mainline doesn't need machine type, it uses
>> > the device tree.
>>
>> Marvell provides a patch to the 3.0.6 kernel, which definitely
>> provides machine types.  They have 3 or 4 defconfigs for the Armada
>> XP.
>
> Ok. We are currently mainlining support for the Armada XP, but it's far
> from being complete enough to build a NAS product right now.
>
>> > Is this Marvell toolchain available somewhere so I can try to
>> > reproduce the problem?
>>
>> You have to get it from Marvell's extranet.  Need to register first.
>> Pls contact Erez who is the FAE if you need help getting in
>> (ereza at marvell.com).
>
> Ok, then I will not be able to do this right now. I am behind a 3G
> connection during my holidays, so I will not do a full toolchain
> download.
>
>> I'll do that.  It would be nice to get it figured out.  Will let you
>> know what I find.
>
> Yes, that would be good, thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
