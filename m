From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 13:28:23 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <20090223120950.GB16934@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 23 Feb 2009 13\:09\:50 +0100")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
	<20090223120950.GB16934@buzzloop.caiaq.de>
Message-ID: <87d4d92v88.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 Daniel> I'm playing ping-pong between the two lists now, and over
 Daniel> there they pointed out that this was indeed reported quite a
 Daniel> while ago:

 Daniel> http://lists.busybox.net/pipermail/buildroot/2008-July/009884.html

Ahh, nothing happened to that mail as the submitter never replied to
Daniel Laird's mail.

 Daniel> Anyway, let's make sure to apply this patch asap :)

So what exactly needs to get committed? The --with-versioned=no is
easy, but should the:

ifeq ($(BR2_arm),y)
ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
endif

Be in an EABI conditional?

-- 
Bye, Peter Korsgaard
