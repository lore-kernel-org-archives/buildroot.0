From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 22:46:25 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dbus: security
 bump to version 1.12.20
Message-ID: <20210111220104.E1E9A8634A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8874dbc95ce58551f3401916e8af7e4d85fce743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issue:

- CVE-2020-35512: On Unix, avoid a use-after-free if two usernames have the
  same numeric uid.  In older versions this could lead to a crash (denial of
  service) or other undefined behaviour, possibly including incorrect
  authorization decisions if <policy group=...> is used.  Like Unix
  filesystems, D-Bus' model of identity cannot distinguish between users of
  different names with the same numeric uid, so this configuration is not
  advisable on systems where D-Bus will be used.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c80989aa9d6a638a8fc953320f255f367d017617)
[Peter: mention security fix]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/Config.in | 2 +-
 package/dbus/dbus.hash | 5 +++--
 package/dbus/dbus.mk   | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 653f7482f6..5650b5777b 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DBUS
 	help
 	  The D-Bus message bus system.
 
-	  http://www.freedesktop.org/wiki/Software/dbus
+	  https://www.freedesktop.org/wiki/Software/dbus
 
 comment "dbus needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index cfa06301f6..06512e5656 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,6 +1,7 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.18.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256  64cf4d70840230e5e9bc784d153880775ab3db19d656ead8a0cb9c0ab5a95306  dbus-1.12.18.tar.gz
+sha256  f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa7de5fe  dbus-1.12.20.tar.gz
+
 # Locally calculated
 sha256  0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 952eff1fc7..5a471eaa83 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.18
+DBUS_VERSION = 1.12.20
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
