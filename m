From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Tue,  4 Feb 2014 15:12:40 +0100
Subject: [Buildroot] [PATCH] VLC needs QT_GUI_MODULE and not just QT
Message-ID: <1391523160-30939-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fixes http://autobuild.buildroot.net/results/78d/78df2d86394d7637db88dac5d1e3c7b4a27af293/


Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 73b378c..b39c6c7 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -204,7 +204,7 @@ else
 VLC_CONF_OPT += --disable-lua
 endif
 
-ifeq ($(BR2_PACKAGE_QT),y)
+ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 VLC_CONF_OPT += --enable-qt
 VLC_DEPENDENCIES += qt
 else
-- 
1.8.5.3
