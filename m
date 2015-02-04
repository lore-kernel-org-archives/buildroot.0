From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:13 +0100
Subject: [Buildroot] [PATCH 15/21] cwiid: add missing indirect dependency on
	atomics for wmgui
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-16-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a comment for cwiid itself.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cwiid/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index da49836..e864940 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_CWIID
 if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
+	depends on BR2_ARCH_HAS_ATOMICS # libgtk2 -> cairo
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
@@ -23,3 +24,8 @@ config BR2_PACKAGE_CWIID_WMGUI
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGTK2
 endif
+
+comment "cwiid needs a toolchain w/ dynamic lib, threads, wchar"
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32
+	depends on !BR2_USE_MMU
\ No newline at end of file
-- 
2.1.4
