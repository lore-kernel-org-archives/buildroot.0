From: Simon Kagstrom <simon.kagstrom@gmail.com>
Date: Sun, 30 Jan 2011 13:01:31 +0100
Subject: [Buildroot] Buildroot with 2.4.27 kernel: Network problems
In-Reply-To: <87bp2yybq0.fsf@macbook.be.48ers.dk>
References: <20110130084425.5cc28ae3@x41> <87bp2yybq0.fsf@macbook.be.48ers.dk>
Message-ID: <20110130130131.10c3fcf5@x41>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 Jan 2011 10:36:39 +0100
Peter Korsgaard <jacmet@uclibc.org> wrote:


>  Simon>   g2 trunk 6869 Island:# ping 192.168.1.104
>  Simon>   PING 192.168.1.104 (192.168.1.104): 56 data bytes
>  Simon>   ping: can't create raw socket: Function not implemented
> 
>  Simon>   g2 trunk 6869 Island:# ./busybox telnet localhost  
>  Simon>   telnet: socket: Function not implemented
> 
> Is this with a complete rootfs built by buildroot, or just with the
> busybox binary copied over to an existing system? If the last, don't
> forget that uClibc doesn't have a stable ABI, so you need to link
> busybox statically if you want to run it in a rootfs with another
> uClibc version.

I've tried both. I've compiled a static busybox to be able to chroot
into the buildroot rootfs, but both behave the same way.


I know 2.4 is ancient. However, I don't have the sources to even
attempt a port to 2.6 (a request to Philips have been sent though), and
also would like to avoid bricking my system, so I'd like to stay with
the current kernel.

Well, well, I'll see if I can hack something together.

// Simon
