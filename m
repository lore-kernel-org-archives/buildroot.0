From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Mar 2009 07:27:57 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <20090302010533.GC3223@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 2 Mar 2009 02\:05\:33 +0100")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
	<20090223120950.GB16934@buzzloop.caiaq.de>
	<87d4d92v88.fsf@macbook.be.48ers.dk>
	<87wsb9k27t.fsf@macbook.be.48ers.dk>
	<20090302010533.GC3223@buzzloop.caiaq.de>
Message-ID: <87sklwjv6a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 >> That hunk just seems wrong to me. We always add -mabi=<> on ARM, so
 >> it's a noop on EABI, and who knows what happens on OABI?

 Daniel> This one wasn't commited, right? With --with-versioned=no things are
 Daniel> fine now for EABI, but I don't know about the legacy case.

No it wasn't committed. And yeah, it should be a noop with eabi as we
already add -mabi=aapcs-linux to CFLAGS for eabi builds, but it seems
very wrong for oabi builds.

-- 
Bye, Peter Korsgaard
