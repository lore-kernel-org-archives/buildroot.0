From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 20:01:47 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <20090414103327.2fd69516@danhplaptop> (Dan Lyke's message of
	"Tue\, 14 Apr 2009 10\:33\:27 -0700")
References: <20090414103327.2fd69516@danhplaptop>
Message-ID: <87eivtx0c4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Lyke <danlyke@flutterby.com> writes:

 Dan> So I know I've gotten a Buildroot install that did this automatically
 Dan> once, but through various incremental steps I've gotten a kernel that
 Dan> has the hotplug stuff enabled, and if I

 Dan> echo /bin/mdev > /proc/sys/kernel/hotplug

 Dan> or just run "mdev -s" manually I get my hot-plugged devices created, but
 Dan> I'm sure that at some point I had a system where buildroot had created
 Dan> the appropriate init script for me.

 Dan> Am I hallucinating, or to get this as part of the compile do I need to
 Dan> copy my configs across to a fresh buildroot and make again?

The target_busybox does this ("use minimal target skeleton" under the
busybox config).

 Dan> And what's the "make" argument for Buildroot that should clean
 Dan> everything, but not destroy my configs? "make clean" destroys configs,
 Dan> or at least did last time I typed it...

make distclean.

-- 
Bye, Peter Korsgaard
