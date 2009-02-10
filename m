From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 21:06:15 +0100
Subject: [Buildroot] What's up with the kernel names? (Again)
In-Reply-To: <A5E32A5430FA4B31BA2D4BE8B5E985AF@aeglos> (Ulf Samuelsson's
	message of "Tue\, 10 Feb 2009 20\:49\:15 +0100")
References: <d6cda7730902031749o51818770l1077d71877f9ad33@mail.gmail.com>
	<D071C392448744ECA7A451C54A46ABE6@aeglos>
	<d6cda7730902060631o54f2944rddc0f7cd8278a11a@mail.gmail.com>
	<1234200240.4143.8.camel@elrond.atmel.com>
	<87hc3376b4.fsf@macbook.be.48ers.dk>
	<1234219930.4143.16.camel@elrond.atmel.com>
	<874oz27iry.fsf@macbook.be.48ers.dk>
	<078a01c98b68$c18b47c0$f53018ac@Glamdring>
	<87ab8u5ub5.fsf@macbook.be.48ers.dk>
	<083a01c98b86$99d10260$f53018ac@Glamdring>
	<d6cda7730902100834j409c7df8te83d42356957608c@mail.gmail.com>
	<A5E32A5430FA4B31BA2D4BE8B5E985AF@aeglos>
Message-ID: <87skmm3vm0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> Second of all, I expect to have more choices in advanced, not less.
 >> Third of all, your At91 customers will have the exact same problem had
 >> they choosen the standard build because they also don't want the
 >> forced odd name.

 Ulf> That is an assumption you make.

Which is probably fairly easy to make given the 'advanced' in the
name. Are you saying it shoule be Makefile.ulf instead? ;)

 Ulf> I regularily discuss pro's and con's with buildroot with end customers.

Atmel customers are not necessarily a representative group for
buildroot users.

 Ulf> There are a number of things brought up, but, so far, never the linux
 Ulf> file name.
 Ulf> I can understand that you would like to have a filename which does not
 Ulf> change.
 Ulf> "odd" is something relative, as I pointed out, *professional* companies
 Ulf> do NOT use simple names as "uImage" for embedded control.

So mainline Linux / U-Boot / whatever isn't *professional*?

 Ulf> The "simple" name is in this context insane.
 Ulf> And again, it would be easy to add an option for a choice.

Which is what Thiago's commit added.

 Ulf> You happen to give no choice for people which do not
 Ulf> want to have uImage as part of the name.
 Ulf> uImage is a name for the initiated, not for the newbie
 Ulf> who expect to have a "linux".

Then add linux to _PREFIX for those configs. The previous linux-*.gz
doesn't tell me anything about the format, and in fact it was extra
confusing with that .gz even though it isn't a gzip file.

 Ulf> The *key* requirement for newbies is to load a kernel/rootfs to
 Ulf> the target with minimum effort. The current "cleanups" to "sane"
 Ulf> defaults is clearly making life harder for newbies.

That I don't follow. A constant name by default should if nothing else
make it simpler.

 Ulf> They want (at the most) to do

 Ulf> $ make userconfig                ; setup user specific defaults.
 Ulf> $ make <board>_config       ; setup board
 Ulf> $ make                                 ; build board
 Ulf> $ make install                        ; program target with resulting files.

And where is that broken with Thiago's commit?

 Ulf> The main complaint of buildroot is lack of stability.  People do
 Ulf> not want to upgrade and retest just because someone feels that
 Ulf> this is a good idea, they want 100% control over when upgrades
 Ulf> happen.  At the same time they would like to work in a project
 Ulf> which is maintained.

Maintained, uptodate and stability is hard to combine, but you are
welcome to maintain a stable tree based of the buildroot releases if
you want to.

 Ulf> With buildroot you are forced to continuosly upgrade or you lose
 Ulf> support and it is getting worse.

Worse? Just because people haven't been idling the last few weeks like
they used to do? If that's what you want, just stick to a release.

 Ulf> There is complaints that there is no support for proprietary
 Ulf> functions.

functions?

 Ulf> If you want to add your company logo at boot, this is certainly
 Ulf> not something that should  be in the trunk, but still people
 Ulf> want this to be easy to include in the build.

I don't see any problems with having some kind of bootsplash package
in BR. U-Boot afaik also has some bmp support, so I don't see the
problem.

 >> That was broken to begin with. >

 Ulf> Considering that ?ou only AFAIK want to  build uImage's for U-Boot,
 Ulf> this is a minor restriction.

Doesn't make it any less broken, especially now that we have the
prefix/suffix stuff.

 >> While still on the subject, why haven't the patches been submitted
 >> upstream? Last time you said that the At91 had given up because u-boot
 >> devs were unavailable. Then, after that, avr32 team were able to get
 >> their patches upstream. Why haven't At91 tried again?

 Ulf> You can send a mail to the at91 team and ask.

Ulf, that's not constructive - Please behave.

-- 
Bye, Peter Korsgaard
