From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 27 Nov 2009 04:47:09 -0600
Subject: [Buildroot] 2009.11-rc1 build failure
In-Reply-To: <87eink70bd.fsf@macbook.be.48ers.dk>
References: <op.u3z7srteyqa4qb@jap-lappis>
	<op.u31nbqpqyqa4qb@jap-lappis.nevion.com>
	<87eink70bd.fsf@macbook.be.48ers.dk>
Message-ID: <200911270447.11916.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri November 27 2009, Peter Korsgaard wrote:
> 
> Notice that your kernel headers version doesn't need to be the same as
> the kernel version you're using.
> 
- - - -
>
> I don't know about PXA in particular (but even if so, please use the
> latest in the 2.6.27.x series). In general, the latest stable kernel
> release (currently 2.6.31.6) is the most sensible choice.
> 

Although a newcomer to using Buildroot -
the above is not Buildroot specific advice -
It is a good rule of thumb when building for Linux.

For example (my current use case):

I am building user land code against the 2.6.31.6 *headers*
even though that code will be running on a 2.6.12.6 kernel
released Aug. 29, 2005. (At least until I replace it.)

That is an amazing level of backwards compatibility.
Of course, it allows a person to build code today that uses
system calls that might not exist at run-time. ;)
But in cases like that, your userland code will get an error,
not break something.

On the other hand, I can see your case for wanting to build
against the oldest, stable (I.E: still supported) kernel.
Which is 2.6.27.x, most recently released version Nov. 10, 2009.
Doing that might avoid some of those run-time surprises.  ;)

So it probably depends on your own project goals -
Greatest degree of compatibility now (2.6.27.x), or
longest lasting compatibility going forwarded (2.6.31.x).

I am shooting for "rebuild userland every 5 years" myself. ;)

Mike
