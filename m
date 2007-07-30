From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 11:52:55 +0200
Subject: [Buildroot] unpopular whitespace in makefile
In-Reply-To: <0707282137590.8510@somehost>
References: <0707282137590.8510@somehost>
Message-ID: <20070730095255.GG23273@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 28, 2007 at 09:39:36PM +0200, Cristian Ionescu-Idbohrn wrote:
>Cheers,
>
>-- 
>Cristian
>Index: package/libid3tag/libid3tag.mk
>===================================================================
>--- package/libid3tag/libid3tag.mk	(revision 19307)
>+++ package/libid3tag/libid3tag.mk	(working copy)
>@@ -36,7 +36,7 @@
> 	touch $@
> 
> $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN): $(LIBID3TAG_DIR)/.configured
>-       $(MAKE) -C $(LIBID3TAG_DIR)
>+	$(MAKE) -C $(LIBID3TAG_DIR)
> 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBID3TAG_DIR) install
> 
> $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN): $(LIBID3TAG_DIR)/src/.libs/$(LIBID3TAG_BIN)
>@@ -44,8 +44,8 @@
> 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" $(STAGING_DIR)/usr/lib/libid3tag.la
> 
> $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN): $(STAGING_DIR)/$(LIBID3TAG_TARGET_BIN)
>-       cp -dpf  $(STAGING_DIR)/usr/lib/libid3tag.so*  $(TARGET_DIR)/usr/lib/
>-       -$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
>+	cp -dpf $(STAGING_DIR)/usr/lib/libid3tag.so* $(TARGET_DIR)/usr/lib/
>+	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libid3tag.so*
> 
> libid3tag: uclibc libmad $(TARGET_DIR)/$(LIBID3TAG_TARGET_BIN)

Looks like this was already committed but not ACKed on the list.

Thanks for the patch, Christian.
