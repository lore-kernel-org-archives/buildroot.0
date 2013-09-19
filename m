From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 21:02:17 +0200
Subject: [Buildroot] [PATCH v2] iputils: new package
In-Reply-To: <1379603872-25903-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Thu, 19 Sep 2013 10:17:52 -0500")
References: <1379603872-25903-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87six0fxdy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 Matt> Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
 Matt> ---
 Matt> Changes v1 -> v2:
 Matt>   * Updated depends in Config.in and added comment
 Matt>     (Suggested by Thomas/Arnout)
 Matt>   * Adjusted version to include "s" as part of version
 Matt>     (Suggested by Arnout)
 Matt>   * Removed dependency on file capabilities (libcap)
 Matt>     and sysfs.  Commented that file capabilities is disabled
 Matt>   * Cleaned up CFLAGS to have minimal complexity
 Matt>     (Suggested by Arnout)

 Matt>  package/Config.in          |    1 +
 Matt>  package/iputils/Config.in  |    8 ++++++
 Matt>  package/iputils/iputils.mk |   53 ++++++++++++++++++++++++++++++++++++++++++++
 Matt>  3 files changed, 62 insertions(+), 0 deletions(-)
 Matt>  create mode 100644 package/iputils/Config.in
 Matt>  create mode 100644 package/iputils/iputils.mk

 Matt> diff --git a/package/iputils/Config.in b/package/iputils/Config.in
 Matt> new file mode 100644
 Matt> index 0000000..0c77b5f
 Matt> --- /dev/null
 Matt> +++ b/package/iputils/Config.in
 Matt> @@ -0,0 +1,9 @@
 Matt> +config BR2_PACKAGE_IPUTILS
 Matt> +	bool "iputils"
 Matt> +	select BR2_OPENSSL if BR2_INET_IPV6
 Matt> +	help
 Matt> +	  This package is set of small useful utilities for Linux networking.
 Matt> +	  It includes complete versions of ping, traceroute, etc.
 Matt> +
 Matt> +	  http://sourceforge.net/projects/iputils/

Something apparently corrupted the patch on the way, as you only have 8
lines here. Did you edit the patch by hand afterwards?

 Matt> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
 Matt> new file mode 100644
 Matt> index 0000000..5836430
 Matt> --- /dev/null
 Matt> +++ b/package/iputils/iputils.mk
 Matt> @@ -0,0 +1,53 @@
 Matt> +################################################################################
 Matt> +#
 Matt> +# iputils
 Matt> +#
 Matt> +################################################################################
 Matt> +
 Matt> +IPUTILS_VERSION = s20121011
 Matt> +IPUTILS_SITE = http://www.skbuff.net/iputils/
 Matt> +IPUTILS_SOURCE = iputils-$(IPUTILS_VERSION).tar.bz2
 Matt> +IPUTILS_LICENSE = GPLv2+ BSD-3c
 Matt> +# Only included a license file for BSD.
 Matt> +IPUTILS_LICENSE_FILES = COPYING

There's no COPYING. I assume you meant ninfod/COPYING?

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
