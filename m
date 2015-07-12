From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jul 2015 16:37:08 +0200
Subject: [Buildroot] [git commit] icu: update icudata generator URL
Message-ID: <20150712143718.0EC8B80105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ae93873e3d783ac59cbd4c5744f507d2792333b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
