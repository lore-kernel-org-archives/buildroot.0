From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 27 Jan 2009 13:44:08 +0100
Subject: [Buildroot] alsa lib problem
In-Reply-To: <497EFEDC.3040606@carallon.com>
References: <497E0B14.8040801@carallon.com>
	<87ocxt2t8g.fsf@macbook.be.48ers.dk>
	<497EFEDC.3040606@carallon.com>
Message-ID: <20090127134408.2c74b516@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Jan 2009 12:32:28 +0000
Will Wagner <will_wagner@carallon.com> wrote:

> Peter Korsgaard wrote:
> > 
> > We unconditinally add the largefile stuff to TARGET_CFLAGS, which
> > apparently isn't a good idea for alsa.
> > 
> > If the kernel interface is always with an 32bit offset, then
> > asound.h should probably be changed to use a 32bit data type
> > instead. Could you try changing it to an unsigned int and recompile?
> 
> Yes is I change the asound.h header it does work.
> 
> What is the best way to proceed from here? Just patch alsa?
> 

Make a patch for alsa, and send it upstream to the alsa maintainers.
They need to fix broken code like this anyway.

<snipp>

-- 
Best regards,
Hans-Christian Egtvedt
