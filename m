From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 13:52:02 +0100
Subject: [Buildroot] [PATCH] build/advanced: add option to check for use
	of cdefs.h
In-Reply-To: <1480849177-16847-1-git-send-email-yann.morin.1998@free.fr>
References: <1480849177-16847-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161204135202.109c6480@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 11:59:37 +0100, Yann E. MORIN wrote:
> We want to catch programs that directly include sys/cdefs.h so that
> we can fix them not to. So, we want to instrument sys/cdefs.h to emit
> a warning when it is included.

Thanks for working on this. However, I am still not convinced that we
want to merge such an additional complexity (one new Config.in choice
with three sub-options, two additional Config.in options), a cdefs.h
wrapper for glibc/uclibc, etc.

Do we really care about upstream packages using sys/cdefs.h? Is it
really the most important battle to fight against upstream projects
using sys/cdefs.h?

If we start having instrumentation in Buildroot to detect such very
specific "standard violation", then where do we stop? There's plenty of
upstream projects doing bogus things all over the place.

I believe the paranoid checks for bogus -I/-L flags are fine because
they really potentially break cross-compilation. But this cdefs.h
mis-use doesn't break anything, now that we have the cdefs.h
replacement for musl.

Peter, Arnout, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
