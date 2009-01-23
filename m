From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 13:44:32 +0100
Subject: [Buildroot] How handle broken or partly broken packages in
	the	distribution
In-Reply-To: <20090123095712.6878553d@hcegtvedt>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
Message-ID: <1232714672.5311.43.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-23 klockan 09:57 +0100 skrev Hans-Christian Egtvedt:
> On Thu, 22 Jan 2009 20:07:33 +0100
> Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> 
> <snipp list of packages>
>  
> > I suggest we disable them using
> > 	depends on "BR2_avr32
> > 
> 
> I assume " was supposed to be !.
> 

Of course.

> > so they are not selectable for AVR32 users
> > 
> 
> To make it harder to fix the problem with the packages?
> 

No, I think the distribution should as a default only enable things
which actually has a slim change to build.

The svn should allow developers more freedom.

> It might also be a result from the development environment on your
> build machine, like the recent alsa-utils errors somebody else found on
> opensuse, which I have not triggered in my Ubuntu system.
> 

True, but that was why I sent is as a suggestion.
These packages looks terminally broken to me for the AVR32.
If we know that they are broken then we should not expose
inexperienced firstcomers to Buildroot to them.

A package which depends on the build host should not be
disabled or at least not in this manner.

If we want more users/contributors, then the behaviour
should be perceived as stable, and we currently have 
no mechanism to ensure stability.


BR
Ulf Samuelsson
