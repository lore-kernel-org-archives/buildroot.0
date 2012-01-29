From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Jan 2012 23:22:45 +0100
Subject: [Buildroot] [PATCH 14/14] libedbus: Add new package
In-Reply-To: <CAFbHwiTEaezGnZBkvvfH_gMODERa=FAhXZqyjZ80bf02YF4+iw@mail.gmail.com>
 (Will Newton's message of "Thu, 26 Jan 2012 17:42:59 +0000")
References: <CAFbHwiTEaezGnZBkvvfH_gMODERa=FAhXZqyjZ80bf02YF4+iw@mail.gmail.com>
Message-ID: <8762fui1xm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed with minor tweaks, thanks.

 Will> new file mode 100644
 Will> index 0000000..27993f0
 Will> --- /dev/null
 Will> +++ b/package/efl/libedbus/Config.in
 Will> @@ -0,0 +1,10 @@
 Will> +config BR2_PACKAGE_LIBEDBUS
 Will> +	bool "libedbus"
 Will> +	select BR2_PACKAGE_LIBEINA
 Will> +	select BR2_PACKAGE_LIBECORE
 Will> +	select BR2_PACKAGE_DBUS
 Will> +	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_LIBXML2

I prefer to just do depends on BR2_PACKAGE_DBUS (atleast until Arnout's
patches are merged).

 Will> +	help
 Will> +	  E_Dbus is a set of wrappers around D-Bus APIs so they can be
 Will> +	  easily used by EFL applications, automatically providing
 Will> +	  Ecore/main loop integration, as well as Eina data types.

You forgot upstream URL.

 Will> diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
 Will> new file mode 100644
 Will> index 0000000..fe883e0
 Will> --- /dev/null
 Will> +++ b/package/efl/libedbus/libedbus.mk
 Will> @@ -0,0 +1,15 @@
 Will> +#############################################################
 Will> +#
 Will> +# libedbus
 Will> +#
 Will> +#############################################################
 Will> +
 Will> +LIBEDBUS_VERSION = 1.1.0
 Will> +LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
 Will> +LIBEDBUS_SITE = http://download.enlightenment.org/releases/
 Will> +LIBEDBUS_AUTORECONF = YES

You are not patching any autotools files, so no need for AUTORECONF.


-- 
Bye, Peter Korsgaard
