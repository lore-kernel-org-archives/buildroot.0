From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 12:19:01 +0200
Subject: [Buildroot] [PATCH 1/2] smack: new package.
In-Reply-To: <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140421121901.743513ef@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 20 Apr 2014 20:54:03 +0200, Eric Le Bihan wrote:

> diff --git a/package/smack/Config.in b/package/smack/Config.in
> new file mode 100644
> index 0000000..971b79a
> --- /dev/null
> +++ b/package/smack/Config.in
> @@ -0,0 +1,28 @@
> +config BR2_PACKAGE_SMACK
> +	bool "smack"

Dependency on !BR2_PREFER_STATIC_LIB was missing, due to <dlfcn.h>
usage. Remember to build test your packages with
http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-linux-uclibc.config
(to test !MMU) and
http://autobuild.buildroot.org/toolchains/configs/free-electrons/bfin-uclinux.config
(to test !MMU and BR2_PREFER_STATIC_LIB).


> +SMACK_VERSION = 1.0.4
> +SMACK_SITE = $(call github,smack-team,smack,v$(SMACK_VERSION))
> +SMACK_LICENSE = LGPLv2.1+

License is actually LGPLv2.1, according to comment headers in the
source code.

> +SMACK_LICENSE_FILES = COPYING
> +SMACK_INSTALL_STAGING = YES
> +SMACK_AUTORECONF = YES

Dependency on host-pkgconf was missing, the configure.ac script uses
PKG_CHECK_MODULES.

Applied with those changes,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
