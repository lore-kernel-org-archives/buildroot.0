From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:10:29 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dbus: security
 bump to version 1.12.16
Message-ID: <20190623210928.85215814C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=841c2742002d1948c05af885874aba4349ea2a85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2019-12749: Do not attempt to carry out DBUS_COOKIE_SHA1
  authentication for identities that differ from the user running the
  DBusServer.  Previously, a local attacker could manipulate symbolic links
  in their own home directory to bypass authentication and connect to a
  DBusServer with elevated privileges.  The standard system and session
  dbus-daemons in their default configuration were immune to this attack
  because they did not allow DBUS_COOKIE_SHA1, but third-party users of
  DBusServer such as Upstart could be vulnerable.  Thanks to Joe Vennix of
  Apple Information Security.

  For details, see the advisory:
  https://www.openwall.com/lists/oss-security/2019/06/11/2

Also contains a number of other smaller fixes, including fixes for memory
leaks.  For details, see NEWS:

https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 992b106d1de70b2bf1ad6a2211b937f5534b2c8a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dbus/dbus.hash | 4 ++--
 package/dbus/dbus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
index 92c0c94210..9529d2e04f 100644
--- a/package/dbus/dbus.hash
+++ b/package/dbus/dbus.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.10.tar.gz.asc
+# https://dbus.freedesktop.org/releases/dbus/dbus-1.12.16.tar.gz.asc
 # using key 36EC5A6448A4F5EF79BEFE98E05AE1478F814C4F
-sha256	4b693d24976258c3f2fa9cc33ad9288c5fbfa7a16481dbd9a8a429f7aa8cdcf7  dbus-1.12.10.tar.gz
+sha256	54a22d2fa42f2eb2a871f32811c6005b531b9613b1b93a0d269b05e7549fec80  dbus-1.12.16.tar.gz
 # Locally calculated
 sha256	0e46f54efb12d04ab5c33713bacd0e140c9a35b57ae29e03c853203266e8f3a1  COPYING
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 0a56de5a4e..a4043864d1 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_VERSION = 1.12.10
+DBUS_VERSION = 1.12.16
 DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
 DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
