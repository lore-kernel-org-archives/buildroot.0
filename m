From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Feb 2009 13:46:07 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <87d4d92v88.fsf@macbook.be.48ers.dk>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
	<877i3h4k5z.fsf@macbook.be.48ers.dk>
	<20090223120950.GB16934@buzzloop.caiaq.de>
	<87d4d92v88.fsf@macbook.be.48ers.dk>
Message-ID: <20090223124607.GC16934@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 23, 2009 at 01:28:23PM +0100, Peter Korsgaard wrote:
>  Daniel> I'm playing ping-pong between the two lists now, and over
>  Daniel> there they pointed out that this was indeed reported quite a
>  Daniel> while ago:
> 
>  Daniel> http://lists.busybox.net/pipermail/buildroot/2008-July/009884.html
> 
> Ahh, nothing happened to that mail as the submitter never replied to
> Daniel Laird's mail.
> 
>  Daniel> Anyway, let's make sure to apply this patch asap :)
> 
> So what exactly needs to get committed? The --with-versioned=no is
> easy, but should the:

This one is certainly needed.

> ifeq ($(BR2_arm),y)
> ALSA_LIB_CFLAGS+=-mabi=aapcs-linux
> endif
> 
> Be in an EABI conditional?

I'm not aware of any ABI problem with that, so I can't say.

Daniel
