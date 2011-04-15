From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Thu, 14 Apr 2011 18:04:32 -0600
Subject: [Buildroot] Switching to /dev/ttyX
In-Reply-To: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
References: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
Message-ID: <1302825872.7244.39.camel@galileo.graphics-muse.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-04-14 at 09:50 +0200, Thomas De Schampheleire wrote:
> In /etc/inittab, you have e.g.
> tty1::respawn:/sbin/getty 38400 tty1
> tty2::respawn:/sbin/getty 38400 tty2
> tty3::respawn:/usr/bin/tail -f /var/log/messages
> By default I'm connected to the board on a serial line, e.g. /dev/ttyS0
> My question is: how can I access the other /dev/tty's?

tty's are controlling terminals for processes.  They need to be attached
to a vc (virtual console) to use chvt.  vc's require a display device,
like an LCD monitor.  Not positive 'bout that last part, but its
something like that.  You can read more about tty's and related devices
here: http://tldp.org/HOWTO/Text-Terminal-HOWTO-7.html

If you're just looking for multiple terminal sessions to work with you
can try running "screen" on your serial port connection.  That will give
you any number of extra terminal sessions.  I'm not a screen expert so
can't say if logins (getty's) are possible on those other screen
sessions.  But use of screen on serial port connections is very common
with embedded development.  I also use it on my desktop so that
cross-compiled builds I start at home can be viewed from work by
attaching the the running screen session.  Very handy.  And easy to use.

> 'tty' always shows /dev/ttyS0.

That command only shows the terminal connected to the standard input,
which would be the one you typed the command on.

-- 
Michael J. Hammel <buildroot@graphics-muse.org>
