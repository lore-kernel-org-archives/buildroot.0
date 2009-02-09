From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 09 Feb 2009 23:52:10 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <87hc3376b4.fsf@macbook.be.48ers.dk>
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<873aeue676.fsf@macbook.be.48ers.dk>
	<1233865432.4148.6.camel@elrond.atmel.com>
	<87eiycarei.fsf@macbook.be.48ers.dk>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
Message-ID: <1234219930.4143.16.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2009-02-09 klockan 20:34 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  >> You will get everything you had before, albeit in a different order
>  >> (uImage-myprojec-2.6.28-20080106)
>  >> 
> 
>  Ulf> Which breaks the U-Boot autoscripts.

> Why? It looks like it uses LINUX26_KERNEL_NAME.
> 

They work with the patches to u-boot which assumes
that the name look like they used to.
If the new naming remains, who is going to fix the u-boot patches?


>  Ulf> I need it in this specific order.
>  Ulf> I also would like to avoid unneccesary problems
>  Ulf> due to someone forgetting to update strings.
> 
> Then set the appropriate _SUFFIX / _PREFIX variables.
> 

AGAIN: How can you RETROACTIVELY set _SUFFIX/_PREFIX
if you forgot to set _SUFFIX/_PREFIX and thus
overwrote another project.

It is high maintenance and error prone to do it this way.


>  Ulf> And I repeat, I want all files related to a specific project
>  Ulf> to be sorted together.
> 
> Then put them in /tftpboot/<project>/.
> 

Which again means fixing u-boot patches.
Who is going to do that
You suggested previously that the person breaking the build
needs to fix it.
Does that still apply?

BR
Ulf Samuelsson
