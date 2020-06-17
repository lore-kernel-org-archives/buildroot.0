From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:10 +0200
Subject: [Buildroot] [PATCH v2 02/17] board/olpc: move SERIO_OLPC_APSP to
 XO-1.75
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-3-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the keyboard connected via the SP "security processor" on a
XO-1.75. XO-1 has a regular PC keyboard.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/linux.config         | 1 -
 board/olpc/xo-1.75/linux.config | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 524b80494a..75670936e5 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -29,7 +29,6 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_X=1200
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=900
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_TABLET=y
-CONFIG_SERIO_OLPC_APSP=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_BATTERY_OLPC=y
diff --git a/board/olpc/xo-1.75/linux.config b/board/olpc/xo-1.75/linux.config
index 0ca7d16e30..4a779a3b23 100644
--- a/board/olpc/xo-1.75/linux.config
+++ b/board/olpc/xo-1.75/linux.config
@@ -12,6 +12,7 @@ CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_VFP=y
 CONFIG_NEON=y
+CONFIG_SERIO_OLPC_APSP=y
 CONFIG_REGULATOR_88PG86X=m
 CONFIG_VIDEO_MMP_CAMERA=y
 CONFIG_DRM_ARMADA=y
-- 
2.26.2
