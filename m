From: Ralph Siemsen <ralphs@netwinder.org>
Date: Tue, 29 Jul 2008 22:39:53 -0400
Subject: [Buildroot] cris
In-Reply-To: <485FB911.7010708@cetrtapot.si>
References: <20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc> <485F507D.5070801@cetrtapot.si>
	<20080623130323.GB8920@mx.loc> <485FB61C.7080403@cetrtapot.si>
	<20080623144641.GA9282@mx.loc> <485FB911.7010708@cetrtapot.si>
Message-ID: <20080730023953.GC19215@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 04:54:09PM +0200, Hinko Kocevar wrote:
> 
> I think that other arches are not affected as long as the whole need for headers goes (haven't really tried out). It is kernel bug in cris port that can't handle the headers for arch-v10 and arch-v32 correctly. So once the Axis has complete solution in order to pull all required headers from the source tree this problems will vanish.

I'm compiling from GIT targeting ARM and ran into some of the same
problems as discussed in this thread.  Specifically:
 - missing limits.h
 - changing "extern" to "static" in libpthread
I was able to make things work by adapting patches posted here (Thanks!).
eg. patch sysdeps/arm/pt-machine.h instead of cris version

I ran into an additional issue when I enabled soft-float toolchain,
there was a problem linking mpfr, somehow /usr/lib/libgmp.so from my
i386 host machine is pulled instead of the ARM target version.  I
don't have a clean solution for this one, but I was able to manually
link mpfr against the correct libgmp.so

-Ralph
