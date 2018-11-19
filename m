From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:42:43 +0100
Subject: [Buildroot] [git commit] keepalived: add libglib2 optional
 dependency
Message-ID: <20181202071556.7F8638843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcb77d51d47a754f4b53e2da11be2562fd3f0304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gio from libglib2 is used for dbus support

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keepalived/keepalived.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index fa8b2e4112..ed80a79f8a 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -11,7 +11,6 @@ KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 # 0001-configure.ac-do-not-force-PIE.patch
 KEEPALIVED_AUTORECONF = YES
-KEEPALIVED_CONF_OPTS += --disable-dbus
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
@@ -20,6 +19,13 @@ else
 KEEPALIVED_CONF_OPTS += --disable-json
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+KEEPALIVED_DEPENDENCIES += libglib2
+KEEPALIVED_CONF_OPTS += --enable-dbus
+else
+KEEPALIVED_CONF_OPTS += --disable-dbus
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
 KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 KEEPALIVED_CONF_OPTS += --enable-libnl
