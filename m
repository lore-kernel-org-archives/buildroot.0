From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jul 2011 22:42:55 +0200
Subject: [Buildroot] [Patch] Allow file to be built against static libs.
In-Reply-To: <87sjq22f6n.fsf@macbook.be.48ers.dk>
References: <F9C551623D2CBB4C9488801D14F864C6044668@ex-mb1.corp.adtran.com>
 <87sjq22f6n.fsf@macbook.be.48ers.dk>
Message-ID: <20110719224255.68dada94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 19 Jul 2011 22:22:56 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> We indeed force --enable-shared --disable-static for host builds, but
> that doesn't really matter. For target builds we use (see
> package/Makefile.in) --enable-static --enable-shared when
> PREFER_STATIC_LIB is enabled, so rather than something file specific, I
> think it would make more sense to set that to --enable-static
> --disable-shared instead.

We have :

ifeq ($(BR2_PREFER_STATIC_LIB),y)
SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
else
SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
endif

So it is already --enable-static --disable-shared when
BR2_PREFER_STATIC_LIB=y. So, Andy, I think that your patch is basically
a no-op, except for the host build of the file package, but it is
totally incorrect to turn the host build of the file package to a
static library depending on the value of BR2_PREFER_STATIC_LIB, which
is limited to target packages only.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
