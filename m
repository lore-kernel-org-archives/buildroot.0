From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Mar 2015 19:11:27 +0200
Subject: [Buildroot] [PATCH 11/18] package/mplayer: add optional faad2
	support
In-Reply-To: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1427649094-1240-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index a09cf43..442f82b 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -117,6 +117,13 @@ else
 MPLAYER_CONF_OPTS += --disable-mencoder
 endif
 
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+MPLAYER_DEPENDENCIES += faad2
+MPLAYER_CONF_OPTS += --enable-faad
+else
+MPLAYER_CONF_OPTS += --disable-faad
+endif
+
 ifeq ($(BR2_PACKAGE_LIBASS),y)
 MPLAYER_DEPENDENCIES += libass
 MPLAYER_EXTRA_LIBS += -lass
-- 
1.7.10.4
