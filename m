From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 22:41:21 +0200
Subject: [Buildroot] [PATCH 4/5] package/mplayer: disable inline mmx
In-Reply-To: <20170410204122.13382-1-bernd.kuhls@t-online.de>
References: <20170410204122.13382-1-bernd.kuhls@t-online.de>
Message-ID: <20170410204122.13382-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/642/6422adeef19ec547c7bc3f8ad3b0d51702015240/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 21facccc4..166394cac 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -288,6 +288,8 @@ endif
 define MPLAYER_DISABLE_INLINE_ASM
 	$(SED) 's,#define HAVE_INLINE_ASM 1,#define HAVE_INLINE_ASM 0,g' \
 		$(@D)/config.h
+	$(SED) 's,#define HAVE_MMX_INLINE 1,#define HAVE_MMX_INLINE 0,g' \
+		$(@D)/config.h
 endef
 
 ifeq ($(BR2_i386),y)
-- 
2.11.0
