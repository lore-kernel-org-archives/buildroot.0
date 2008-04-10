From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 05:14:26 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/ncurses
In-Reply-To: <20080409223551.GC4582@cloud.net.au>
References: <20080409113849.004993C4BA@busybox.net>
	<20080409223551.GC4582@cloud.net.au>
Message-ID: <1207804466.6817.395.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> >  
> > +config BR2_PACKAGE_NCURSES_TARGET_PANEL
> > +	bool "ncurses libpanel in target"
> > +	default n
> > +	depends on BR2_PACKAGE_NCURSES
> > +	help
> > +	  Ncurses headers in target
>           ^^^^^^^^^^^^^^^^^^^^^^^^^
> > +	  Includes ncurses dynamic libpanel in target
> 
> This looks like a copy/paste error.

Fixed

> 
> > + 
> > +config BR2_PACKAGE_NCURSES_TARGET_FORM
> > +	bool "ncurses libform in target"
> > +	default n
> > +	depends on BR2_PACKAGE_NCURSES
> > +	help
> > +	  Includes ncurses dynamic libform in target
> > + 
> > +config BR2_PACKAGE_NCURSES_TARGET_MENU
> > +        bool "ncurses libmenu in target"
> > +        default n
> > +        depends on BR2_PACKAGE_NCURSES
> > +        help
> > + 	  Includes ncurses dynamic libmenu in target
> 
> Weird tab/spaces mix here.

Fixed

> 
> >  $(TARGET_DIR)/lib/libncurses.so.$(NCURSES_VERSION): $(STAGING_DIR)/lib/libncurses.so.$(NCURSES_VERSION)
> >  	cp -dpf $(NCURSES_DIR)/lib/libncurses.so* $(TARGET_DIR)/lib/
> > +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_PANEL)),y)
> > +	cp -dpf $(NCURSES_DIR)/lib/libpanel.so* $(TARGET_DIR)/lib/
> > +endif
> > +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_FORM)),y)
> > +	cp -dpf $(NCURSES_DIR)/lib/libform.so* $(TARGET_DIR)/lib/
> > +endif
> > +ifeq ($(strip $(BR2_PACKAGE_NCURSES_TARGET_MENU)),y)
> > +	cp -dpf $(NCURSES_DIR)/lib/libmenu.so* $(TARGET_DIR)/lib/
> > +endif
> 
> Should be /usr/lib rather than /lib?

The rest of the libs are being installed to /lib ... I don't like
changing install paths, but I agree with you it should be /usr/lib ...
anyone got any very good reason why ncurses should be installed in /lib?

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/71bdb923/attachment.pgp 
