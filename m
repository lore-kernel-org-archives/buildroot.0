From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Nov 2013 11:28:24 +0100
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <20131120111027.472fe84b@skate>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
 <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
 <20131120111027.472fe84b@skate>
Message-ID: <CAAXf6LXvuO_ki10RokO+9LkJtjx_SRUpML9pChxD9huvc7RkOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Nov 20, 2013 at 11:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Alvaro Gamez,
>
> On Wed, 20 Nov 2013 11:03:59 +0100, Alvaro Gamez wrote:
>
>> Sorry for the big delay on this issue.
>>
>> Now that I've spent a few hours looking at the code, I can firmly say this
>> is a compiler bug.
>>
>> I've studied beecrypt's sha384.c code (openssl and others implement exactly
>> the same code from a common source) and I've managed to reduce the code to
>> what I think is a minimal example of bug triggering code.
>>
>> After requesting gcc to preprocess the source, the same error still
>> happens. Almost any minimal change I've tried to the preprocessed source
>> makes the error go away (indexes or values seem to be irrelevant, I've just
>> mantained the numbers the code came from). An optimization flag is required
>> to trigger the bug (-Os, -O1,2,3). I haven't been successful trying to find
>> which specific optimization flag is the one that causes the error.
>>
>> I've manually merged both (original and preprocessed files) to ease the
>> analysis of the original source code and the resulting code. I'm sorry I
>> can't provide any more information, I really don't have any grasp of gcc's
>> internals.
>
> Thanks! In fact, Spenser submitted patches to add support for
> Microblaze in the internal toolchain backend. This is useful because
> the pre-built external toolchains that we have been using until now are
> quite old, and not maintained by Xilinx.
>
> Therefore, the plan is, I believe:
>
>  (1) Merge Spenser's patches to add Microblaze internal toolchain
>  support.

It would be nice if someone could verify that the compiler errors from
these autobuilds are gone when using Spenser's toolchain.
Alvaro, are you interested in trying this?

Thanks,
Thomas
