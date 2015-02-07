From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:21:03 +0100
Subject: [Buildroot] [git commit] cwiid: add missing indirect dependency on
	atomics for wmgui
Message-ID: <20150207202910.835D18046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ceedd670d8ac54321c3c8b5b882346a035073e67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a comment for cwiid itself.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cwiid/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index da49836..0859dac 100644
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
