From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 11 Nov 2019 21:32:10 +0000
Subject: [Buildroot] [PATCH 1/3] arch/config.in.arc: Introduce the ARC
 optimized hs38 config
In-Reply-To: <20191111210900.GH3419@scaer>
References: <20191108174112.28183-1-vgupta@synopsys.com>
 <20191108174112.28183-2-vgupta@synopsys.com>
 <20191109144656.3da6a1b0@windsurf>
 <1112f6a7-8a23-6cd9-0af0-76e0b92e496b@synopsys.com>
 <20191111210900.GH3419@scaer>
Message-ID: <1b9054bb-3c8d-2c36-d5c1-83b6993cc2d4@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 11/11/19 1:09 PM, Yann E. MORIN wrote:
>
>>> This re-use of an existing name is a bit annoying. Indeed, all existing
>>> users of Buildroot that have a configuration with BR2_archs38 will now
>>> be building for a ARC system with a 64-bit multiplier, while they were
>>> previously building for a 32-bit multiplier.
>>>
>>> I see that what you have done is to try to be consistent between the
>>> BR2_ options and the gcc options. I'm hesitating between keeping the
>>> consistency but making the migration a bit annoying for users, or
>>> breaking the consistency to make the migration smooth for users.
>>>
>>> Since I think the number of affected users will probably be quite
>>> small/limited, I think I would be fine with merging your patch as-is,
>>> but I'd like to hear from others.
>> I agree that this might cause potential breakage, but this is not totally
>> uncharted territory for software build config. We've been building Linux kernel
>> with this option as default since mid 2018.
> I think there is some misunderstanding.

Not really, I understand what you and Thomas are asking for - its not a super
complicated patch after all ;-)

> What Thomas and I argue on, is the way to change the meaning for the
> BR2_archs38 option.

Yeah I understand that part.

> Before this patch, BR2_archs38 meant "ARC HS38". But with your patch, it
> now means "ARC HS38 with 64-bit mpy".
>
> So, a user that updates their Buildroot configurationi which previously
> had a "plain" HS38 setup, but with this patch, they get an "extended"
> HS38 with the 64-bit multiplier.
>
> That's why I suggested in my own reply, to keep BR2_archs38 as it was
> before, and introduce BR2_archs38_64mpy to mean the new HS38 w/ the
> 64-bit multiplier.
>
> Indeed, it does not match the gcc config options, but that would hardly
> be the only derogation we have in Buildroot... ;-)

Right that's not the point of doing this exercise anyways.

>> 2018-09-07 00a99339f0a3 ARCv2: build: use mcpu=hs38 iso generic mcpu=archs?
>>
>> Granted that kernel build is just one part of puzzle and any latent codegen issues
>> are more likely to surface with default applied to full software stack, I would
>> still vote for switching default to -mcpu=hs38
> Changing the meaning of an option, and changing the default of a choice,
> are two different things. I'm OK with changing the default, but I'd
> rather that options keep their meaning.

Ok sounds good !

Thx,
-Vineet
