From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 23 Jan 2009 17:45:43 +0100
Subject: [Buildroot] How handle broken or partly broken packages in
	the	distribution
In-Reply-To: <20090123095712.6878553d@hcegtvedt>
References: <1232651253.5311.19.camel@elrond.atmel.com>
	<20090123095712.6878553d@hcegtvedt>
Message-ID: <1232729143.5311.77.camel@elrond.atmel.com>
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
> > so they are not selectable for AVR32 users
> > 
> 
> To make it harder to fix the problem with the packages?
> 
> It might also be a result from the development environment on your
> build machine, like the recent alsa-utils errors somebody else found on
> opensuse, which I have not triggered in my Ubuntu system.
> 

True in some cases, but if the "machine is not recognized" 
pops up, then there is a slim chance for it to build.

An alternative approach would be to depend on 

	!BR_PACKAGE_<XXXX>_HIDE

and have
config BR2_HIDE_BROKEN_ON_AVR32
	depends on BR2_avr32
?	 select ?BR_PACKAGE_<XXX1>_HIDE?
	select ?BR_PACKAGE_<XXX1>_HIDE
	select ?BR_PACKAGE_<XXX1>_HIDE
	select ?BR_PACKAGE_<XXX1>_HIDE
	etc.
 
Which packages should be disabled this way should be open for
discussion, but if noone can build it, there
is no reason for wasting everyones time by making
it visible IN THE DISTRIBUTION.

BR
Ulf Samuelsson
