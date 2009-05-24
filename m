From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 May 2009 22:10:45 +0200
Subject: [Buildroot] Error configuring MPFR - "libgmp not found or uses
	a different ABI"
In-Reply-To: <1243194212.21457.1317005177@webmail.messagingengine.com> (Adam
	McLaurin's message of "Sun\, 24 May 2009 15\:43\:32 -0400")
References: <1243194212.21457.1317005177@webmail.messagingengine.com>
Message-ID: <87ab52feii.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam McLaurin <buildroot@irotas.net> writes:

 Adam> I checked out the latest buildroot from git this morning and
 Adam> unfortunately cannot get it to build successfully.

From mpfr.config.log we see:

/home/irotas/sandboxes/buildroot/build_i686/gmp-4.2.4/.libs/libgmp.so: undefined reference to `_IO_getc'
/home/irotas/sandboxes/buildroot/build_i686/gmp-4.2.4/.libs/libgmp.so: undefined reference to `__ctype_b_loc'
/home/irotas/sandboxes/buildroot/build_i686/gmp-4.2.4/.libs/libgmp.so: undefined reference to `_IO_putc'
collect2: ld returned 1 exit status

This if gmp/mpfr for the target, E.G. for the compiler running on the target.
_IO_getc is a glibc specific feature, so it seems like the gmp build
system gets confused when cross compiling and target=host and ends up
using the host compiler / include files.

I'll try to track it down.

-- 
Bye, Peter Korsgaard
