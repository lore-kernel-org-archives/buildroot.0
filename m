From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Oct 2008 16:31:50 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/zlib
In-Reply-To: <20081031121011.6D91B3C7FE@busybox.net>
References: <20081031121011.6D91B3C7FE@busybox.net>
Message-ID: <20081031163150.304d9a3a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 31 Oct 2008 05:10:11 -0700 (PDT),
correa at uclibc.org a ?crit :

>  $(STAGING_DIR)/usr/lib/libz.so: $(ZLIB_DIR)/libz.so
> -	cp -dpf $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/
> -	cp -dpf $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/
> -	cp -dpf $(ZLIB_DIR)/zconf.h $(STAGING_DIR)/usr/include/
> -	cp -dpf $(ZLIB_DIR)/libz.so* $(STAGING_DIR)/usr/lib/
> +	$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/

This doesn't work: even with the -D option, it doesn't create the
intermediate directories. It should be:

$(INSTALL) -D $(ZLIB_DIR)/libz.a $(STAGING_DIR)/usr/lib/libz.a

> +	$(INSTALL) -D $(ZLIB_DIR)/zlib.h $(STAGING_DIR)/usr/include/

Same thing here.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
