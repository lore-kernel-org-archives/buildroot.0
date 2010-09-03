From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 3 Sep 2010 10:44:03 -0500
Subject: [Buildroot] Gaisler sparc-leon
In-Reply-To: <878w3ivq3l.fsf@macbook.be.48ers.dk>
References: <20100903091327.v01tegjghcqso4oo@webmail.bluegenesis.com>
	<878w3ivq3l.fsf@macbook.be.48ers.dk>
Message-ID: <201009031044.06396.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri September 3 2010, Peter Korsgaard wrote:
> >>>>> "konrad" == konrad  <konrad@gaisler.com> writes:
> 
> Hi,
> 
>  konrad> My shortterm goal is to get buildroot to build a linux image
>  konrad> with romfs that includes libc shared and some more advanced app
>  konrad> like a ssh. That should cover/test already a lot
>  konrad> functionality. So far in snapgear 2.0 we only used uClibc
>  konrad> static, we had made quite a few patches to uclibc, didnt submit
>  konrad> them to the uclibc though. It was also a fairly old uclibc that
>  konrad> we used, it seems that uclibc has gotten better in the meantime
>  konrad> (while we sticked still to the old version...). I think that if
>  konrad> Gaisler would switch to buildroot and Leon users would start
>  konrad> using it the sparc the sparc part would be maintained and
>  konrad> running.I'll press this now and will post my results
> 
> Ok, good - Shared linking on sparc indeed used to be broken as far as I
> remember.
> 

From correspondence with Rob Landley. . .
Sparc 32bit should be working, Sparc 64bit may still have problems.
Both should be fixed at the time of his v1.0 project release.

>  konrad> Ps: Note at the side: If no hardware is available the
>  konrad> evaluation version of the sparcleon simulator called TSIM can
>  konrad> be used, so that non sparc users can run/test/verify too. ?
> 
> What about something a bit more standard like qemu-system-sparc? We're
> already using qemu to test E.G. arm.
> 

Perhaps a quick way to do that, would be with Aboriginal Linux 
(previously: Firmware Linux)
http://aboriginal.impactlinux.com/

I don't see anything in the pre-built binaries newer than Rob's fixes for Sparc;
but you might give the 0.9.11 build a try:
http://landley.net/aboriginal/downloads/binaries/system-image-sparc.tar.bz2

If you have access to an Intel based machine, just do a build from source for Sparc;
the directions can be found on Rob's site - it is a fairly simple process;
use the "current repository tar-ball", the qemu-system image generated should "just work".
Although I can't claim to have tried it myself - last I heard only problems with sh4 where
holding back the v1.0 release.

Mike
