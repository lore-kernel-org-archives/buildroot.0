From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2020 18:21:13 +0100
Subject: [Buildroot] [git commit] package/gssdp: explicitly disable vapi
Message-ID: <20200315170839.54368815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9de3b9c09463127b94bacad3d0aa60aa6efc53dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, vapi support does not work with meson due to meson calling vapigen
directly instead of the vala wrapper. As such, when building typelib files for
gobject-introspection, vapigen fails to find the proper .gir files and fails
to build.

Explicitly disable vapi until a fix for vapi is made.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gssdp/gssdp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
index 4589517691..071ad00109 100644
--- a/package/gssdp/gssdp.mk
+++ b/package/gssdp/gssdp.mk
@@ -14,7 +14,8 @@ GSSDP_INSTALL_STAGING = YES
 GSSDP_DEPENDENCIES = host-pkgconf libglib2 libsoup
 GSSDP_CONF_OPTS = \
 	-Dexamples=false \
-	-Dintrospection=false
+	-Dintrospection=false \
+	-Dvapi=false
 
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 GSSDP_DEPENDENCIES += libgtk3
