From: Nicolas Pitre <nico@cam.org>
Date: Mon, 08 Dec 2008 16:59:26 -0500 (EST)
Subject: [Buildroot] [PATCH] make the default etc/init.d/S40network
 compatible with msh
In-Reply-To: <874p1ewwed.fsf@macbook.be.48ers.dk>
References: <alpine.LFD.2.00.0812031424090.14328@xanadu.home>
	<874p1ewwed.fsf@macbook.be.48ers.dk>
Message-ID: <alpine.LFD.2.00.0812081651380.14328@xanadu.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Dec 2008, Peter Korsgaard wrote:

> >>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:
> 
>  Nicolas> msh is currently the only good choice for uClinux but it doesn't
>  Nicolas> understands shell functions.  In this case there is nothing to gain
>  Nicolas> by using shell functions anyway.
> 
>  Nicolas> Signed-off-by: Nicolas Pitre <nico@cam.org>
> 
> A lot of the other startup scripts (dbus, dropbear, hal,
> mdnsresponder, ..) also use functions, but I take it those aren't
> relevant for uclinux?

I didn't use those, except for dropbear which startup script I modified 
as well (to only create the initial host keys since the dropbear server 
is otherwise started through inetd).

> Anyway, committed as r24325.

Thanks.

> It would btw be handy if you could create your patches with one more
> level, so I can apply them with git-am without having to remember to
> add -p 0.

True indeed.  I generated those patches with svn diff, and being so used 
to git I forgot that other systems have different defaults.

Now what about the 10 or so other patches I posted?  Will they get 
merged?  I have more patches to post but I wanted to see what was going 
to happen with this lot first.


Nicolas
