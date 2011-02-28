From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Feb 2011 21:46:05 +0100
Subject: [Buildroot] [git commit master 1/1] qt: qt3 compatibility needs gui
	support
Message-ID: <20110228204646.5633F8CA41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=42daeb724174ddea339ecc3335ce8060f1970fc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2911

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES              |    1 +
 package/qt/Config.in |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 73c1ad8..5bc2918 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#2911: Qt: Disable qt3support-option, if gui-module isn't selected
 	#3259: Unable to build webkit (on arm)
 	#3295: slang fails to build on mipsel
 	#3325: ffmpeg fails to build
diff --git a/package/qt/Config.in b/package/qt/Config.in
index e5fe325..3cc04f4 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -57,6 +57,7 @@ config BR2_PACKAGE_QT_LICENSE_APPROVED
 
 config BR2_PACKAGE_QT_QT3SUPPORT
 	bool "Compatibility with Qt3"
+	depends on BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  Turns on support for older Qt3. This will create an additional
 	  library with proxy code and increase the space required on target.
-- 
1.7.3.4
