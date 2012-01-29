From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 21:35:40 +0100
Subject: [Buildroot] [PATCH 09/14] libedje: Add new package
In-Reply-To: <CAFbHwiSrYJLtv+cB=PvRhevk7Kv5rqt0aShdYQ9_BrNUWciECw@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:42 +0000")
References: <CAFbHwiSrYJLtv+cB=PvRhevk7Kv5rqt0aShdYQ9_BrNUWciECw@mail.gmail.com>
Message-ID: <87vcnui6w3.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweaks, thanks.

 Will> +config BR2_PACKAGE_LIBEDJE
 Will> +	bool "libedje"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	select BR2_PACKAGE_LIBEET
 Will> +	select BR2_PACKAGE_LIBECORE
 Will> +	select BR2_PACKAGE_LIBECORE_EVAS
 Will> +	select BR2_PACKAGE_LIBEMBRYO
 Will> +	select BR2_PACKAGE_LIBEVAS
 Will> +	select BR2_PACKAGE_LUA
 Will> +	help
 Will> +	  A graphical layout and animation library for animated
 Will> +	  resizable, compressed and scalable themes.

Missing upstream URL.

 Will> +
 Will> +config BR2_PACKAGE_LIBEDJE_CC
 Will> +	bool "build edje_cc"
 Will> +	depends on BR2_PACKAGE_LIBEDJE
 Will> +	help
 Will> +	  Build and install the Edje compiler for the target. Normally this
 Will> +	  is not required.
 Will> diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
 Will> new file mode 100644
 Will> index 0000000..8d52f30
 Will> --- /dev/null
 Will> +++ b/package/efl/libedje/libedje.mk
 Will> @@ -0,0 +1,25 @@
 Will> +#############################################################
 Will> +#
 Will> +# libedje
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBEDJE_VERSION = 1.1.0
 Will> +LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 Will> +LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 Will> +LIBEDJE_INSTALL_STAGING = YES
 Will> +LIBEDJE_INSTALL_TARGET = YES

_INSTALL_TARGET defaults to YES.

-- 
Bye, Peter Korsgaard
