From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Jan 2011 13:13:45 +0100
Subject: [Buildroot] [git commit master 1/1] alsa-utils: select alsa-lib
Message-ID: <20110110131223.19F528A3BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c7333781cc192839c4ec78d262f3e4604cd79948
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select alsa-libs instead of depending on them otherwise it's just
"missing" from the menu.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
