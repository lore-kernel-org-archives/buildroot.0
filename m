From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 10 Apr 2017 22:41:19 +0200
Subject: [Buildroot] [PATCH 2/5] package/mplayer: mmxext requires sse
In-Reply-To: <20170410204122.13382-1-bernd.kuhls@t-online.de>
References: <20170410204122.13382-1-bernd.kuhls@t-online.de>
Message-ID: <20170410204122.13382-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPlayer contains mmxext code for which a SSE-enabled CPU is required,
for details see https://bugs.funtoo.org/browse/FL-2202

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 14ab8acee..21facccc4 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -306,9 +306,9 @@ MPLAYER_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-MPLAYER_CONF_OPTS += --enable-sse
+MPLAYER_CONF_OPTS += --enable-mmxext --enable-sse
 else
-MPLAYER_CONF_OPTS += --disable-sse
+MPLAYER_CONF_OPTS += --disable-mmxext --disable-sse
 endif
 
 ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
-- 
2.11.0
