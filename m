From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Fri, 10 Jul 2015 12:32:31 -0300
Subject: [Buildroot] [PATCH] icu: update icudata generator URL
Message-ID: <1436542351-12063-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

It was pointing to version 51.x which wouldn't work well with 55.x.

Point it to the latest version that matches the current buildroot
version (55). When a new ICU major version is released a link for the
"old" 55 version will be available below as is it currently for
previous versions such as 54, 53 and so on.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/icu/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/icu/Config.in b/package/icu/Config.in
index d7bf2fe..4d47c32 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -19,9 +19,10 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 	string "Path to custom data library file"
 	help
 	  This option allows to define the path to a custom data
-	  library generated with
-	  http://apps.icu-project.org/datacustom/ICUData51.html. Leave
-	  empty to not use this functionality.
+	  library generated with http://apps.icu-project.org/datacustom/
+	  Make sure you select the appropiate version to match the one
+	  provided by buildroot.
+	  Leave empty to not use this functionality.
 
 endif
 
-- 
2.3.6
