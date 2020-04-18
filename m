From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 14:46:48 +0200
Subject: [Buildroot] [git commit] package/polkit: enable
 gobject-introspection support
Message-ID: <20200418123232.CB5868E1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41dacc973b04f6873960aec05a949f434f719e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, add the gobject-introspection package to
the dependency list and set the conf opt --enable-introspection.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/polkit/polkit.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
index ee0b3674de..3ae42b2312 100644
--- a/package/polkit/polkit.mk
+++ b/package/polkit/polkit.mk
@@ -26,6 +26,13 @@ POLKIT_CONF_OPTS = \
 	--disable-libelogind \
 	--disable-libsystemd-login
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+POLKIT_CONF_OPTS += --enable-introspection
+POLKIT_DEPENDENCIES += gobject-introspection
+else
+POLKIT_CONF_OPTS += --disable-introspection
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 POLKIT_DEPENDENCIES += linux-pam
 POLKIT_CONF_OPTS += --with-authfw=pam
