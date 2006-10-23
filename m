From: Javier Ruere <javierruere@apexar.com>
Date: Mon, 23 Oct 2006 11:15:19 -0300
Subject: [Buildroot] tinyx.mk question
Message-ID: <200610231115.19527.javierruere@apexar.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,
	While trying to compile TinyX with Xinput (still working on it) I've seen in 
tinyx.mk the following:
----------------------------------------------------------------------------------------
#
# Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
# and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
$(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
	mkdir -p $(STAGING_DIR)/usr/X11R6/lib
	mkdir -p $(STAGING_DIR)/usr/X11R6/include
	cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
	cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
	ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
----------------------------------------------------------------------------------------

	What is the purpose of the last line? It doesn't seem right but I couldn't 
find any related issues.

Javier
