From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Sep 2009 15:01:43 +0200
Subject: [Buildroot] Problem with defconfig
In-Reply-To: <4ABA187A.5010709@mimc.co.uk> (Mark Jackson's message of "Wed\,
	23 Sep 2009 13\:45\:46 +0100")
References: <4AB9F39B.4090300@mimc.co.uk> <874oqurm9z.fsf@macbook.be.48ers.dk>
	<4AB9FE2D.1080009@mimc.co.uk> <87my4lrke1.fsf@macbook.be.48ers.dk>
	<4ABA02F3.6020706@mimc.co.uk> <87eipxrfz0.fsf@macbook.be.48ers.dk>
	<4ABA187A.5010709@mimc.co.uk>
Message-ID: <871vlxrf0o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Jackson <mpfj-list@mimc.co.uk> writes:

Hi,

 >> %_defconfig: $(CONFIG)/conf
 >> cp $(shell find ./target/ -name $@) .config
 >> -@$(MAKE) oldconfig

 Mark> I looked at this and put in some @echo lines before and after the cp.
 Mark> They were never executed !?!  Is this some bash / dash setup thing ?

Well, they shouldn't as make complains that it doesn't know how to make
the rule, but I don't get why.

Does it work if you change the %_defconfig to atngw100-base_defconfig ?

 >> So I don't get it why it doesn't trigger for you. Does a simple 'make
 >> blah_defconfig' work for you?

 Mark> No ... everything comes up "no rule to make".

strange.

 >> Does it work with the 2009.08 release? What version of make are you using?

 Mark> 2009.08 release of buildroot ?  It's not out yet is it ?

Ehh, yes it is. We're no longer in August ;)

http://buildroot.net/downloads/buildroot-2009.08.tar.bz2

 Mark> mpfj at mpfj-x64:~/avr32/buildroot$ make -v
 Mark> GNU Make 3.81
 Mark> Copyright (C) 2006  Free Software Foundation, Inc.
 Mark> This is free software; see the source for copying conditions.
 Mark> There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
 Mark> PARTICULAR PURPOSE.

Ok, I'm using 3.81 as well (Debian).

-- 
Bye, Peter Korsgaard
