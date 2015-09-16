From: jpinto <Joao.Pinto@synopsys.com>
Date: Wed, 16 Sep 2015 09:26:49 +0100
Subject: [Buildroot] [PATCH v2] Enable vlc to run as root
Message-ID: <712f10f4f1eb6452279b88cb749906e66f711d8a.1442391509.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joao Pinto <jpinto@synopsys.com>

A great number of embedded systems only include the root user.
This patch has the goal of enabling vlc to be ran as root.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Tested-by: Joao Pinto <jpinto@synopsys.com>
---
 package/vlc/vlc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 6f7fd58..4e84b12 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -54,6 +54,7 @@ VLC_CONF_OPTS += \
 	--disable-mfx \
 	--disable-vdpau \
 	--disable-addonmanagermodules \
+	--enable-run-as-root \
 
 # Building static and shared doesn't work, so force static off.
 ifeq ($(BR2_STATIC_LIBS),)
-- 
1.8.1.5
