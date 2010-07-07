From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jul 2010 22:45:46 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <87aaq358x1.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Wed, 07 Jul 2010 22:33:30 +0200")
References: <4C33AB4E.9050604@gmx.net>
	<AANLkTimdJ34gAH-YTjfOkW_iEsKZyRvBVnbLIS55oMdd@mail.gmail.com>
	<4C34E18F.4080109@gmx.net> <87aaq358x1.fsf@macbook.be.48ers.dk>
Message-ID: <87630r58cl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Ossy> After passing init=/bin/sh to the kernel, I ran into a similar error:
 Ossy> [    4.387550] eth0: link up, 100 Mb/s, full duplex, flow control disabled
 Ossy> [    4.716652] Looking up port of RPC 100003/2 on 192.168.1.106
 Ossy> [    4.727962] Looking up port of RPC 100005/1 on 192.168.1.106
 Ossy> [    4.739261] VFS: Mounted root (nfs filesystem) on device 0:12.
 Ossy> [    4.745153] Freeing init memory: 112K
 Ossy> sh: I won't write compressed data to a terminal.
 Ossy> sh: For help, type: `sh --help'.

 Peter> Hmm, Did something overwrite your busybox binary? It should be around
 Peter> ~500KB big.

 Peter> What does strings -n 25 bin/busybox|head give?

Seems like it:

ln -s /bin/bunzip2 sh; ./sh
sh: I won't write compressed data to a terminal.
sh: For help, type: `sh --help'.

I guess something went wrong with the recent conversion of the bzip2
package. Will test.

-- 
Bye, Peter Korsgaard
