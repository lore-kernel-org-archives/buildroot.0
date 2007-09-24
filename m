From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 24 Sep 2007 14:27:51 +0200
Subject: [Buildroot] Qtopia4 Failure
In-Reply-To: <005301c7fe8e$0ec437e0$dcc4af0a@atmel.com>
References: <1190563965.7015.21.camel@elrond.atmel.sweden>
	<1190591711.4299.17.camel@cyclops.infocab.com.au>
	<d6cda7730709231756k273d449axed0357049468a113@mail.gmail.com>
	<1190595992.4299.27.camel@cyclops.infocab.com.au>
	<d6cda7730709231841v7ce7eec2qa801e54b049763b7@mail.gmail.com>
	<1190600185.4299.44.camel@cyclops.infocab.com.au>
	<d6cda7730709232043k2d85bb2bi8318ef6f652a1eff@mail.gmail.com>
	<1190621530.7015.45.camel@elrond.atmel.sweden>
	<20070924091242.GA32094@aon.at>
	<005301c7fe8e$0ec437e0$dcc4af0a@atmel.com>
Message-ID: <20070924122751.GB32094@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 24, 2007 at 11:34:02AM +0200, Ulf Samuelsson wrote:
>> On Mon, Sep 24, 2007 at 10:12:10AM +0200, Ulf Samuelsson wrote:
>> 
>>>I will submit a patch that allows UCLIBC_SUSV3_LEGACY
>>>to be SED'ed into the uclibc configuration based on
>>>BR2_UCLIBC_SUSV3_LEGACY (a new makeconfig choice).
>> 
>> Please don't. This is way too fine-grained.
>> That's exactly the reason why we have
>> $ make uclibc-menuconfig
>> 
>> This is easy enough.
>>
>
>I can do that, but then I have to enable UCLIBC_SUSV3_LEGACY as default
>and not the UCLIBC_SUSV3_LEGACY_MACROS as it is today.

This is a *sample* config. You are supposed to configure this yourself.

This sample config is definately *not* ment to be used without
configuring it according to your special needs. If you want a libc
that's easy to use (because it is not configurable), then go use glibc.

>
>The current situation is not acceptable.

It is unacceptable to shield the user from any configuration, especially
if he did change the default config anyway (since he selected qtopia
which was not on per default, last time i looked).

>There needs to be either a dependency on UCLIBC_SUSV3_LEGACY
>when enabling Qtopia, (and I do not see how that can be accomplished)
>or the default operation should allow Qtopia to build without problems.

Whatever. I disabled the LEGACY stuff in the provided *example* config.
Still, the user is responsible for configuring his desired buildroot
config as well as his desired uClibc-, busybox- and kernel config.

If a user is not willing to configure for his needs, he'd be better off
to either use the default, without changing anything (which will result
in a very minimal i386 uClibc rootfs) or use some pre-built distro like
redhat, suse, debian etc are providing.
