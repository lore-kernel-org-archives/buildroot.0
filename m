From: Rob Landley <rob@landley.net>
Date: Wed, 10 Sep 2014 17:12:41 -0500
Subject: [Buildroot] Question about adding toybox.mk.
Message-ID: <5410CCD9.60403@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My toybox project (http://landley.net/toybox) is another multicall
binary posix command line implementation in the same genre as busybox.
(Toybox is public domain instead of GPL and I think the code's a lot
better, but I would, wouldn't I?) Point is, it potentially replaces a
bunch of other packages.

Various people have added it to buildroot, the first google hit is:

https://gfiber.googlesource.com/buildroot/+/968ebdd190e2aa15357f44e388c9896fbc8f9ca3/package/toybox/toybox.mk

So I was thinking of formally submitting a toybox.mk to you guys
upstream, but I've hit a snag:

Busybox is kind of deeply embedded into buildroot, with 227 lines of
busybox.mk covering a bunch of config symbols and special cases for
selectively hiding and otherwise interacting with lots of other
packages, and it's not just that one file:

  $ grep -irl busybox buildroot/ | wc -l
  89

Swapping out busybox for toybox seems about as intrusive as swapping out
uClibc for musl. Does anyone have any hints how I should go about it
before I start? (Having buildroot's toybox.mk define BLAH_BUSYBOX symbol
names, seems... untidy?)

Suggestions?

Rob

(Yeah, I could wait until toybox's 1.0 release when I've run out of
things that busybox does that toybox doesn't which I care about. But
other people aren't waiting, so I thought I'd look into it. what's there
is _useful_. My aboriginal linux project is slowly replacing busybox
with toybox a command at a time, using them side by side in the
meantime. The real issue here is buildroot is treating busybox as
special when there may actually be 3 or 4 interesting alternate
implementations of the same functionality. Has systemd implemented its
own "mount" and "umount" commands yet? Wait for it...)
