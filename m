From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:29:33 +0100
Subject: [Buildroot] [git commit] wine: Add OSMesa dependency
Message-ID: <20151213132943.35F398178A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4037e4ec9498e05efef3936229c6522a6a02e81c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We have support for building the OSMesa lib since
81537f284f62c6586d50bd5cca78c2bf1375b88c

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 38576db..1a1fea0 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -27,7 +27,6 @@ WINE_CONF_OPTS = \
 	--without-hal \
 	--without-openal \
 	--without-opencl \
-	--without-osmesa \
 	--without-oss
 
 # Wine uses a wrapper around gcc, and uses the value of --host to
@@ -171,6 +170,13 @@ else
 WINE_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
+WINE_CONF_OPTS += --with-osmesa
+WINE_DEPENDENCIES += mesa3d
+else
+WINE_CONF_OPTS += --without-osmesa
+endif
+
 ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
 WINE_CONF_OPTS += --with-sane
 WINE_DEPENDENCIES += sane-backends
