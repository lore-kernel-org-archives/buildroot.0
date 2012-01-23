From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jan 2012 23:51:34 +0100
Subject: [Buildroot] [PATCH 14/14] libedbus: Add new package
In-Reply-To: <CAFbHwiRMV41vA3FUVdekg6H123c-yyUV7n5qQQHObJ-yw0Qc=g@mail.gmail.com>
References: <CAFbHwiRMV41vA3FUVdekg6H123c-yyUV7n5qQQHObJ-yw0Qc=g@mail.gmail.com>
Message-ID: <201201232351.35126.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 January 2012 17:36:27 Will Newton wrote:
> Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> diff --git a/package/efl/libedbus/Config.in b/package/efl/libedbus/Config.in
> new file mode 100644
> index 0000000..71e3b50
> --- /dev/null
> +++ b/package/efl/libedbus/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_LIBEDBUS
> +	bool "libedbus"
> +	select BR2_PACKAGE_LIBEINA
> +	select BR2_PACKAGE_DBUS
 DBUS depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
so you have to repeat that here.

 BTW, it's advisable to compile-test your patches against a minimal
uclibc-based 32-bit and 64-bit cross-toolchain.  That helps detecting
dependencies on USE_WCHAR and USE_LARGEFILE.

> +	help
> +	  E_Dbus is a set of wrappers around DBus APIs by third party, so
 I believe the official name is D-Bus.

> +	  they can be easily used by EFL applications, automatically
> +	  providing Ecore/main loop integration, as well as Eina data types.
> diff --git a/package/efl/libedbus/libedbus.mk b/package/efl/libedbus/libedbus.mk
> new file mode 100644
> index 0000000..e2ac836
> --- /dev/null
> +++ b/package/efl/libedbus/libedbus.mk
> @@ -0,0 +1,16 @@
> +#############################################################
> +#
> +# libedbus
> +#
> +#############################################################
> +
> +LIBEDBUS_VERSION = 1.1.0
> +LIBEDBUS_SOURCE = e_dbus-$(LIBEDBUS_VERSION).tar.bz2
> +LIBEDBUS_SITE = http://download.enlightenment.org/releases/
> +LIBEDBUS_AUTORECONF = YES
> +LIBEDBUS_LIBTOOL_PATCH = YES
 Libtool patching is enabled by default.

> +LIBEDBUS_INSTALL_STAGING = YES
> +
> +LIBEDBUS_DEPENDENCIES = host-pkg-config dbus libeina
> +
> +$(eval $(call AUTOTARGETS))

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
