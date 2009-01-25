From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 26 Jan 2009 00:31:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
In-Reply-To: <87pribdrt4.fsf@macbook.be.48ers.dk>
References: <20090125205531.E8C1C76D28@busybox.osuosl.org>
	<87pribdrt4.fsf@macbook.be.48ers.dk>
Message-ID: <1232926285.2298.54.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 22:00 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-25 20:55:31 +0000 (Sun, 25 Jan 2009)
>  ulf> New Revision: 25021
> 
>  ulf> Log:
>  ulf> Stop dbus continuos rebuild, fix deps
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/dbus/dbus.mk
> 
> 
>  ulf> Changeset:
>  ulf> Modified: trunk/buildroot/package/dbus/dbus.mk
>  ulf> ===================================================================
>  ulf> --- trunk/buildroot/package/dbus/dbus.mk	2009-01-25 20:53:43 UTC (rev 25020)
>  ulf> +++ trunk/buildroot/package/dbus/dbus.mk	2009-01-25 20:55:31 UTC (rev 25021)
>  ulf> @@ -15,14 +15,17 @@
>  ulf>  DBUS_XML:=expat
>  ulf>  # depend on the exact library file instead of expat so dbus isn't always
>  ulf>  # considered out-of-date
>  ulf> -DBUS_XML_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
>  ulf> +DBUS_XML_DEP_LIB:=$(STAGING_DIR)/usr/lib/libexpat.so.1
>  ulf>  else
>  ulf>  DBUS_XML:=libxml
>  ulf>  # Makefile.autotools.in unfortunately has broken dependency handling,
>  ulf>  # so we cannot do the same for libxml2
>  ulf> -DBUS_XML_DEP:=libxml2-install-staging
>  ulf> +DBUS_XML_DEP_LIB:=$(LIBXML2_HOOK_POST_INSTALL)
>  ulf> +#libxml2-install-staging
>  ulf>  endif
>  
>  ulf> +DBUS_XML_DEP:=$(DBUS_XML_DEP_LIB)
> 
> Why the dance with DBUS_XML_DEP_LIB ?
> 
> Is all of this actually needed? As the toplevel Makefile run
> sequentially it seems to me that it would be enough to just add expat
> / libxml2 to the dbus: line.

Feel free to optimize and test.

BR
Ulf Samuelsson
