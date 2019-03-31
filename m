From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:02:13 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional dbus dependency
Message-ID: <20190331130146.24B2B804FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e0b771d13ca984df2449d4edde8994589911d69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should be noted that dbus is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 0eb6e7f3c7..fe9f898bd3 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -35,6 +35,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+RPM_DEPENDENCIES += dbus
+RPM_CONF_OPTS += --enable-plugins
+else
+RPM_CONF_OPTS += --disable-plugins
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 RPM_DEPENDENCIES += libcap
 RPM_CONF_OPTS += --with-cap
