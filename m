From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 11 Dec 2019 23:31:56 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure due to
 missing host getopt
In-Reply-To: <20191210122431.122066-1-giulio.benetti@benettiengineering.com>
References: <20191210122431.122066-1-giulio.benetti@benettiengineering.com>
Message-ID: <58b985f5-ca9d-8c22-44e1-0754890e61b8@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/10/19 1:24 PM, Giulio Benetti wrote:
> Add host-gengetopt to dependencies since this package require it to
> generate host install program(nsintall).
> 
> Fixes:
> http://autobuild.buildroot.net/results/16449ffc1a5036f020ba5bfea06a52b581b71473/

This patch doesn't work. I need to test on RHEL 7.4, the only place 
where it happens.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/libnss/libnss.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index ae49dbe1b2..a7fedaa2cd 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -9,7 +9,7 @@ LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
>   LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
>   LIBNSS_DISTDIR = dist
>   LIBNSS_INSTALL_STAGING = YES
> -LIBNSS_DEPENDENCIES = libnspr sqlite zlib
> +LIBNSS_DEPENDENCIES = libnspr sqlite zlib host-gengetopt
>   LIBNSS_LICENSE = MPL-2.0
>   LIBNSS_LICENSE_FILES = nss/COPYING
>   
> 
