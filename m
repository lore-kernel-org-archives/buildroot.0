From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 19 Sep 2014 12:42:07 +0200
Subject: [Buildroot] [PATCH] whois: Fix unmet dependencies
Message-ID: <1411123327-29657-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix :
   BR2_PACKAGE_WHOIS selects BR2_PACKAGE_GETTEXT which has unmet direct dependencies (BR2_USE_WCHAR)

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/whois/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/whois/Config.in b/package/whois/Config.in
index 40b6590..b7c2782 100644
--- a/package/whois/Config.in
+++ b/package/whois/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_WHOIS
 	bool "whois"
+	depends on BR2_USE_WCHAR # gettext
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	help
 	  Improved whois client.
-- 
2.1.0
