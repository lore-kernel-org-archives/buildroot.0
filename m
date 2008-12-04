From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 4 Dec 2008 07:33:30 +0100
Subject: [Buildroot] start compiling autoconf for the host as well (was:
 svn commit: trunk/buildroot/package/autoconf)
In-Reply-To: <20081203163422.225b9cca@surf>
References: <20081203133645.EBECF3C83E@busybox.net>
	<49368D09.6060703@atmel.com> <20081203163422.225b9cca@surf>
Message-ID: <20081204073330.44d50f1a@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 3 Dec 2008 16:34:22 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 03 Dec 2008 14:43:37 +0100,
> Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> a ?crit :
> 
> > > Fix comment about autoconf configuration/compilation/installation
> > > for the target (and not the host).
> > > 
> > 
> > off-topic: perhaps we should consider building autoconf, libtools,
> > etc. which now quite heavily depend on when cross-compiling. I.e.
> > not all distributions ship 2.13 and 2.61. AFAIK Gentoo uses 2.63.
> 
> Hum, sorry, I'm not sure to get what you mean. We already build
> autoconf/automake/libtool for the host as soon as a package says
> FOOBAR_AUTORECONF=YES. Do you mean that we should always build them ?
> 

Wow, how's that for being blind...

Sounds great, does not seem like I can hook them off in the toolchain
menu? Do we still have packages which does not use
Makefile.autotools.in, but still uses autotools before ./configure?

A fast grep gives the following packages:
package/avahi/avahi.mk:	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
package/dbus-glib/dbus-glib.mk:	(cd $(DBUS_GLIB_DIR); rm -rf config.cache; autoconf; \
package/dropbear/dropbear.mk:		autoconf; \
package/gawk/gawk.mk:	(cd $(GAWK_DIR); rm -rf config.cache; autoconf; \
package/metacity/metacity.mk:	(cd $(METACITY_DIR); autoconf;)
package/netsnmp/netsnmp.mk:		autoconf && \
package/openmotif/openmotif.mk:		aclocal; automake --foreign --add-missing; autoconf; \
package/openmotif/openmotif.mk:		aclocal; automake --foreign --add-missing; autoconf; \
package/rxvt/rxvt.mk:	$(CONFIG_UPDATE) $(RXVT_DIR)/autoconf
package/x11r7/xapp_xman/xapp_xman.mk:		autoconf -I$(STAGING_DIR)/usr/share/aclocal && \
package/x11r7/xdata_xcursor-themes/xdata_xcursor-themes.mk: autoconf -I $(STAGING_DIR)/usr/share/aclocal && \
package/ruby/ruby.mk:	(cd $(RUBY_DIR); autoreconf)

-- 
Best regards,
Hans-Christian Egtvedt
