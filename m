From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sun, 8 Jul 2007 15:15:43 +0200
Subject: [Buildroot] dbus: wrong place to lookup libexpat.so
In-Reply-To: <0707081450570.3987@somehost>
References: <0707081411270.26961@somehost> <20070708122308.GI4096@aon.at>
	<0707081450570.3987@somehost>
Message-ID: <20070708131542.GM4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 08, 2007 at 02:55:12PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Sun, 8 Jul 2007, Bernhard Fischer wrote:
>
>> On Sun, Jul 08, 2007 at 02:12:53PM +0200, Cristian Ionescu-Idbohrn wrote:
>> >Index: dbus.mk
>> >===================================================================
>> >--- dbus.mk	(revision 19026)
>> >+++ dbus.mk	(working copy)
>> >@@ -51,7 +51,7 @@
>> > 	touch  $(DBUS_DIR)/.configured
>> >
>> > $(DBUS_DIR)/$(DBUS_BINARY): $(DBUS_DIR)/.configured
>> >-	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/lib/libexpat.so" -C $(DBUS_DIR) all
>> >+	$(MAKE) DBUS_BUS_LIBS="$(STAGING_DIR)/usr/lib/libexpat.so" -C $(DBUS_DIR) all
>> >
>> > $(STAGING_DIR)/usr/lib/libdbus-1.so: $(DBUS_DIR)/$(DBUS_BINARY)
>> > 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DBUS_DIR)/dbus install
>>
>> ok, but can you try the attached patch instead, please?
>
>rm: cannot remove
>`/data/cii/buildroot/buildroot/build_i486/root/usr/lib/dbus-1.0':
>Is a directory
>
>The attached works better.

merged as r19036. Thanks!
