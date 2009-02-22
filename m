From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Feb 2009 00:29:55 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <87myce3vvb.fsf@macbook.be.48ers.dk>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
Message-ID: <20090222232955.GA10011@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 23, 2009 at 12:16:56AM +0100, Peter Korsgaard wrote:
>  Daniel> as pointed out in two threads on the alsa-dev ML, there seems to be
>  Daniel> general problem with ALSA libraries built by buildroot:
> 
>  Daniel> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
>  Daniel> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/015005.html
> 
> Alsa-lib had an issue with !LARGEFILE support that we fixed recently
> and pushed upstream, but other than that I don't remember any
> bugreports.

Hmm, what I see is certainly not a LARGEFILE issue.

> You mentioned something about 1.0.19, but buildroot is still using
> 1.0.18, are you using some local changes?

Yes, true, forgot to mention that. We locally patched to use 1.0.19 but
that was merely because I hoped to fix the problem by that - the same
problem exists with 1.0.18. And I got this problem since a long time and
always patched my way around it (by overriding the value with some
hard-coded constant) as I thought it is a minor issue that will be fixed
sooner or later. But as it turns out, the problem seems to be bigger and
might also have other impact than just that single failing function
call.

I'll build alsa-lib and alsa-utils with OE tomorrow and see whether that
makes any difference.

Daniel
