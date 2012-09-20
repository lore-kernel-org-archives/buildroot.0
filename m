From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:46:59 +0200
Subject: [Buildroot] [git commit] alsa-lib: put BR2_PACKAGE_ALSA_LIB_PYTHON
	under the existing if condition
Message-ID: <20120920195434.1B2AC996BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e04b4dc7b67fd27860bcd7049816921d8b865e7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of duplicating the "depends on BR2_PACKAGE_ALSA_LIB", just put
BR2_PACKAGE_ALSA_LIB_PYTHON under the existing condition "if
BR2_PACKAGE_ALSA_LIB".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/alsa-lib/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
