From: Lubomir Rintel <lkundrak@v3.sk>
Date: Wed, 17 Jun 2020 12:49:13 +0200
Subject: [Buildroot] [PATCH v2 05/17] board/olpc: move GPIO_SYSFS to common
 config
In-Reply-To: <20200617104925.1036330-1-lkundrak@v3.sk>
References: <20200617104925.1036330-1-lkundrak@v3.sk>
Message-ID: <20200617104925.1036330-6-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not specific to XO-1.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 board/olpc/linux.config      | 1 +
 board/olpc/xo-1/linux.config | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olpc/linux.config b/board/olpc/linux.config
index 4ba157cf0b..01de870730 100644
--- a/board/olpc/linux.config
+++ b/board/olpc/linux.config
@@ -21,6 +21,7 @@ CONFIG_BLK_DEV_SR=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
+CONFIG_GPIO_SYSFS=y
 CONFIG_NETDEVICES=y
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
diff --git a/board/olpc/xo-1/linux.config b/board/olpc/xo-1/linux.config
index 8ed10ff62b..0680e073cb 100644
--- a/board/olpc/xo-1/linux.config
+++ b/board/olpc/xo-1/linux.config
@@ -44,7 +44,6 @@ CONFIG_NVRAM=y
 CONFIG_SCx200_ACB=y
 CONFIG_PINCTRL=y
 CONFIG_PINCTRL_SINGLE=y
-CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_CS5535=y
 CONFIG_THERMAL=y
 CONFIG_WATCHDOG=y
-- 
2.26.2
