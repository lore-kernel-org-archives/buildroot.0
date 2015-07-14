From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Tue, 14 Jul 2015 13:09:32 -0300
Subject: [Buildroot] [PATCH v5 1/3] busybox: disable nslookup applet
In-Reply-To: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1436886664-3206-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1436890174-23236-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchains have no resolver support (res_* family), so they fail to
build this applet (which is the only user of those functions). Instead
of selectively disabling it on such limited toolchains, just drop it
from the default config, since (to the best of my knowledge) is not
widely used.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 8d1d80a..91c3006 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -838,7 +838,7 @@ CONFIG_IPRULE=y
 CONFIG_NETSTAT=y
 # CONFIG_FEATURE_NETSTAT_WIDE is not set
 # CONFIG_FEATURE_NETSTAT_PRG is not set
-CONFIG_NSLOOKUP=y
+# CONFIG_NSLOOKUP is not set
 # CONFIG_NTPD is not set
 # CONFIG_FEATURE_NTPD_SERVER is not set
 # CONFIG_FEATURE_NTPD_CONF is not set
-- 
2.1.4
