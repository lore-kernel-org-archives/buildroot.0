From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Aug 2009 07:49:51 +0200
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <2d6a9f6f0908290631h2a599334t608bec3f73fe6d@mail.gmail.com> (Bill
	Bogstad's message of "Sat\, 29 Aug 2009 09\:31\:55 -0400")
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
	<2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
	<87a5b0800908280931x523f6c88k1e006634d612425f@mail.gmail.com>
	<2d6a9f6f0908281451i4f7e1ed1s1f5da2693b6559a4@mail.gmail.com>
	<159a01660908290033y692d41e8r781a5d4c9b3445f6@mail.gmail.com>
	<2d6a9f6f0908290631h2a599334t608bec3f73fe6d@mail.gmail.com>
Message-ID: <87y6p1rgu8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bill" == Bill Bogstad <bogstad@pobox.com> writes:

Hi,

 Bill> Finally, I would quibble with your statement about Ubuntu being
 Bill> perfectly supported as well.  Having to make such a fundamental
 Bill> change to a core program of the system in order to get it to work
 Bill> correctly seems a little much.  In any case, it looks like the
 Bill> top level Makefile already handles things if /bin/sh isn't bash.
 Bill> It may be that some parts of buildroot don't make use of SHELL
 Bill> properly, but that would seem to be a bug rather then a
 Bill> dependency.  The actual dependency is that bash be installed on
 Bill> the system somewhere.

Exactly. The buildroot makefiles should work just fine with dash as
/bin/sh, but the build system of some of the packages (which doesn't use
the SHELL setting) might not.

This is ofcourse a bug in those upstream packages, but there's a chance
some have hit (as most people have/had bash as /bin/sh).

-- 
Bye, Peter Korsgaard
