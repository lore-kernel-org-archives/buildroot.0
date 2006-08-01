From: Rob Landley <rob@landley.net>
Date: Mon, 31 Jul 2006 20:12:48 -0400
Subject: [Buildroot] base busybox version for buildroot?
In-Reply-To: <20060727183737.GB23639@codepoet.org>
References: <bf61e79a0607270644g7beea2b2p67890c1a88528436@mail.gmail.com>
	<20060727183737.GB23639@codepoet.org>
Message-ID: <200607312012.48613.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 27 July 2006 2:37 pm, Erik Andersen wrote:
> On Thu Jul 27, 2006 at 09:44:42AM -0400, Drew Cohan wrote:
> > Hi,
> > 
> > Is the base busybox version for buildroot is now 1.2.0, instead of
> > 1.1.3?  Is there a buildroot config somewhere that determines which
> > version of busybox is used, or is it just based on the date of the
> > buildroot package (builds after 30 June 2006 use busybox 1.2.0)?
> > There seems to have been a file size change recently, just curious
> > what that might have been:
> > 
> > buildroot-20060710.t..> 10-Jul-2006 00:17  3.8M
> > buildroot-20060711.t..> 11-Jul-2006 00:17  4.3M
> 
> It probably makes sense at this point to have configurable
> busybox versions (as with gcc and binuitls) with a specific
> default config for each.

I still think the latest release version is all you need, but what do I 
know? :)

Trying to test our nightly snapshots gets you into fun areas like the -Werror 
stuff where the build breaks on warnings as if they were errors, which works 
fine on gcc 4.0 and earlier under i386, but not so well on gcc 4.1 which 
produces _stupid_ warnings for things that are _not_ broken...

Sigh.  Tweaked the makefiles today so gcc 4.1 doesn't have -Werror because I 
don't think we're _ever_ going to fix some of those.  That compiler version 
is just _broken_...

Rob
-- 
Never bet against the cheap plastic solution.
