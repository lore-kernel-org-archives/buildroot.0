From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 10 Jan 2011 10:40:34 +0100
Subject: [Buildroot] [PATCH] socat: enable TERMIOS
Message-ID: <4D2AD412.7080204@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable TERMIOS handling in socat, so that such options as echo, raw etc.
could be used for serial connections.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 2b53d88..b071c75 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -66,7 +66,6 @@ $(SOCAT_WORKDIR)/Makefile: $(SOCAT_DIR)/.unpacked
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--disable-termios \
 		$(DISABLE_NLS); \
 	$(SED) 's/#define HAVE_TERMIOS_ISPEED 1/#undef HAVE_TERMIOS_ISPEED/g' config.h; \
 	)
