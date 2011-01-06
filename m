From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Jan 2011 15:41:57 -0300
Subject: [Buildroot] [PATCH 1/5] alsa-utils: select alsa-lib
Message-ID: <1294339321-5659-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select alsa-libs instead of depending on them otherwise it's just
"missing" from the menu.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/alsa-utils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index 3f30c61..b85ff7e 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_LARGEFILE
-	depends on BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB
 	help
 	  This package contains the command line utilities for the ALSA
 	  project.
-- 
1.7.2.2
