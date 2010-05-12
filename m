From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 12 May 2010 22:09:07 +0000 (UTC)
Subject: [Buildroot] Status of external toolchain support
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
	<hsf6tg$9v9$1@dough.gmane.org>
	<201005122353.19051.yann.morin.1998@anciens.enib.fr>
Message-ID: <hsf8u3$h7a$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-05-12, Yann E. MORIN <yann.morin.1998@anciens.enib.fr> wrote:

> That was not what I meant. Sorry for the confusion. I was trying to say:
>  "build the cross gdb *and* the gdbserver from the same version of gdb
>  "so there is no protocol mis-match between the two

That's good advice.  In theory, they don't have to be _exactly_ the
same version as long as there weren't incompatible protocol changes
between those two versions. But, figuring out where the incompatible
protocol changes are is probably a lot more work that just using the
same version for server and client.

> Of course, the gdbserver stub in the kernel, in u-boot, in redboot, in
> my jtag ICE, and in many other places are not built from the same source.
>
> And in that case, it can happen that using too old/new a cross gdb with
> them will lead to issues, as they might not use the same protocol.
>
> Yes, I've seen that happen, with an "old" jtag ICE, and a "recent" gdb.

No doubt.  There is some effort to make gdb/protocol changes so that
things are backwards compatible, but it's not always successful.

If you're building both the server and client, the safe thing to do is
always build them from the same version.

-- 
Grant Edwards               grant.b.edwards        Yow! Th' MIND is the Pizza
                                  at               Palace of th' SOUL
                              gmail.com            
