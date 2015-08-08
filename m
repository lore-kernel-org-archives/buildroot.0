From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:29 -0000
Subject: [Buildroot] [git commit branch/next] icu: update icudata generator
	URL
Message-ID: <20150808105628.D26C27FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ae93873e3d783ac59cbd4c5744f507d2792333b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It was pointing to version 51.x which wouldn't work well with 55.x.

Point it to the latest version that matches the current buildroot
version (55). When a new ICU major version is released a link for the
"old" 55 version will be available below as is it currently for
previous versions such as 54, 53 and so on.

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

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
 
