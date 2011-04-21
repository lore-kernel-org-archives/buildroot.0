From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Apr 2011 11:56:09 +0200
Subject: [Buildroot] [PATCH 1/2] New package: bwm-ng
In-Reply-To: <1303352967-6077-1-git-send-email-keguang.zhang@gmail.com>
	(keguang zhang's message of "Thu, 21 Apr 2011 10:29:27 +0800")
References: <1303352967-6077-1-git-send-email-keguang.zhang@gmail.com>
Message-ID: <87pqogyll2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "keguang" == keguang zhang <keguang.zhang@gmail.com> writes:

 keguang> From: Kelvin Cheung <keguang.zhang@gmail.com>
 keguang> Add new package: bwm-ng

 keguang> Bandwidth Monitor NG is a small and console-based live network and
 keguang> disk-io bandwidth monitor for Linux, BSD, Solaris, Mac OS X and others.

Thanks, committed with minor tweaks (see below)

 keguang> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
 keguang> ---
 keguang>  package/Config.in        |    1 +
 keguang>  package/bwm-ng/Config.in |    7 +++++++
 keguang>  package/bwm-ng/bwm-ng.mk |   16 ++++++++++++++++
 keguang>  3 files changed, 24 insertions(+), 0 deletions(-)
 keguang>  create mode 100644 package/bwm-ng/Config.in
 keguang>  create mode 100644 package/bwm-ng/bwm-ng.mk

 keguang> diff --git a/package/Config.in b/package/Config.in
 keguang> index 014c2c0..0db0cd6 100644
 keguang> --- a/package/Config.in
 keguang> +++ b/package/Config.in
 keguang> @@ -150,6 +150,7 @@ endmenu
 
 keguang>  menu "Hardware handling"
 keguang>  source "package/acpid/Config.in"
 keguang> +source "package/bwm-ng/Config.in"
 keguang>  source "package/cdrkit/Config.in"
 keguang>  source "package/cramfs/Config.in"
 keguang>  source "package/dbus/Config.in"
 keguang> diff --git a/package/bwm-ng/Config.in b/package/bwm-ng/Config.in
 keguang> new file mode 100644
 keguang> index 0000000..f2f8b12
 keguang> --- /dev/null
 keguang> +++ b/package/bwm-ng/Config.in
 keguang> @@ -0,0 +1,7 @@
 keguang> +config BR2_PACKAGE_BWM_NG
 keguang> +	bool "bwm-ng"
 keguang> +	help
 keguang> +	  Bandwidth Monitor NG is a small and console-based live network and
 keguang> +	  disk-io bandwidth monitor for Linux, BSD, Solaris, Mac OS X and others.

Lines too long. Config.in files shouldn't exceed 70 chars, so they
display properly in menuconfig on a std 80x24 term.

 keguang> +
 keguang> +	  http://sourceforge.net/projects/bwmng/
 keguang> diff --git a/package/bwm-ng/bwm-ng.mk b/package/bwm-ng/bwm-ng.mk
 keguang> new file mode 100644
 keguang> index 0000000..7fd5b38
 keguang> --- /dev/null
 keguang> +++ b/package/bwm-ng/bwm-ng.mk
 keguang> @@ -0,0 +1,16 @@
 keguang> +#############################################################
 keguang> +#
 keguang> +# bwm-ng
 keguang> +#
 keguang> +#############################################################
 keguang> +BWM_NG_VERSION:=0.6
 keguang> +BWM_NG:=bwm-ng-$(BWM_NG_VERSION).tar.gz

Unused.

 keguang> +BWM_NG_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/bwmng/bwmng/0.6/

It would be good to use BWM_BG_VERSION here as well.

You have a mix of ':=' and '='. We normally use '=' unless there's
special needs.

-- 
Bye, Peter Korsgaard
