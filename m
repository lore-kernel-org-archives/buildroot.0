From: Ormund Williams <ormundw@panix.com>
Date: Sat, 30 Aug 2008 12:42:22 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib2
In-Reply-To: <20080826223727.C982F3C7AE@busybox.net>
References: <20080826223727.C982F3C7AE@busybox.net>
Message-ID: <1220114542.3307.209.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2008-08-26 at 15:37 -0700, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-08-26 15:37:27 -0700 (Tue, 26 Aug 2008)
> New Revision: 23228
> 
> Log:
> libglib2: select libiconv
> 
> Modified:
>    trunk/buildroot/package/libglib2/Config.in
>    trunk/buildroot/package/libglib2/libglib2.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/libglib2/Config.in
> ===================================================================
> --- trunk/buildroot/package/libglib2/Config.in	2008-08-26 22:37:23 UTC (rev 23227)
> +++ trunk/buildroot/package/libglib2/Config.in	2008-08-26 22:37:27 UTC (rev 23228)
> @@ -3,6 +3,7 @@
>  	select BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_GETTEXT
>  	select BR2_PACKAGE_LIBINTL
> +	select BR2_PACKAGE_LIBICONV
>  	select BR2_PACKAGE_PKGCONFIG
>  	help
>  	  Low-level core library that forms the basis of GTK+ and GNOME.
> 
> Modified: trunk/buildroot/package/libglib2/libglib2.mk
> ===================================================================
> --- trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:23 UTC (rev 23227)
> +++ trunk/buildroot/package/libglib2/libglib2.mk	2008-08-26 22:37:27 UTC (rev 23228)
> @@ -53,6 +53,6 @@
>  		--infodir=/usr/info --enable-shared \
>  		--enable-static $(DISABLE_NLS)
>  
> -LIBGLIB2_DEPENDENCIES = uclibc gettext libintl pkgconfig
> +LIBGLIB2_DEPENDENCIES = uclibc gettext libintl libiconv pkgconfig
>  
>  $(eval $(call AUTOTARGETS,package,libglib2))
> 
I'm having a problem with this commit, glib2 fails to build with this
error:

gconvert.c:51:2: error: #error GNU libiconv not in use but included iconv.h is from libiconv
make[5]: *** [gconvert.lo] Error 1

__
Ormund
