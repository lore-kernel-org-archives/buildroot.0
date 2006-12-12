From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 22:22:27 +0100
Subject: [Buildroot] [PATCH] Add libraw1394 to buildroot
In-Reply-To: <20061212183109.GA1480@tuxedo.home.lan>
References: <20061212163513.GA1105@tuxedo.home.lan>
	<20061212165932.GA32047@aon.at>
	<20061212183109.GA1480@tuxedo.home.lan>
Message-ID: <20061212212227.GF4442@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 12, 2006 at 07:31:09PM +0100, Lars Munch wrote:
>On Tue, Dec 12, 2006 at 05:59:32PM +0100, Bernhard Fischer wrote:
>> On Tue, Dec 12, 2006 at 05:35:14PM +0100, Lars Munch wrote:
>> >Hi all
>> >
>> >The attached patch adds libraw1394-1.2.1 to buildroot. libraw1394 is a
>> >library for direct access to IEEE 1394 bus.

>> >+$(STAGING_DIR)/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
>> >+	make -C $(LIBRAW1394_DIR)/src install
>> >+
>> >+$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/lib/libraw1394.so
>> >+	cp -dpf $(STAGING_DIR)/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
>> >+
>> >+libraw1394: uclibc $(TARGET_DIR)/usr/lib/libraw1394.so
>> >+
>> >+libraw1394-source: $(DL_DIR)/$(LIBRAW1394_SOURCE)
>> >+
>> >+libraw1394-clean:
>> >+	rm $(TARGET_DIR)/usr/lib/libraw1394.so*
>> >+	-$(MAKE) -C $(LIBRAW1394_DIR) clean
>> 
>> Can we please settle on the convention that
>> foo-clean uninstalls itself from the target-dir?
>
>I am not sure what you mean. It already removes itself from the target-dir?

You're right since you IIRC install into the staging dir and just cp the *.so
for the target. Sorry for my sloppy reading.

That may raise the question if and iff then how we want to allow for
installing .a into the target to ease e.g. debugging. Generally nothing i
want to worry for now, though. :)

Please refresh (the CC_FOR_BUILD) and resend.
TIA and cheers,
Bernhard
