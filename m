From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Jan 2011 13:43:35 +0100
Subject: [Buildroot] Buildroot with 2.4.27 kernel: Network problems
In-Reply-To: <20110130130131.10c3fcf5@x41> (Simon Kagstrom's message of "Sun, 
	30 Jan 2011 13:01:31 +0100")
References: <20110130084425.5cc28ae3@x41> <87bp2yybq0.fsf@macbook.be.48ers.dk>
	<20110130130131.10c3fcf5@x41>
Message-ID: <877hdmy32g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Simon" == Simon Kagstrom <simon.kagstrom@gmail.com> writes:

Hi,

 Simon> PING 192.168.1.104 (192.168.1.104): 56 data bytes
 Simon> ping: can't create raw socket: Function not implemented
 >> 
 Simon> g2 trunk 6869 Island:# ./busybox telnet localhost  
 Simon> telnet: socket: Function not implemented
 >> 
 >> Is this with a complete rootfs built by buildroot, or just with the
 >> busybox binary copied over to an existing system? If the last, don't
 >> forget that uClibc doesn't have a stable ABI, so you need to link
 >> busybox statically if you want to run it in a rootfs with another
 >> uClibc version.

 Simon> I've tried both. I've compiled a static busybox to be able to chroot
 Simon> into the buildroot rootfs, but both behave the same way.

So you get this with a statically built busybox as well? Odd. Ping needs
to be setuid root to work. Are you root?

 Simon> I know 2.4 is ancient. However, I don't have the sources to even
 Simon> attempt a port to 2.6 (a request to Philips have been sent
 Simon> though), and also would like to avoid bricking my system, so I'd
 Simon> like to stay with the current kernel.

Ok. I would expect a buildroot generated rootfs to work with the 2.4
kernel without too much trouble.

What kind of hardware is this (CPU type)? How have you configured
buildroot?

-- 
Bye, Peter Korsgaard
