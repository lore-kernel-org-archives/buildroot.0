From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:37:56 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/cegui: add
 libfribidi optional dependency
Message-ID: <20210508142103.BBB7781038@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b0361c5f627eeafb781d788cadbbfc48ef1aac7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

libfribidi is an optional dependency (enabled by default) since version
0.8.0 and
https://github.com/cegui/cegui/commit/17974582e6b6a7d8f5853b0272433f130f82e52a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Bartosz Bilas<b.bilas@grinn-global.com>
Reviewed-by: Bartosz Bilas<b.bilas@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1556484f0bbf082e8cae8cd00c1cf8afc1eae730)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cegui/cegui.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index d578c9913c..23a5859bc8 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -72,6 +72,13 @@ else
 CEGUI_CONF_OPTS += -DCEGUI_HAS_FREETYPE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+CEGUI_DEPENDENCIES += libfribidi
+CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=ON
+else
+CEGUI_CONF_OPTS += -DCEGUI_USE_FRIBIDI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 CEGUI_DEPENDENCIES += libxml2
 CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_LIBXML2=ON
