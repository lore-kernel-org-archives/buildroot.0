From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 21 Aug 2007 16:15:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libdaemon
In-Reply-To: <20070821082316.GC14397@aon.at>
References: <20070821013237.256CCA470E@busybox.net>
	<20070821082316.GC14397@aon.at>
Message-ID: <1187705756.6145.8.camel@86-115-11-152>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > $(DL_DIR)/$(LIBDAEMON_SOURCE):
> >@@ -25,6 +26,10 @@
> > $(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
> > 	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
> > 	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
> >+	mkdir	-p $(PROJECT_BUILD_DIR)/patches
> >+	bzcat package/libdaemon/$(LIBDAEMON_NAME).patch.bz2 \
> 
> This will break on a variety of hosts. Use BR2_BZCAT instead (i.e.
> honour what the user told us).

Fixed in r19617.

It is a bit irritating to load the tarball with a lot of stuff
just because autotools versions differ in distribution.

What about generating host-autotools in STAGING_DIR?


-- 
Best Regards,
Ulf Samuelsson
