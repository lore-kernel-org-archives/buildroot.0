From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:08 +0100
Subject: [Buildroot] [PATCH 10/21] kodi: add missing indirect dependency on
	dynamic lib for shairport
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-11-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5141629..1bc8b15 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -194,11 +194,15 @@ config BR2_PACKAGE_KODI_RTMPDUMP
 
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
+	depends on !BR2_STATIC_LIBS # libshairplay -> avahi
 	select BR2_PACKAGE_LIBSHAIRPLAY
 	help
 	  Enable Shairport support.
 	  Select this if you want to stream content from an Apple device.
 
+comment "shairport support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_KODI_LIBSMBCLIENT
 	bool "samba"
 	select BR2_PACKAGE_SAMBA
-- 
2.1.4
