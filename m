From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 14:01:18 +0100
Subject: [Buildroot] [PATCH v2,3/3] package/solarus: disable tests
In-Reply-To: <20191215130118.3634528-1-fontaine.fabrice@gmail.com>
References: <20191215130118.3634528-1-fontaine.fabrice@gmail.com>
Message-ID: <20191215130118.3634528-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set -DSOLARUS_TESTS=OFF to disable tests (option added in version 1.6.1
with:
https://gitlab.com/solarus-games/solarus/commit/1829189c6050e36086b12c3806932e8657265467)

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/solarus/solarus.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index e8cfe77941..eb92c513f8 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -19,7 +19,9 @@ SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
 	sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
-SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
+SOLARUS_CONF_OPTS = \
+	-DSOLARUS_GUI=OFF \
+	-DSOLARUS_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
-- 
2.24.0
