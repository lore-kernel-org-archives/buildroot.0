From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:24 +0200
Subject: [Buildroot] [PATCH 08/18] package/mplayer: add optional libass
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 900a6ce..245ed91 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -110,6 +110,12 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
+ifeq ($(BR2_PACKAGE_LIBASS),y)
+MPLAYER_DEPENDENCIES += libass
+MPLAYER_EXTRA_LIBS += -lass
+MPLAYER_CONF_OPTS += --disable-ass-internal --enable-ass
+endif
+
 ifeq ($(BR2_PACKAGE_TREMOR),y)
 MPLAYER_DEPENDENCIES += tremor
 MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
-- 
1.7.10.4
