From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 17 Jan 2011 14:29:21 +0100
Subject: [Buildroot] [PATCH 2/2] socat: enable TERMIOS
In-Reply-To: <y>
References: <y>
Message-ID: <1295270961-20268-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Enable TERMIOS handling in socat, so that such options as echo, raw etc.
could be used for serial connections.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/socat/socat.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 1687f3c..acf23a7 100644
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
-- 
1.7.1.1
