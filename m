From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:57:46 +0100
Subject: [Buildroot] [git commit] package/dbus-python: remove unrecognized
 options
Message-ID: <20191027111156.CFC8B81423@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d29450bfe19ed9e566f5730a00059f27e9924ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-html-docs and --disable-api-docs has been removed since
version 1.2.8 and
https://github.com/freedesktop/dbus-python/commit/721ef6373069bfc6955018681204e20e1ad836e4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dbus-python/dbus-python.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/dbus-python/dbus-python.mk b/package/dbus-python/dbus-python.mk
index d48208f1d1..c3a3649396 100644
--- a/package/dbus-python/dbus-python.mk
+++ b/package/dbus-python/dbus-python.mk
@@ -10,10 +10,7 @@ DBUS_PYTHON_INSTALL_STAGING = YES
 DBUS_PYTHON_LICENSE = MIT
 DBUS_PYTHON_LICENSE_FILES = COPYING
 DBUS_PYTHON_DEPENDENCIES = dbus-glib
-DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
-
 HOST_DBUS_PYTHON_DEPENDENCIES = host-dbus-glib
-HOST_DBUS_PYTHON_CONF_OPTS = --disable-html-docs --disable-api-docs
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 DBUS_PYTHON_DEPENDENCIES += python host-python
