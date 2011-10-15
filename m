From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:21 -0300
Subject: [Buildroot] [PATCH 07/25] config menu: which is also provided by
	busybox
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Busybox has a which applet so hide regular which unless
BR2_BUSYBOX_SHOW_OTHERS is true.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 466ea4d..03cf3ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,7 +508,9 @@ source "package/lockfile-progs/Config.in"
 source "package/logrotate/Config.in"
 source "package/screen/Config.in"
 source "package/sudo/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/which/Config.in"
+endif
 source "package/xmlstarlet/Config.in"
 endmenu
 
-- 
1.7.3.4
