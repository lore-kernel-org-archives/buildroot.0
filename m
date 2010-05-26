From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] bmon: needs ipv6 support
Message-ID: <20100526122002.6D4541EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=994bb070c9a254de9faeabecda99fdfcdd9310ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 +-
 package/bmon/Config.in |    4 ++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 61ab052..8684ca4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: aumix, atk, avahi, busybox, cairo,
+	Updated/fixed packages: aumix, atk, avahi, bmon, busybox, cairo,
 	cdrkit, dbus-glib, dbus-python, docker, enchant, fltk, gamin,
 	gettext, gmpc, gob2, grep, gstreamer, gvfs, hal, iconv, icu,
 	libcgicc, libglade, libglib2, libgtk2, libidn, libmms, libmpd,
diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index f42d19a..667788b 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
+	depends on BR2_INET_IPV6
 	select BR2_PACKAGE_NCURSES
 	help
 	  Linux bandwidth monitor
+
+comment "bmon requires a toolchain with IPv6 support"
+	depends on !BR2_INET_IPV6
-- 
1.6.3.3
