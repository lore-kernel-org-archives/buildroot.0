From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 15:18:05 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
In-Reply-To: <20070723103336.GA7044@aon.at>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
Message-ID: <1185196685.21840.25.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>+$(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY): $(ALSA_LIB_DIR)/.configured
> >+	$(MAKE) -C $(ALSA_LIB_DIR)
> >+	@touch -c $@
> >+
> >+$(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY): $(ALSA_LIB_DIR)/src/.libs/$(ALSA_LIB_BINARY)
> >+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(ALSA_LIB_DIR) install
> >+	@touch -c $@
> >+
> >+$(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY): $(STAGING_DIR)/$(ALSA_LIB_TARGET_BINARY)
> >+	@mkdir -p $(TARGET_DIR)/usr/share/alsa
> >+	@mkdir -p $(TARGET_DIR)/usr/lib/alsa-lib
> >+	cp -dpf  $(STAGING_DIR)/lib/libasound.so*  $(TARGET_DIR)/usr/lib/
> >+	cp -rdpf $(STAGING_DIR)/usr/share/alsa/*   $(TARGET_DIR)/usr/share/alsa/
> >+	cp -rdpf $(STAGING_DIR)/usr/lib/alsa-lib/* $(TARGET_DIR)/usr/lib/alsa-lib/
> 
> install(1) would be cleaner, especially if you consider that it's a new
> package.

make install is done on the staging dir.
I think the reason for not doing make install on the target dir is
that it will add a lot of other stuff which is not wanted on an embedded
system.
It is a matter of taste if you "install and remove", or just copy
the *needed* stuff. 
Have to discuss with Someone Else(tm) if you insist.

> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
