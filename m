From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 10 Feb 2009 11:16:18 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com><873aeue676.fsf@macbook.be.48ers.dk><1233865432.4148.6.camel@elrond.atmel.com><87eiycarei.fsf@macbook.be.48ers.dk><D071C392448744ECA7A451C54A46ABE6@aeglos><d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com><1234200240.4143.8.camel@elrond.atmel.com><87hc3376b4.fsf@macbook.be.48ers.dk><1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
Message-ID: <078a01c98b68$c18b47c0$f53018ac@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Hi,
> 
> >> Why? It looks like it uses LINUX26_KERNEL_NAME.
> >> 
> 
> Ulf> They work with the patches to u-boot which assumes
> Ulf> that the name look like they used to.
> Ulf> If the new naming remains, who is going to fix the u-boot patches?
> 
> See, that's the problem about adding feature patches to BR. Don't
> expect other developers to spend time on fixing those things up.

I think you want people to discuss things before committing.
Yet, this patch was committed before an agreement was made.
THAT is the problem.
The patch should not have been committed by Thiago, unless 
he is prepared to go the full way.

> Ulf> AGAIN: How can you RETROACTIVELY set _SUFFIX/_PREFIX
> Ulf> if you forgot to set _SUFFIX/_PREFIX and thus
> Ulf> overwrote another project.
> 
> Another project would have another BR2_PROJECT setting, and hence use
> another directory, right? That was the idea behind the project thing,
> wasn't it?

Yes and No
Not if you publish the resulting binaries on an ftp mirror
and not if you have a common /tftpboot directory.

Then missing out on fixing _SUFFIC/_PREFIX means 
additional work, something which was not needed
with the previous implementation.

> 
> Ulf> Which again means fixing u-boot patches.
> Ulf> Who is going to do that
> Ulf> You suggested previously that the person breaking the build
> Ulf> needs to fix it.
> Ulf> Does that still apply?
> 
> For bugfixes yes, but for feature patches for some kind of hardware
> the developer might not have access to - No.
> 
> Sure, we should try to make sure everything still works, but we also
> HAVE to make it easy to do so - That means among others that the
> various platforms should behave similary.
> 

Each platform in u-boot behaves differently anyway.
You define the functionality of u-boot in the board header file.

> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson
