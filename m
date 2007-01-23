From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 24 Jan 2007 00:53:53 +0100
Subject: [Buildroot] [PATCH] Set CFLAGS = $(TARGET_CFLAGS) for many packages
Message-ID: <1169596433.5361.23.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you make Buildroot from scratch, CFLAGS gets set during the build,
but if you add packages later, then CFLAGS should be set in the
makefile fragment of the new package.

I believe that TARGET_CFLAGS needs to include the Linux Include
Directory or you will get compolie time errors.
Don't have a clean patch for that yet, but this is what I do:

TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)

should be changed to

TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) \
	-I$(TOOL_BUILD_DIR)/linux/include


Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: target_flags.patch
Type: text/x-patch
Size: 19474 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070124/0deebaf0/attachment-0001.bin 
