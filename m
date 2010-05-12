From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 12 May 2010 23:53:18 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <hsf6tg$9v9$1@dough.gmane.org>
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
	<hsf6tg$9v9$1@dough.gmane.org>
Message-ID: <201005122353.19051.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant, All,

On Wednesday 12 May 2010 23:34:41 Grant Edwards wrote:
> On 2010-05-12, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:
> > The same entity shall build both the cross gdb and the gdbserver, as
> > those two are tightly coupled, because of the protocol to exchange
> > information between them.
> Sorry, I don't understand where that limitation comes from.

> The gdb remote protocol is standardized.  It's plain ASCII, and I
> can't see how it would be affected by the choice of toolchain.  There
> are plenty of third-party gdb servers that are not only built by
> different entities, but the server isn't even built from gdb sources.
> 
> As long as as the gdb server and client versions are compatible (e.g.
> they're using the same protocol) they should work fine.

That's what I meant. And there have been quite some reports where
the cross gdb and the gdbserver came from two gdb versions, and
they did not speak the same protocol.

> Have you seen protocol failures betwee gdb server/client due to the
> fact that a different toolchain was used to build them?  If so, my
> understand is that's a bug and should be reported to the gdb
> maintainers.

That was not what I meant. Sorry for the confusion. I was trying to say:
 "build the cross gdb *and* the gdbserver from the same version of gdb
 "so there is no protocol mis-match between the two

Of course, the gdbserver stub in the kernel, in u-boot, in redboot, in
my jtag ICE, and in many other places are not built from the same source.

And in that case, it can happen that using too old/new a cross gdb with
them will lead to issues, as they might not use the same protocol.

Yes, I've seen that happen, with an "old" jtag ICE, and a "recent" gdb.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
