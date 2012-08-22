From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Aug 2012 15:41:24 +0200
Subject: [Buildroot] [PATCH] erlang: Add new package.
In-Reply-To: <CAFbHwiS3mbxWCdAtWfNe995Bm3wSb0B+NztV_CpT82Wy-CJr=g@mail.gmail.com>
References: <CAFbHwiTCXTT23fGLnz_w8kr+6NmNzV9kK+=nHYpXOY5NOMt1dg@mail.gmail.com>
 <20120817193340.39e7ddb5@skate>
 <CAFbHwiS3mbxWCdAtWfNe995Bm3wSb0B+NztV_CpT82Wy-CJr=g@mail.gmail.com>
Message-ID: <20120822154124.32ef2529@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 22 Aug 2012 14:00:04 +0100,
Will Newton <will.newton@gmail.com> a ?crit :

> >  *) The complete Erlang stuff gets installed in /usr/lib/erlang, even
> >  the binaries (compiler, interpreter?) in /usr/lib/erlang/bin/. Is this
> >  the normal installation location? If so, then we should at least
> >  probably provide a few symlinks from /usr/bin/.
> 
> I get these symlinks in my build, e.g.:
> 
> [wnewton at wnewton-linux buildroot]$ ls -l output/target/usr/bin/erl*
> lrwxrwxrwx. 1 wnewton ldapusers 21 Aug 22 11:18
> output/target/usr/bin/erl -> ../lib/erlang/bin/erl
> lrwxrwxrwx. 1 wnewton ldapusers 22 Aug 22 11:18
> output/target/usr/bin/erlc -> ../lib/erlang/bin/erlc

Hum, ok, I might have looked improperly. I'll check again with your
updated patch.

> It is quite large unfortunately. At least part of this seems to be
> that the bytecode files (.beam) are not very compact. It is possible
> to delete packages (just delete
> /usr/lib/erlang/lib/<package>-<version>) but it is not clear exactly
> what a good minimal set is. I remove gs (tk based UI) and wx
> (wxWidgets based UI) libs as they are not supported by buildroot.
> 
> I'll add a config option for the megaco application which is the
> largest by some distance.

Ok.

> I've added support for enabling openssl, zlib and ncurses dependencies.
> 
> I'll repost the patch with these changes.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
