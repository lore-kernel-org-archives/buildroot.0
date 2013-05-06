From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 May 2013 19:20:44 +0200
Subject: [Buildroot] [PATCH] chrony: new package
In-Reply-To: <1367856775-4502-1-git-send-email-ntl@pobox.com>
References: <1367856775-4502-1-git-send-email-ntl@pobox.com>
Message-ID: <20130506192044.398293f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathan Lynch,

Thanks, this looks almost good. A few comments below.

On Mon,  6 May 2013 11:12:55 -0500, Nathan Lynch wrote:

> diff --git a/package/chrony/Config.in b/package/chrony/Config.in
> new file mode 100644
> index 0000000..a42bd77
> --- /dev/null
> +++ b/package/chrony/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_CHRONY
> +	bool "chrony"
> +	help
> +	  Chrony is a pair of programs which are used to maintain the
> +	  accuracy of the system clock.

We generally want a empty new line here, and then the upstream URL of
the project.

Also, did you check that this program indeed builds with a minimal
uClibc toolchain (no thread, no wchar, no locale, no nothing) ?


> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> new file mode 100644
> index 0000000..b9733f9
> --- /dev/null
> +++ b/package/chrony/chrony.mk
> @@ -0,0 +1,6 @@

We generally like to have our nice header here, like in all other
packages:

#############################################################
#
# bind
#
#############################################################

> +CHRONY_VERSION = 1.27
> +CHRONY_SITE = http://download.tuxfamily.org/chrony/
> +CHRONY_LICENSE = GPLv2
> +CHRONY_LICENSE_FILES = COPYING
> +
> +$(eval $(autotools-package))

Looks good.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
