From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 11:11:19 +0100
Subject: [Buildroot] [PATCH 5 of 5 v2] alsa-utils/Config.in: move comment to
 top, to fix nesting of config options
In-Reply-To: <patchbomb.1393150274@argentina>
References: <patchbomb.1393150274@argentina>
Message-ID: <66b82225c29844efa58a.1393150279@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To allow proper nesting of suboptions of a package, the suboptions should
come directly after the main option, and cannot be interleaved with a
comment.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/alsa-utils/Config.in |  8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,3 +1,7 @@
+comment "alsa-utils needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU # fork
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
@@ -10,10 +14,6 @@ config BR2_PACKAGE_ALSA_UTILS
 
 	  http://www.alsa-project.org/
 
-comment "alsa-utils needs a toolchain w/ largefile, threads"
-	depends on BR2_USE_MMU # fork
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_ALSA_UTILS
 menu "ALSA utils selection"
 
