From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2014 15:25:21 +0100
Subject: [Buildroot] [git commit] VLC needs QT_GUI_MODULE and not just QT
Message-ID: <20140204142939.CDF9F9C211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd3de018d7a26cee1179452c1d326cf17aaac60d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes http://autobuild.buildroot.net/results/78d/78df2d86394d7637db88dac5d1e3c7b4a27af293/

Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
