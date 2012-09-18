From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Sep 2012 19:21:36 +0200
Subject: [Buildroot] [PATCH 1/3] alsa-lib: put BR2_PACKAGE_ALSA_LIB_PYTHON
	under the existing if condition
Message-ID: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of duplicating the "depends on BR2_PACKAGE_ALSA_LIB", just put
BR2_PACKAGE_ALSA_LIB_PYTHON under the existing condition "if
BR2_PACKAGE_ALSA_LIB".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-lib/Config.in |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 98b8313..8123b5f 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -10,9 +10,10 @@ config BR2_PACKAGE_ALSA_LIB
 
 	  http://www.alsa-project.org/
 
+if BR2_PACKAGE_ALSA_LIB
+
 config BR2_PACKAGE_ALSA_LIB_PYTHON
 	bool "Python support for alsa-lib"
-	depends on BR2_PACKAGE_ALSA_LIB
 	depends on BR2_PACKAGE_PYTHON
 	help
 	  Add python support for alsa-lib.
@@ -20,7 +21,6 @@ config BR2_PACKAGE_ALSA_LIB_PYTHON
 	  in the target directory
 	  http://www.alsa-project.org/
 
-if BR2_PACKAGE_ALSA_LIB
 menu "ALSA lib selection"
 
 config BR2_PACKAGE_ALSA_LIB_DEVDIR
-- 
1.7.9.5
