From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Sep 2009 23:21:50 +0200
Subject: [Buildroot] [git commit master] dbus: prefer expat if available
	even if libxml2 also is
Message-ID: <20090927212248.7CB0777780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=91717c0148fc5c88fc1abde169a23624ca2a0b51
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dbus-glib needs dbus to be compiled with expat support, so prefer that
mode even if libxml2 is also enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 9b800d5..c625382 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -12,7 +12,7 @@ comment "dbus not available (need expat or libxml2)"
 choice
 	prompt "XML library to use"
 	depends on BR2_PACKAGE_DBUS
-	default BR2_DBUS_LIBXML2 if BR2_PACKAGE_LIBXML2
+	default BR2_DBUS_LIBXML2 if (BR2_PACKAGE_LIBXML2 && !BR2_PACKAGE_EXPAT)
 	default BR2_DBUS_EXPAT
 	help
 	  Select the XML library to use with D-Bus. Select Expat
-- 
1.6.3.3
