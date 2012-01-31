From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 12:22:46 +0100
Subject: [Buildroot] [git commit] bluez_utils: remove redundant selection of
	expat
Message-ID: <20120131112714.34AC690961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc57dfebacb28ce088d76705263710aa35ac2633
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

expat/libxml2 is selected by dbus.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bluez_utils/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/bluez_utils/Config.in b/package/bluez_utils/Config.in
index ea6b44c..3517407 100644
--- a/package/bluez_utils/Config.in
+++ b/package/bluez_utils/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_BLUEZ_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  bluez utils
