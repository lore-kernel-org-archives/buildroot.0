From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 14:08:09 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: move cegui06 package to
 2020.05 section
Message-ID: <20200330115448.9E72E8A412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=662bc3c8d821a0e0855d4f64c1b1975716992b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

During package update, the legacy option was set to the existing
2020.02 release instead of the next 2020.05.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4a9b2ead9d..22f6a2778d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2020.05"
 
+config BR2_PACKAGE_CEGUI06
+	bool "BR2_PACKAGE_CEGUI06 was renamed"
+	select BR2_PACKAGE_CEGUI
+	select BR2_LEGACY
+	help
+	  The BR2_PACKAGE_CEGUI06 config symbol was renamed to
+	  BR2_PACKAGE_CEGUI.
+
 config BR2_GCC_VERSION_5_X
 	bool "gcc 5.x support removed"
 	select BR2_LEGACY
@@ -155,14 +163,6 @@ config BR2_GCC_VERSION_5_X
 
 comment "Legacy options removed in 2020.02"
 
-config BR2_PACKAGE_CEGUI06
-	bool "BR2_PACKAGE_CEGUI06 was renamed"
-	select BR2_PACKAGE_CEGUI
-	select BR2_LEGACY
-	help
-	  The BR2_PACKAGE_CEGUI06 config symbol was renamed to
-	  BR2_PACKAGE_CEGUI.
-
 config BR2_PACKAGE_JAMVM
 	bool "jamvm removed"
 	select BR2_LEGACY
