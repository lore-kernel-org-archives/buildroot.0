From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 23:00:27 +0200
Subject: [Buildroot] [git commit] package/gssdp: add optional libgtk3
 dependency
Message-ID: <20190802205946.5D3298D218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67563ac0518ad832b66b1f35bfbdac4e54cf72e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gssdp's sniffer depends on libgtk3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gssdp/gssdp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 2ce1f9b0bf..e7f3ad9330 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -13,4 +13,11 @@ GSSDP_LICENSE_FILES = COPYING
 GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
 
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+GSSDP_DEPENDENCIES += libgtk3
+GSSDP_CONF_OPTS += --with-gtk
+else
+GSSDP_CONF_OPTS += --without-gtk
+endif
+
 $(eval $(autotools-package))
