From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Nov 2009 16:10:05 -0600
Subject: [Buildroot] Build jobbing
In-Reply-To: <877htb638c.fsf@macbook.be.48ers.dk>
References: <200911271522.58858.minimod@morethan.org>
	<877htb638c.fsf@macbook.be.48ers.dk>
Message-ID: <200911271610.08010.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 27 2009, Peter Korsgaard wrote:
> >>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:
> 
>  Michael> When Buildroot is tested, do you use anything other than: -j1?
> 
> Sure.
> 
>  Michael> I have been using -j5 to keep my quad-core out of the idle loop;
>  Michael> but am beginning to suspect there is something not right about that.
> 
> Notice that you have to set BR2_JLEVEL under build options - The
> toplevel make must NOT be run with -jN.
> 

Yup, got that right.

Now using the repository head -

The cross-uClibc will not build with "gnu-hash" option unless the host binutils
already support "gnu-hash" (??) - Easy, I just disable that and pretended I 
didn't get the message.

ltrace does not build - just disabled it for now.
mii-diag-2.11 does not build - just disable it for now.
We already know about sstrip - I bug reported that one (I think).

nand_{erase,lock,unlock) in BB-1.15.2 does not build.

continuing...
will go back and investigate those things *later*.

Mike
