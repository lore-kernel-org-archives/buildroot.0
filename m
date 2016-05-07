From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 22:31:12 +0200
Subject: [Buildroot] [PATCH 21/34] hddtemp: add
In-Reply-To: <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507223112.6b0d7c73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:17 +0200, Gilles Chanteperdrix wrote:
> ---
>  package/Config.in            |  1 +
>  package/hddtemp/Config.in    |  8 ++++++++
>  package/hddtemp/hddtemp.hash |  2 ++
>  package/hddtemp/hddtemp.mk   | 19 +++++++++++++++++++
>  4 files changed, 30 insertions(+)
>  create mode 100644 package/hddtemp/Config.in
>  create mode 100644 package/hddtemp/hddtemp.hash
>  create mode 100644 package/hddtemp/hddtemp.mk

Generally looks good. As usual your SoB line is missing, so we can't
apply for the moment. Some more comments below.

> diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
> new file mode 100644
> index 0000000..0d28250
> --- /dev/null
> +++ b/package/hddtemp/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HDDTEMP
> +	bool "hddtemp"

Really no toolchain dependencies? Not using fork() ? Not using
threads ?

> +++ b/package/hddtemp/hddtemp.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# hddtemp
> +#
> +################################################################################
> +
> +HDDTEMP_VERSION = 0.3-beta15
> +HDDTEMP_SOURCE = hddtemp-$(HDDTEMP_VERSION).tar.bz2
> +HDDTEMP_SITE = http://download.savannah.gnu.org/releases/hddtemp
> +HDDTEMP_LICENSE = GPLv2
> +HDDTEMP_LICENSE_FILES = GPL-2
> +
> +define HDDTEMP_REMOVE_MAN
> +	rm -rf $(TARGET_DIR)/usr/man
> +endef

This is not needed usr/man is removed from $(TARGET_DIR) at the end of
the build. See the target-finalize make target in the main Buildroot
Makefile.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
