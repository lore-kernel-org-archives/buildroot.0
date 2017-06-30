From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Jun 2017 06:21:40 +0300
Subject: [Buildroot] [PATCH] docs: known issues no longer valid
In-Reply-To: <20170629204730.GA27700@waldemar-brodkorb.de>
References: <20170629204730.GA27700@waldemar-brodkorb.de>
Message-ID: <20170630032140.3u3bwbec7tr25zdt@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Jun 29, 2017 at 10:47:30PM +0200, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  docs/manual/known-issues.txt | 20 --------------------
>  package/mrouted/Config.in    |  3 ---
>  2 files changed, 23 deletions(-)
> 
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index acfe4ff..ae29a48 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -7,26 +7,6 @@
>    if such options contain a +$+ sign. For example, the following is known
>    to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
>  
> -* The +ltp-testsuite+ package does not build with the default uClibc
> -  configuration used by the Buildroot toolchain backend. The LTP
> -  testsuite uses several functions that are considered obsolete, such
> -  as sigset() and others. uClibc configuration options such as
> -  DO_XSI_MATH, UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and
> -  UCLIBC_SV4_DEPRECATED are needed if one wants to build the
> -  +ltp-testsuite+ package with uClibc. You need to either use a glibc
> -  based toolchain, or enable the appropriate options in the uClibc
> -  configuration.
> -
> -* The +xfsprogs+ package does not build with the default uClibc
> -  configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc based toolchain, or enable the appropriate
> -  options in the uClibc configuration.
> -
> -* The +mrouted+ package does not build with the default uClibc
> -  configuration used by the Buildroot toolchain backend. You need to
> -  either use a glibc based toolchain, or enable the appropriate
> -  options in the uClibc configuration.
> -
>  * The +libffi+ package is not supported on the SuperH 2 and ARC
>    architectures.

This paragraph and the following one (about prboom) are also outdated. libffi 
supports all Buildroot target architectures for quite some time now. Support 
for the Sourcery CodeBench toolchain has been removed recently, so there is no 
need to mention the prboot ICE issue anymore.

baruch

> diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
> index bf4614d..e5d9348 100644
> --- a/package/mrouted/Config.in
> +++ b/package/mrouted/Config.in
> @@ -4,7 +4,4 @@ config BR2_PACKAGE_MROUTED
>  	help
>  	  An implementation of the DVMRP multicast routing protocol.
>  
> -	  If built with uClibc, then UCLIBC_SUPPORT_AI_ADDRCONFIG is
> -	  needed in uClibc configuration.
> -
>  	  http://github.com/troglobit/mrouted

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
