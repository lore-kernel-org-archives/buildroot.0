From: Scott Fan <fancp2007@gmail.com>
Date: Tue, 28 Jul 2015 15:16:06 +0800
Subject: [Buildroot] [PATCH v2 1/4] freerdp: Add support for tz package
Message-ID: <1438067769-10254-1-git-send-email-fancp2007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes error message while freerdp connected the remote desktop:
Unable to detect time zone

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 .../freerdp/0004-add-support-for-tz-package.patch  | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/freerdp/0004-add-support-for-tz-package.patch

diff --git a/package/freerdp/0004-add-support-for-tz-package.patch b/package/freerdp/0004-add-support-for-tz-package.patch
new file mode 100644
index 0000000..93e4afd
--- /dev/null
+++ b/package/freerdp/0004-add-support-for-tz-package.patch
@@ -0,0 +1,30 @@
+From 605d0a85183d2f9d5b0da5629cbadf01173bbb2f Mon Sep 17 00:00:00 2001
+From: Scott Fan <fancp2007@gmail.com>
+Date: Mon, 13 Jul 2015 15:01:17 +0800
+Subject: [PATCH] Add support for tz package
+
+Fixes error message while freerdp connected the remote desktop:
+Unable to detect time zone
+
+Signed-off-by: Scott Fan <fancp2007@gmail.com>
+---
+ libfreerdp/locale/timezone.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/locale/timezone.c b/libfreerdp/locale/timezone.c
+index 3070f1f..4a06786 100644
+--- a/libfreerdp/locale/timezone.c
++++ b/libfreerdp/locale/timezone.c
+@@ -1539,7 +1539,8 @@ char* freerdp_get_unix_timezone_identifier()
+ 	 * America/Montreal for example.
+ 	 */
+ 	
+-	if ((len = readlink("/etc/localtime", buf, sizeof(buf) - 1)) != -1)
++	if ((len = readlink("/etc/localtime", buf, sizeof(buf) - 1)) != -1 ||
++	    (len = readlink("/etc/TZ", buf, sizeof(buf) - 1)) != -1)
+ 	{
+ 		int num = 0;
+ 		int pos = len;
+-- 
+2.4.5
+
-- 
2.4.6
