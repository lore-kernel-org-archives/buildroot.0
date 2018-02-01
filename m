From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 1 Feb 2018 23:19:51 +0100
Subject: [Buildroot] [PATCH 1/1] ltp-testsuite: Add upstream patch to
 fix build numa detection
In-Reply-To: <20180130051501.hvjb7h3smtif5zvu@sapphire.tkos.co.il>
References: <20180129202314.16767-1-petr.vorel@gmail.com>
 <20180130051501.hvjb7h3smtif5zvu@sapphire.tkos.co.il>
Message-ID: <20180201221950.aj6hrj2do573aqcz@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

> On Mon, Jan 29, 2018 at 09:23:14PM +0100, Petr Vorel wrote:
> > This removes fix added in commit 3c937807a3 ("ltp-testsuite: disable numa tests")

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> >  ...x-numa-v2-detection-for-cross-compilation.patch | 37 ++++++++++++++++++++++
> >  package/ltp-testsuite/ltp-testsuite.mk             |  3 +-
> >  2 files changed, 38 insertions(+), 2 deletions(-)
> >  create mode 100644 package/ltp-testsuite/0002-numa-Fix-numa-v2-detection-for-cross-compilation.patch

> [...]

> > diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> > index 28dc24749e..87854568d8 100644
> > --- a/package/ltp-testsuite/ltp-testsuite.mk
> > +++ b/package/ltp-testsuite/ltp-testsuite.mk
> > @@ -56,8 +56,7 @@ LTP_TESTSUITE_CONF_ENV += \
> >  	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
> >  	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
> >  	LIBS="$(LTP_TESTSUITE_LIBS)" \
> > -	SYSROOT="$(STAGING_DIR)" \
> > -	have_numa_headers=no
> > +	SYSROOT="$(STAGING_DIR)"

> >  # Requires uClibc fts and bessel support, normally not enabled
> >  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

> You should also make numactl an optional dependency to make the build more 
> reproducible.

Can you be more specific, what you mean? numactl is required as a command in numa based
tests (used by testcases/kernel/numa/numa01.sh). But that's not build dependency, it's a
runtime dependency.

> baruch


Kind regards,
Petr
