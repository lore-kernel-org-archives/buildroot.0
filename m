From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Jan 2011 10:36:39 +0100
Subject: [Buildroot] Buildroot with 2.4.27 kernel: Network problems
In-Reply-To: <20110130084425.5cc28ae3@x41> (Simon Kagstrom's message of "Sun, 
	30 Jan 2011 08:44:25 +0100")
References: <20110130084425.5cc28ae3@x41>
Message-ID: <87bp2yybq0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Kagstrom <simon.kagstrom@gmail.com> writes:

 Simon> Hi Buildrooters!
 Simon> I have a bit of an odd problem. I have a ARM-based Linux stereo, which
 Simon> I've rooted and want to add despotify support to and other things (see
 Simon> here:

 Simon>   http://simonkagstrom.livejournal.com/51909.html

 Simon> if you are interested). I'm using buildroot to make my one rootfs for
 Simon> it. The problem is that it uses a very old kernel, 2.4.27-vrs1, and
 Simon> while the built buildroot filesystem works, I get problems with network
 Simon> operations:

 Simon>   g2 trunk 6869 Island:# ping 192.168.1.104
 Simon>   PING 192.168.1.104 (192.168.1.104): 56 data bytes
 Simon>   ping: can't create raw socket: Function not implemented

 Simon>   g2 trunk 6869 Island:# ./busybox telnet localhost  
 Simon>   telnet: socket: Function not implemented

Is this with a complete rootfs built by buildroot, or just with the
busybox binary copied over to an existing system? If the last, don't
forget that uClibc doesn't have a stable ABI, so you need to link
busybox statically if you want to run it in a rootfs with another uClibc
version.

 Simon> I'm trying to trick buildroot into accepting my 2.4.27 kernel
 Simon> sources by renaming it linux-2.6.tar.bz2 and hacking a bit, but
 Simon> is so far unsuccessful. Have anyone else used buildroot with a
 Simon> 2.4 kernel recently?

No, not as far as I know. 2.4.x is ancient.

-- 
Bye, Peter Korsgaard
