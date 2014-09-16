From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Sep 2014 21:44:10 +0200
Subject: [Buildroot] Question about adding toybox.mk.
In-Reply-To: <5410CCD9.60403@landley.net>
References: <5410CCD9.60403@landley.net>
Message-ID: <5418930A.6080009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/14 00:12, Rob Landley wrote:
> My toybox project (http://landley.net/toybox) is another multicall
> binary posix command line implementation in the same genre as busybox.
> (Toybox is public domain instead of GPL and I think the code's a lot
> better, but I would, wouldn't I?) Point is, it potentially replaces a
> bunch of other packages.
> 
> Various people have added it to buildroot, the first google hit is:
> 
> https://gfiber.googlesource.com/buildroot/+/968ebdd190e2aa15357f44e388c9896fbc8f9ca3/package/toybox/toybox.mk
> 
> So I was thinking of formally submitting a toybox.mk to you guys
> upstream, but I've hit a snag:
> 
> Busybox is kind of deeply embedded into buildroot, with 227 lines of
> busybox.mk covering a bunch of config symbols and special cases for
> selectively hiding and otherwise interacting with lots of other
> packages, and it's not just that one file:
> 
>   $ grep -irl busybox buildroot/ | wc -l
>   89
> 
> Swapping out busybox for toybox seems about as intrusive as swapping out
> uClibc for musl. Does anyone have any hints how I should go about it
> before I start? (Having buildroot's toybox.mk define BLAH_BUSYBOX symbol
> names, seems... untidy?)

 The reason that busybox appears in so many other packages is just to make sure
that the executables from the full package override the ones from busybox.
However, in a first step, it's OK to assume that the full package is not
selected when you configure some feature of toybox. We can later correct it if
necessary.


 Regards,
 Arnout

> 
> Suggestions?
> 
> Rob
> 
> (Yeah, I could wait until toybox's 1.0 release when I've run out of
> things that busybox does that toybox doesn't which I care about. But
> other people aren't waiting, so I thought I'd look into it. what's there
> is _useful_. My aboriginal linux project is slowly replacing busybox
> with toybox a command at a time, using them side by side in the
> meantime. The real issue here is buildroot is treating busybox as
> special when there may actually be 3 or 4 interesting alternate
> implementations of the same functionality. Has systemd implemented its
> own "mount" and "umount" commands yet? Wait for it...)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
