From: Simon Kagstrom <simon.kagstrom@gmail.com>
Date: Sun, 30 Jan 2011 08:44:25 +0100
Subject: [Buildroot] Buildroot with 2.4.27 kernel: Network problems
Message-ID: <20110130084425.5cc28ae3@x41>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildrooters!

I have a bit of an odd problem. I have a ARM-based Linux stereo, which
I've rooted and want to add despotify support to and other things (see
here:

  http://simonkagstrom.livejournal.com/51909.html

if you are interested). I'm using buildroot to make my one rootfs for
it. The problem is that it uses a very old kernel, 2.4.27-vrs1, and
while the built buildroot filesystem works, I get problems with network
operations:

  g2 trunk 6869 Island:# ping 192.168.1.104
  PING 192.168.1.104 (192.168.1.104): 56 data bytes
  ping: can't create raw socket: Function not implemented

  g2 trunk 6869 Island:# ./busybox telnet localhost  
  telnet: socket: Function not implemented

and I presume this is because of the kernel version mismatch and
perhaps uClibc. Nslookup also doesn't work


I'm trying to trick buildroot into accepting my 2.4.27 kernel sources
by renaming it linux-2.6.tar.bz2 and hacking a bit, but is so far
unsuccessful. Have anyone else used buildroot with a 2.4 kernel
recently?

// Simon
