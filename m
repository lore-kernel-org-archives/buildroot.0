From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 21:10:27 +0200
Subject: [Buildroot] [PATCH] New package liblog4c-localtime
In-Reply-To: <1349948066-12255-1-git-send-email-fenixk19@mail.ru> (Alexander
 Varnin's message of "Thu, 11 Oct 2012 13:34:26 +0400")
References: <1349948066-12255-1-git-send-email-fenixk19@mail.ru>
Message-ID: <87a9vftzdo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Varnin <fenixk19@mail.ru> writes:

 Alexander> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>

Thanks, committed with minor fixes (see below).

 Alexander> +++ b/package/liblog4c-localtime/Config.in
 Alexander> @@ -0,0 +1,10 @@
 Alexander> +config BR2_PACKAGE_LIBLOG4C_LOCALTIME
 Alexander> +	bool "liblog4c-localtime"

You forgot to select BR2_PACKAGE_EXPAT.

 Alexander> +	help
 Alexander> +	  Log4c is a library of C for flexible logging to files, syslog 

Please no trailing spaces.

 Alexander> +	  and other destinations.
 Alexander> +	  This version is with localtime patch, to make lib show times in
 Alexander> +	  local timezone.
 Alexander> +
 Alexander> +	  https://github.com/rcmadruga/log4c-localtime
 Alexander> +          http://log4c.sourceforge.net/

This should be indented with <tab><space><space> like the rest.

 Alexander> diff --git a/package/liblog4c-localtime/liblog4c-localtime.mk b/package/liblog4c-localtime/liblog4c-localtime.mk
 Alexander> new file mode 100644
 Alexander> index 0000000..0aedec8
 Alexander> --- /dev/null
 Alexander> +++ b/package/liblog4c-localtime/liblog4c-localtime.mk
 Alexander> @@ -0,0 +1,18 @@
 Alexander> + #############################################################
 Alexander> + #
 Alexander> + # liblog4c
 Alexander> + #
 Alexander> + #############################################################
 Alexander> + LIBLOG4C_LOCALTIME_VERSION = 1.0
 Alexander> + LIBLOG4C_LOCALTIME_SITE    = https://github.com/rcmadruga/log4c-localtime/tarball/v$(LIBLOG4C_LOCALTIME_VERSION) 

Please no trailing spaces.

 Alexander> + LIBLOG4C_LOCALTIME_INSTALL_STAGING = YES
 Alexander> + LIBLOG4C_LOCALTIME_CONF_OPT = --disable-expattest
 Alexander> + LIBLOG4C_LOCALTIME_DEPENDENCIES = expat
 Alexander> +
 Alexander> + define LIBLOG4C_LOCALTIME_HOOK
 Alexander> +   chmod +x $(@D)/configure
 Alexander> + endef
 Alexander> +
 Alexander> + LIBLOG4C_LOCALTIME_PRE_CONFIGURE_HOOKS += LIBLOG4C_LOCALTIME_HOOK

Please don't indent this. I renamed this hook to
LIBLOG4C_LOCALTIME_FIX_CONFIGURE_PERMS to make it clear what it does.


-- 
Bye, Peter Korsgaard
