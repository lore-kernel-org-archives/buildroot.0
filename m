From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Dec 2012 19:52:05 +0100
Subject: [Buildroot] [PATCH 21/51] package/libedit2: new package
In-Reply-To: <1355070924-8009-22-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-22-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121209195205.7fb4b643@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  9 Dec 2012 17:34:54 +0100, Yann E. MORIN wrote:

> +LIBEDIT2_DEPENDENCIES    = host-pmake libbsd ncurses

If I'm correct, this package is the only one that needs host-pmake, no?

If so, then seeing how simple libedit seems to be, I think a patch
adding a proper configure.ac + Makefile.am to libedit2, making its
build system correct, and independent of pmake, would be in fact a lot
easier.

It would avoid the huge pmake package that has gazillions of patches,
and would avoid the horrible mess in libedit2.mk to get the
installation step correct.

Since there has been no release of libedit2 since 2008, I don't expect
the patch to migrate to the autotools to become obsolete too fast :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
