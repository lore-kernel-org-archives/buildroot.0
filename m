From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 14:28:22 +0100
Subject: [Buildroot] [git commit] package/xmlstarlet: Fix static build
Message-ID: <20151213132842.408808178A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4edc0f1cddf4948abb45e6c78a0a12b82bca8d14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If libxml2 depends on xz (liblzma) static linking is broken.

Fixes
http://autobuild.buildroot.net/results/df3/df3f5fa770833c8c4344ee0bc67f45aa578ce542/
http://autobuild.buildroot.net/results/070/07021c8bd6e2031c2717fc58e2d3ff30c412fa90/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xmlstarlet/xmlstarlet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xmlstarlet/xmlstarlet.mk b/package/xmlstarlet/xmlstarlet.mk
index 992bb8f..e0abf04 100644
--- a/package/xmlstarlet/xmlstarlet.mk
+++ b/package/xmlstarlet/xmlstarlet.mk
@@ -21,6 +21,7 @@ XMLSTARLET_CONF_OPTS += \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 XMLSTARLET_CONF_OPTS += --enable-static-libs
+XMLSTARLET_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libxml-2.0`"
 else
 XMLSTARLET_CONF_OPTS += --disable-static-libs
 endif
