From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jul 2009 14:09:08 +0200
Subject: [Buildroot] kernel built by buildroot won't boot
In-Reply-To: <1248251679.3933.11.camel@sven> (Sven Neumann's message of "Wed\,
	22 Jul 2009 10\:34\:39 +0200")
References: <1248251679.3933.11.camel@sven>
Message-ID: <87bpncdimz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 Sven> We tracked this down to the fact that buildroot passes the
 Sven> TARGET_CFLAGS (with some minor adjustments) to the kernel build
 Sven> as CFLAGS_KERNEL. The problem is that the TARGET_CFLAGS contain
 Sven> "-mtune=iwmmxt -march=iwmmxt", which is fine for the
 Sven> user-space, but you can't build a working kernel with these
 Sven> flags. Not passing any CFLAGS at all solved the problem for us
 Sven> and buildroot now creates a kernel that boots and works nicely.

I don't use the kernel build stuff, but I think it should be fine to
just get rid of it as the kernel doesn't need to link with any user
space libraries or similar.

The kernel is also pretty good about passing the correct gcc flags for
arch variants.

 Sven> Is there a particular reason for passing the TARGET_CFLAGS to the kernel
 Sven> build? Could this perhaps be dropped entirely or at least be made
 Sven> optional?

Care to send a patch?

-- 
Bye, Peter Korsgaard
