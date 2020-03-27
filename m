From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:09:43 +0100
Subject: [Buildroot] [PATCH v3 2/2] package/libapparmor-utils: new
 package
In-Reply-To: <20200326225641.15536-2-angelo@amarulasolutions.com>
References: <20200326225641.15536-1-angelo@amarulasolutions.com>
 <20200326225641.15536-2-angelo@amarulasolutions.com>
Message-ID: <20200327100943.688ea008@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Thu, 26 Mar 2020 23:56:41 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> diff --git a/package/libapparmor-utils/libapparmor-utils.mk b/package/libapparmor-utils/libapparmor-utils.mk
> new file mode 100644
> index 0000000000..3b2b47be07
> --- /dev/null
> +++ b/package/libapparmor-utils/libapparmor-utils.mk
> @@ -0,0 +1,65 @@
> +################################################################################
> +#
> +# libapparmor-utils
> +#
> +################################################################################
> +
> +LIBAPPARMOR_UTILS_BASE_VERSION = 2.13
> +LIBAPPARMOR_UTILS_VERSION = $(LIBAPPARMOR_UTILS_BASE_VERSION).3
> +LIBAPPARMOR_UTILS_SOURCE = apparmor-$(LIBAPPARMOR_UTILS_VERSION).tar.gz

This is using the same source code as the libapparmor package, so
unless there is a very solid reason for having a separate package (and
it should be explained in the commit log), we prefer in Buildroot to
have one package for one upstream project, so this logic should go into
package/libapparmor/.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
