From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 21:56:32 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
	for network interfaces to appear
In-Reply-To: <CADZ9A7pN8Tq8NzDbnNDjjSP0Y7Edvo7TbngcFNhttO+v+ybMXg@mail.gmail.com>
 (Maury Anderson's message of "Mon, 26 Oct 2015 15:53:03 -0500")
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 <87io5tcraw.fsf@dell.be.48ers.dk>
 <CADZ9A7pN8Tq8NzDbnNDjjSP0Y7Edvo7TbngcFNhttO+v+ybMXg@mail.gmail.com>
Message-ID: <8737wxcprz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maury" == Maury Anderson <maury.anderson@rockwellcollins.com> writes:

 > I believe both suggestions should be added.

Indeed.

> Thank you for the awk magic.  The modified awk magic creates duplicates,
 > for instance if you had "lo eth3 eth3:1 eth3:2" you end up with "lo eth3
 > eth3 eth3".  The duplicates don't hurt anything, just waste time in the
 > loop.  Can we pipe it through uniq?  (Provided uniq is in the default
 > busybox.)

We could, but as we are already waiting, the trivial overhead of a few
more stat("/sys/class/net/<iface>") calls imho isn't worth requiring
uniq for.

-- 
Venlig hilsen,
Peter Korsgaard 
