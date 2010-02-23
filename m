From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:07:01 +0100
Subject: [Buildroot] [PATCH 37/40] mplayer: use UTF-8 charset to avoid iconv
	dependency
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ca2293b3645452e58c9236ac0d8ab6e1be2fa2f0.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mplayer configure script was failing with:

  Checking for iconv program ... no
  No working iconv program found, use
  --charset=UTF-8 to continue anyway.
  If you also have problems with iconv library functions use --charset=noconv.
  Messages in the GTK-2 interface will be broken then.

Therefore, we pass --charset=UTF-8 instead of --charset=US-ASCII.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/mplayer/mplayer.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/mplayer/mplayer.mk b/package/multimedia/mplayer/mplayer.mk
index 3d56ee0..538bac9 100644
--- a/package/multimedia/mplayer/mplayer.mk
+++ b/package/multimedia/mplayer/mplayer.mk
@@ -54,7 +54,7 @@ $(MPLAYER_DIR)/.configured: $(MPLAYER_DIR)/.unpacked
 		--as=$(TARGET_CROSS)as \
 		--with-extraincdir=$(STAGING_DIR)/usr/include \
 		--with-extralibdir=$(STAGING_DIR)/lib \
-		--charset=US-ASCII \
+		--charset=UTF-8 \
 		--enable-mad \
 		--enable-fbdev \
 		$(MPLAYER_ENDIAN) \
-- 
1.6.3.3
