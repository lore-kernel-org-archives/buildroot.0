From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 10:12:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/ofono: bump to version 1.29
In-Reply-To: <20190521055644.11708-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Tue, 21 May 2019 07:56:44 +0200")
References: <20190521055644.11708-1-petr.vorel@gmail.com>
Message-ID: <87blzsqnjc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Backport upstream patch which adds explicit_bzero() autoconf detection,
 > which fixes br-arm-cortex-a9-glibc and br-arm-full-static build:

 > In file included from ell/random.c:34:
 > ell/missing.h:59:20: error: static declaration of ?explicit_bzero? follows non-static declaration
 >  static inline void explicit_bzero(void *s, size_t n)
 >                     ^~~~~~~~~~~~~~
 > In file included from ./ell/util.h:26,
 >                  from ell/private.h:26,
 >                  from ell/random.c:33:
 > /home/pvorel/br-test-pkg/br-arm-cortex-a9-glibc/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/string.h:435:13: note: previous declaration of ?explicit_bzero? was here
 >  extern void explicit_bzero (void *__s, size_t __n) __THROW __nonnull ((1));
 >              ^~~~~~~~~~~~~~

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
