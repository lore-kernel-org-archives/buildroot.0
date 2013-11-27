From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Nov 2013 17:15:11 +0100
Subject: [Buildroot] libglib2 (or maybe libffi) build failure
In-Reply-To: <52960F8C.5040003@newflow.co.uk>
References: <52960F8C.5040003@newflow.co.uk>
Message-ID: <20131127171511.2abd4873@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mark Jackson,

On Wed, 27 Nov 2013 15:28:12 +0000, Mark Jackson wrote:
> Using the latest git top-of-tree, libglib2 fails to compile as follows:-
> 
> $ git pull
> Already up-to-date.
> $ make

[...]

> Alternatively, you may set the environment variables LIBFFI_CFLAGS
> and LIBFFI_LIBS to avoid the need to call pkg-config.
> See the pkg-config man page for more details.
> make: *** [/home/mpfj/buildroot-bt/output/build/libglib2-2.36.3/.stamp_configured] Error 1
> 
> Any clues ?

Interesting, thanks. Can you see in output/staging/usr/lib/pkgconfig/
if you have the file named libffi.pc ?

If that's the case, then, can you try:

	./output/host/usr/bin/pkg-config --list-all

and see if libffi is part of the list ?

If that's the case, can you pastebin (http://code.bulix.org) the entire
output/build/libglib2-2.36.3/config.log file, and give us the URL at
which it was posted?

Finally, can you inspect your environment (by running "env") to see if
there's anything suspicious. Ideally, giving your environment might be
useful, but read it first to remove any personal stuff from it, if
applicable.

> BR2_TARGET_GENERIC_ROOT_PASSWD="rmfMPVaGP3nnjWUV"

Hopefully it's not an important password :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
