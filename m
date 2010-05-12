From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 12 May 2010 21:34:41 +0000 (UTC)
Subject: [Buildroot] Status of external toolchain support
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
Message-ID: <hsf6tg$9v9$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-12, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:

> The same entity shall build both the cross gdb and the gdbserver, as
> those two are tightly coupled, because of the protocol to exchange
> information between them.

Sorry, I don't understand where that limitation comes from.

The gdb remote protocol is standardized.  It's plain ASCII, and I
can't see how it would be affected by the choice of toolchain.  There
are plenty of third-party gdb servers that are not only built by
different entities, but the server isn't even built from gdb sources.

As long as as the gdb server and client versions are compatible (e.g.
they're using the same protocol) they should work fine.

Have you seen protocol failures betwee gdb server/client due to the
fact that a different toolchain was used to build them?  If so, my
understand is that's a bug and should be reported to the gdb
maintainers.

-- 
Grant Edwards               grant.b.edwards        Yow! I invented skydiving
                                  at               in 1989!
                              gmail.com            
