From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Mar 2009 10:43:34 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <87d4d92v88.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Mon\, 23 Feb 2009 13\:28\:23 +0100")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
	<20090223120950.GB16934@buzzloop.caiaq.de>
	<87d4d92v88.fsf@macbook.be.48ers.dk>
Message-ID: <87wsb9k27t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> So what exactly needs to get committed? The --with-versioned=no is
 Peter> easy, but should the:

 Peter> ifeq ($(BR2_arm),y)
 Peter> ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
 Peter> endif

 Peter> Be in an EABI conditional?

That hunk just seems wrong to me. We always add -mabi=<> on ARM, so
it's a noop on EABI, and who knows what happens on OABI?

Ulf, why did you add it in the first place?

-- 
Bye, Peter Korsgaard
