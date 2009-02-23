From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 23 Feb 2009 10:45:15 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <87y6vx33tx.fsf@macbook.be.48ers.dk>
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<49A268F5.5030300@carallon.com>
	<87y6vx33tx.fsf@macbook.be.48ers.dk>
Message-ID: <20090223094515.GB15722@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 23, 2009 at 10:22:34AM +0100, Peter Korsgaard wrote:
>  Will> Not sure if this is the same as a problem I was seeing with
>  Will> alsa-lib. It was a while ago so not entirely sure. However I found my
>  Will> problem was to do with the complicated alsa versioning API meaning
>  Will> that the wrong version of the function was called. I fixed it by
>  Will> adding --with-versioned="no" to the alsa-lib configure (I also moved
>  Will> to 1.0.19 as that had a number of bug fixes for other things I
>  Will> needed).
> 
>  Will> Hope that helps,
> 
> Care to send a patch for both?

We'd need to find out if the avr-inline patch is still needed for 1.0.19
or if that's been fixed upstream now. Apart from that, I rebased the
fix-ott_t-patch.

Can anyone with a AVR32 environment try to build and use 1.0.19 without
that patch?

Daniel
