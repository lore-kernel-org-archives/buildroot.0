From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Jan 2009 20:53:11 +0100
Subject: [Buildroot] Can't Login to New System
In-Reply-To: <ecbbfeda0901031119t680fbf95o30818572744a91fb@mail.gmail.com>
	(Andrew Wiley's message of "Sat\, 3 Jan 2009 13\:19\:59 -0600")
References: <ecbbfeda0812301520k69461096nbb27f0c5ca65c11@mail.gmail.com>
	<87iqp03ivp.fsf@macbook.be.48ers.dk>
	<ecbbfeda0812311103q219eea7evdb366ae3cfa8ae4e@mail.gmail.com>
	<ecbbfeda0812311111ra2182ach9eefaa4a47bda8d2@mail.gmail.com>
	<ecbbfeda0901031119t680fbf95o30818572744a91fb@mail.gmail.com>
Message-ID: <8763kw180o.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Wiley <debio264@gmail.com> writes:

 Andrew> Is there any way to tell what's going on when I try to login?
 Andrew> Could Busybox be segfaulting? Could there be some sort of
 Andrew> conflict between the kernel and the console (I launch the
 Andrew> kernel with the argument "console=ttyAM0")?

Sure, add strace to your build, boot the kernel with init=/bin/sh and
see what strace -f login gives you. If that fails, add printf calls to
login (busybox) till you figure out what's going wrong.

-- 
Bye, Peter Korsgaard
