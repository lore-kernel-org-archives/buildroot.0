From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 14:56:26 +0200
Subject: [Buildroot] [PATCH 2/2] minnowboard_max-graphical defconfig: remove
	deprecated AIGLX option
In-Reply-To: <20170412125626.8108-1-arnout@mind.be>
References: <20170412125626.8108-1-arnout@mind.be>
Message-ID: <20170412125626.8108-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the default xserver_xorg-server version 1.19.x, the AIGLX option
is no longer available (cfr. commit ec502ea8e4). In fact, AIGLX is
always enabled. So remove this option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I'm not sure if the AIGLX option is supposed to come back in a later
version. If so, this commit should probably be discarded...
---
 configs/minnowboard_max-graphical_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/minnowboard_max-graphical_defconfig b/configs/minnowboard_max-graphical_defconfig
index e8eb133f13..1a2cd33be2 100644
--- a/configs/minnowboard_max-graphical_defconfig
+++ b/configs/minnowboard_max-graphical_defconfig
@@ -46,7 +46,6 @@ BR2_PACKAGE_FB_TEST_APP=y
 # X
 BR2_PACKAGE_XORG7=y
 BR2_PACKAGE_XSERVER_XORG_SERVER=y
-BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
 BR2_PACKAGE_XAPP_XRANDR=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
 BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
-- 
2.11.0
