From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 6 May 2008 12:08:47 -0300
Subject: [Buildroot] Ulf, you broke AVR32, why?
In-Reply-To: <008a01c8af69$7d5d1be0$5e8d910a@atmel.com>
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
	<013a01c8aef9$5aa98d10$070514ac@atmel.com>
	<d6cda7730805051634p6bb3a5c4mb9e584e6059cb693@mail.gmail.com>
	<008a01c8af69$7d5d1be0$5e8d910a@atmel.com>
Message-ID: <d6cda7730805060808g5aa7d98am3e29c421e88345a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  > On Mon, May 5, 2008 at 6:41 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
>  >> > You removed something that was working in favor of something that is
>  >>  > not for no reason.
>  >>
>  >>  The Atmel patches adds way too much bloat to the svn.
>  >
>  > Google's entire svn history has 3Mb, including the AVR32 patches plus
>  > careless local svn mv's. How is that too much bloat?
>  >
>
>  The AVR32 patches are larger than that, just for one version.
>  Adding patches for several versions of the toolchain will make this worse.
>

Then I will use the same argument you are using to defend your spin
off of u-boot: As the Atmel legal department decides to actually do
some thinking and aprove the patches to FSF, they will go away. I have
just did what I could, openned ticket with support about the issue and
I'm contacting the Sales Manager for my reagion, Carlos Unda, to
complain about the current gcc support state of the silicon, since he
asked the last time we met. Unfortunally I can't do more than that.

>  >>  That is why the external toolchain was added.
>  >>  Also, IIRC some patches broke other architectures.
>  >>
>  >
>  > That's why people is working on selectively applying patches based on $ARCH
>  >
>  > From my point of view, those are clutter:
>  > ./arch-arm/kernel-patches-2.6.24/linux-2.6.24-at91.patch
>  > ./arch-arm/kernel-patches-2.6.20.4/linux-2.6.20.4-atmel.patch
>  > ./arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91.patch
>  > ./arch-arm/kernel-patches-2.6.21.1/linux-2.6.21.1-at91-1-update.patch
>  > ./arch-arm/kernel-patches-2.6.21.5/linux-2.6.21.5-at91-1-update.patch
>  > ./arch-arm/kernel-patches-2.6.21.5/linux-2.6.21.5-at91.patch
>  >
>
>  Obviously it would be better to download these patches instead
>  of storing them in the buildroot tree...
>  They will eventually go away, when I have enough time to fix.
>

Then why not focus on the platform that you use on a daily basis
instead of the one that you clearly do not? Let a decision like this,
that affects a different user base then you to the actual users. Back
when you touched the topic, I have warned that the prepatched
toolchain didn't work.

>  > Not to mention having a separate u-boot, just because the Atmel ARM
>  > didn't get to get their patches upstream, while AVR32 did.
>
>  They were provided to the U-Boot project and were ignored without comments,
>  so the AT91 team eventually got fed up.
>  The AT91 team has started resubmitting patches, but it is not in the state
>  that it is usable for all relevant parts.
>  Since that is prepatched, we are talking about minimal additions to the buildroot svn.

By the definition that you used to destroy our build, that's bloat,
let's remove it.

>  >
>  > There is no gcc 4.2.2 in there. There is no gdb-4.7.1 in there.
>
>  The AVR32 team has been working on a new version of the toolchain
>  but I have been mostly offline for the last two weeks, so I did not check.
>  I do not think it will take too much time to fix this.
>

4.2.2 has been there for a long time, and is known to be stable. The
only other toolchain version other than 4.2.2 that is capable of
building a working image is 4.1.2, and it had it's issues of it's own.
This is no excuse for not having 4.2.2 at the ATMEL_MIRROR what ever
it is.
Had it being possible to all buildroot members to fix it, we would not
be having this discussion. Had you tested your changes, it would be
noticed.

I asked many times, do not remove the patches. Doing so behind
everyone's back was a huge lack of respect to the users of AVR32 and
to the original submitter. I wouldn't expect many to keep submiting to
buildroot with this atitute (now talking to a broader audience).

Please be considerative of other people's work before taking
unilateral actions like this.

>  >
>  >>  > Please revert your changes asap.
>  >>  >
>  >>
>  >>  No, if there are problems, it should be fixed within the external toolchain
>  >>  to avoid adding those megabytes, which are of no interest to AVR32 users.
>  >>  There are hooks to patch the external toolchain if neccessary.
>  >
>  > Then I guess we will all be getting FTP user accounts to your server
>  > now? So that we can fix things within the external toolchain?
>  > I'm interested in those few kb (namely 915826 bytes). Last time I
>  > checked, I was in the universe of AVR32 users.
>
>  Why, you can apply patches as usual, but the patches are located
>  in the target/device/Atmel/toolchain directory.
>

But I can't update the toolchain without your intervention, and I have
to reserve 50Mb of additional HD space for the download, as Amar has
mentioned. Isn't this worst?

>  >
>  > You didn't even care to test your changes, and despite protests
>  > removed the toolchain support anyway. You are taking away our freedom
>  > to update, fix, do whatever with the toolchain from within buildroot.
>
>  If you check above, you see it is not like that.
>  You can modify the external toolchain by applying patches,
>  so you have the freedom you want.

Not quite, if I want to update the toolchain, not only for myself, I
have to figure out another host, change at least 4 defconfigs, besides
the usual *.in files. Not only that, but external toolchain is used by
only a fraction of the buildroot users, thus less tested and
maintained. As it has happened before, it might break and it might be
several weeks before someone do something about it.

>  If you can find another host where the stuff can be located
>  then it is easy to move it. I just put it on that server for convenience
>  and I see only drawbacks that it cannot be updated by other
>  members of the buildroot community.
>

Shouldn't this be drawback enough? What's the difference of that and
forking the whole project altogether?

>  > Not to mention breaking things up and making me and a hell lot of
>  > other people lose their day's or week's work.
>  > Please revert your changes asap.
>  >
>
>  As I mentioned, the toolchain breaks other toolchains so this is not a good idea.
>  You also have the problem that you want to apply some of the buildroot patches
>  but not all.

Fixed it in google svn by a simple \*.patch{,.$(ARCH)}
There I reverted your changes, and things work again, and it should
build for all platforms, specially since John has been working on it.


Regards,
   Thiago A. Correa
