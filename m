From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 26 Jan 2018 12:17:04 +0100
Subject: [Buildroot] [PATCH 1/2] ltp-testsuite: disable numa tests
In-Reply-To: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
Message-ID: <20180126111703.65saceajkfpshqyr@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
> The LTP_CHECK_SYSCALL_NUMA autoconf macro uses AC_RUN_IFELSE when it
> detects the numaif.h header. This is incompatible with cross
> compilation.
Is it really about cross compilation or about out-of-tree building?
Any idea how to fix it in upstream? As we test both cross compilation and out out-of-tree
compilation with travis:
https://travis-ci.org/linux-test-project/ltp/builds/333338092

* aarch64 cross compilation
https://travis-ci.org/linux-test-project/ltp/jobs/333338103
* arm cross compilation
https://travis-ci.org/linux-test-project/ltp/jobs/333338102
* native out-of-tree compilation
https://travis-ci.org/linux-test-project/ltp/jobs/333338101

> Fixes:
> http://autobuild.buildroot.net/results/21a/21a6eeddbf5ccffc34c38527d0807305a5eb3917/
> http://autobuild.buildroot.net/results/fc0/fc01921e8e8e1ea100461b29137c4219e6686c58/
> http://autobuild.buildroot.net/results/962/96285d154abd65838ff5c66e96db309d9ac26c80/

> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/ltp-testsuite/ltp-testsuite.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 87854568d8a6..28dc24749ec8 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -56,7 +56,8 @@ LTP_TESTSUITE_CONF_ENV += \
>  	CFLAGS="$(LTP_TESTSUITE_CFLAGS)" \
>  	CPPFLAGS="$(LTP_TESTSUITE_CPPFLAGS)" \
>  	LIBS="$(LTP_TESTSUITE_LIBS)" \
> -	SYSROOT="$(STAGING_DIR)"
> +	SYSROOT="$(STAGING_DIR)" \
> +	have_numa_headers=no

>  # Requires uClibc fts and bessel support, normally not enabled
>  ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)

Acked-by: Petr Vorel <petr.vorel@gmail.com>


Kind regards,
Petr
