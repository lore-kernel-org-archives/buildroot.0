From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 2 Mar 2009 02:05:33 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <87wsb9k27t.fsf@macbook.be.48ers.dk>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
	<20090223120950.GB16934@buzzloop.caiaq.de>
	<87d4d92v88.fsf@macbook.be.48ers.dk>
	<87wsb9k27t.fsf@macbook.be.48ers.dk>
Message-ID: <20090302010533.GC3223@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 01, 2009 at 10:43:34AM +0100, Peter Korsgaard wrote:
>  Peter> So what exactly needs to get committed? The --with-versioned=no is
>  Peter> easy, but should the:
> 
>  Peter> ifeq ($(BR2_arm),y)
>  Peter> ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
>  Peter> endif
> 
>  Peter> Be in an EABI conditional?
> 
> That hunk just seems wrong to me. We always add -mabi=<> on ARM, so
> it's a noop on EABI, and who knows what happens on OABI?

This one wasn't commited, right? With --with-versioned=no things are
fine now for EABI, but I don't know about the legacy case.

Thanks,
Daniel
