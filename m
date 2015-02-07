From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:08:32 +0100
Subject: [Buildroot] [git commit] kodi: add missing indirect dependency on
	dynamic lib for shairport
Message-ID: <20150207202910.52A3E8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ca1d299ae2d1b852088e266451a61977852ac15
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
