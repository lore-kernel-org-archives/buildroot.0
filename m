From: John Voltz <john.voltz@gmail.com>
Date: Sat, 15 Mar 2008 17:39:36 -0400
Subject: [Buildroot] No X11 forward in sshd
In-Reply-To: <46a136670803151438h48913271m3f119a8c0261b2a7@mail.gmail.com>
References: <e167438e0803151044y11eeaad8we14e3ba14174d564@mail.gmail.com>
	<46a136670803151438h48913271m3f119a8c0261b2a7@mail.gmail.com>
Message-ID: <46a136670803151439s2c781cben68d4cc4d0e4b33b2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using strace on both ends might reveal something too.

John

On Sat, Mar 15, 2008 at 5:38 PM, John Voltz <john.voltz@gmail.com> wrote:

> I'm not sure what might cause your problem, but have you tried using
> x11vnc instead of directly connecting an X session? You might get better
> performance with VNC too, depending on what it is you are trying to do.
>
> John Voltz
>
>
>
> On Sat, Mar 15, 2008 at 1:44 PM, Julianne C. <juliannerc@gmail.com> wrote:
>
> > The project is built on an x86 linux kernel (2.6.9) with X support and
> > SSH connectivity.  The X server is working fine and connections can be
> > made at will via the SSH server and client (both inbound to and
> > outbound from the target system).  However, the problem is that the
> > sshd server doesn't enable X forwarding no matter what settings are
> > used.  The simplest test is this (running in xterms on the X desktop
> > via fvwm):
> >
> > 1) start the sshd program:   >/usr/sbin/sshd -dd -D
> >
> > 2) in another window, start an ssh session to localhost: >ssh -vv -X
> > localhost
> >
> > When the sshd is built using the same configuration parameters as
> > contained in openssh.mk, and run in place of the existing desktop
> > (x86_64 Fedora 7) sshd, the X forwarding works fine, performing the
> > steps above.  What might be the problem with the uClibc libraries, the
> > X configuration or possibly the sshd configuration that would prevent
> > the X session from coming through.  (The xauth program was added to
> > the /usr/bin directory to enable the X cookies to be exchanged).
> >
> > Julianne C
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080315/dec8f4c0/attachment.htm 
