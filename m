From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 20:06:46 +0100
Subject: [Buildroot] [PATCH 08/14] libembryo: Add new package
In-Reply-To: <CAFbHwiR9H13mYhAGhaWvDHFTnAytWaTsqaKeV0uEPL=pcEYDKg@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:39 +0000")
References: <CAFbHwiR9H13mYhAGhaWvDHFTnAytWaTsqaKeV0uEPL=pcEYDKg@mail.gmail.com>
Message-ID: <87zkd6ib09.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweaks, thanks.

 Will> ---
 Will>  package/efl/Config.in              |    1 +
 Will>  package/efl/libembryo/Config.in    |    7 +++++++
 Will>  package/efl/libembryo/libembryo.mk |   16 ++++++++++++++++
 Will>  3 files changed, 24 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/efl/libembryo/Config.in
 Will>  create mode 100644 package/efl/libembryo/libembryo.mk

 Will> diff --git a/package/efl/Config.in b/package/efl/Config.in
 Will> index 3007783..0e27dab 100644
 Will> --- a/package/efl/Config.in
 Will> +++ b/package/efl/Config.in
 Will> @@ -12,6 +12,7 @@ source "package/efl/libeina/Config.in"
 Will>  source "package/efl/libecore/Config.in"
 Will>  source "package/efl/libeet/Config.in"
 Will>  source "package/efl/libevas/Config.in"
 Will> +source "package/efl/libembryo/Config.in"

 Will>  endif # BR2_PACKAGE_EFL

 Will> diff --git a/package/efl/libembryo/Config.in b/package/efl/libembryo/Config.in
 Will> new file mode 100644
 Will> index 0000000..aae3eed
 Will> --- /dev/null
 Will> +++ b/package/efl/libembryo/Config.in
 Will> @@ -0,0 +1,7 @@
 Will> +config BR2_PACKAGE_LIBEMBRYO
 Will> +	bool "libembryo"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	help
 Will> +	  Embryo is primarily a shared library that gives you an API
 Will> +	  to load and control interpreted programs compiled into an
 Will> +	  abstract machine bytecode that it understands.

Forgot upstream URL.

 Will> diff --git a/package/efl/libembryo/libembryo.mk
 Will> b/package/efl/libembryo/libembryo.mk
 Will> new file mode 100644
 Will> index 0000000..ab9bdf5
 Will> --- /dev/null
 Will> +++ b/package/efl/libembryo/libembryo.mk
 Will> @@ -0,0 +1,16 @@
 Will> +#############################################################
 Will> +#
 Will> +# libembryo
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBEMBRYO_VERSION = 1.1.0
 Will> +LIBEMBRYO_SOURCE = embryo-$(LIBEMBRYO_VERSION).tar.bz2
 Will> +LIBEMBRYO_SITE = http://download.enlightenment.org/releases/
 Will> +LIBEMBRYO_INSTALL_STAGING = YES
 Will> +LIBEMBRYO_INSTALL_TARGET = YES

_INSTALL_TARGET defaults to YES.

 Will> +
 Will> +LIBEMBRYO_DEPENDENCIES = host-pkg-config libeina
 Will> +
 Will> +$(eval $(call AUTOTARGETS))
 Will> +$(eval $(call AUTOTARGETS,host))
 Will> -- 
 Will> 1.7.1

 Will> _______________________________________________
 Will> buildroot mailing list
 Will> buildroot at busybox.net
 Will> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
