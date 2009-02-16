From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 16 Feb 2009 19:21:49 -0300
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <DC9C4AC978BF4D23BD014FFB5ACEA3FF@aeglos>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<d6cda7730902100917o3aee167fg2ae06ca5e3e402ba@mail.gmail.com>
	<08b701c98ba7$906b24f0$f53018ac@Glamdring>
	<d6cda7730902101048w1706b7e9j41d8702d50766756@mail.gmail.com>
	<1234382611.22044.8.camel@elrond.atmel.com>
	<87zlgsg26x.fsf@macbook.be.48ers.dk>
	<DC9C4AC978BF4D23BD014FFB5ACEA3FF@aeglos>
Message-ID: <d6cda7730902161421u7e11244cydf5dc4812a1bc851@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 12, 2009 at 3:16 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
>
>>
>> Hi,
>>
>> Ulf> Just for fun, I checked my OpenSuSE /boot directory
>>
>> Ulf> Guess what I found:
>>
>> Ulf> "vmlinuz" which happens to be a LINK to
>>
>> Ulf> ??vmlinuz-$(KERNEL_VERSION)-$(REV)-$PROJECT)
>> Ulf> ?
>> Ulf> There was also a:
>> Ulf> vmlinux-$(KERNEL_VERSION)-$(REV)-$PROJECT).gz file
>>
>> Ulf> Looks like the guys doing OpenSuSE are as "odd" as I am.
>>
>> And guess what the kernel outputs? A simple arch/x86/boot/bzImage, as
>> platform/distribution specific naming convention doesn't belong in the
>> mainline kernel.
>>
>
> No but it belongs in the distribution created by buildroot.
> Try making a remote upgrade when the old kernel and the new kernel has the
> same name.

Hardly any embedded device contains just a linux system without any
custom software made by the manufacturer of the product, which is
usually closed source.

Had the upgrade been motivated by changes in that closed source part,
the kernel would probably be the same.

Also, even if the kernel names had unpredictable entrophy in it, the
upgrade program has to handle it, removing the old binary, otherwise
you would fill up all the flash space.

> Your argument smells of
> "we have always done it in a certain way, and therefore we should always do
> it in the same way".
> There are some reasons why you may want to have a simple name,
> and all these reasons are covered by generating a symlink.

Actually, it looks like you are trying to come up with any sort of
argument against. Last one you could think of was that the ls *had* to
list files in a specific order. But even that could be done with
addition of a prefix. Now, 5 days later you come up with upgrading
problems.
The current solution does allow you to do the exact same thing, while
still giving the flexibility of opting not to use it at all. We are
not limiting your options, but rather giving more, why can't we just
let this thread go?

Even the u-boot patches could be made to work: Either look for a date
by strstr, or, adopt a template for the command to work, and set that
into the suffix. Same as before, except that instead of
linux-version-date, it would be uImage-version-date.

Then you could set the at91*_defconfig to that default, instead of
setting it into Config.in or makefiles.
It would be best implemented as the first solution, but the second one
is easiest.

> It is a good idea to make things as simple as possible, you are trying to
> make things simpler than that.
>

Hard coded prefix, suffix and extension plus symlink is much closer to
overcomplicated than current solution is to over simplification.

Kind Regards,
    Thiago A. Correa
