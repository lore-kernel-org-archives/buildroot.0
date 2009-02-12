From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Feb 2009 19:16:25 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com><87hc3376b4.fsf@macbook.be.48ers.dk><1234219930.4143.16.camel@elrond.atmel.com><874oz27iry.fsf@macbook.be.48ers.dk><078a01c98b68$c18b47c0$f53018ac@Glamdring><87ab8u5ub5.fsf@macbook.be.48ers.dk><083a01c98b86$99d10260$f53018ac@Glamdring><d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com><d6cda7730902100917o3aee167fg2ae06ca5e3e402ba@mail.gmail.com><08b701c98ba7$906b24f0$f53018ac@Glamdring><d6cda7730902101048w1706b7e9j41d8702d50766756@mail.gmail.com><1234382611.22044.8.camel@elrond.atmel.com>
	<87zlgsg26x.fsf@macbook.be.48ers.dk>
Message-ID: <DC9C4AC978BF4D23BD014FFB5ACEA3FF@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>
> Hi,
>
> Ulf> Just for fun, I checked my OpenSuSE /boot directory
>
> Ulf> Guess what I found:
>
> Ulf> "vmlinuz" which happens to be a LINK to
>
> Ulf> ??vmlinuz-$(KERNEL_VERSION)-$(REV)-$PROJECT)
> Ulf> ?
> Ulf> There was also a:
> Ulf> vmlinux-$(KERNEL_VERSION)-$(REV)-$PROJECT).gz file
>
> Ulf> Looks like the guys doing OpenSuSE are as "odd" as I am.
>
> And guess what the kernel outputs? A simple arch/x86/boot/bzImage, as
> platform/distribution specific naming convention doesn't belong in the
> mainline kernel.
>

No but it belongs in the distribution created by buildroot.
Try making a remote upgrade when the old kernel and the new kernel has the 
same name.

Your argument smells of
"we have always done it in a certain way, and therefore we should always do 
it in the same way".
There are some reasons why you may want to have a simple name,
and all these reasons are covered by generating a symlink.

It is a good idea to make things as simple as possible, you are trying to 
make things simpler than that.

Best Regards
Ulf Samuelsson
