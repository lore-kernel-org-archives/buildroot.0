From: David Brown <david@westcontrol.com>
Date: Tue, 06 Jan 2009 12:52:09 +0100
Subject: [Buildroot] liberation fonts fails to build
Message-ID: <gjvglj$np5$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



There seems to be a problem with the liberation fonts package - it won't 
build because there is no rule to make the 
"$(STAGING_DIR)/usr/share/fonts/.ttf" target.

A simple change to the liberation.mk makefile is all that is needed, as 
far as I can see.  I changed line 21 from:

$(STAGING_DIR)/usr/share/fonts/LiberationMono-Bold.ttf: \
	$(LIBERATION_DIR)/.unpacked

to

$(STAGING_DIR)/usr/share/fonts/.ttf: $(LIBERATION_DIR)

The fonts now appear to be installed correctly.

mvh.,

David Brown
Norway.
