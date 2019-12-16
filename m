From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:51:32 +0100
Subject: [Buildroot] [git commit] package/solarus: disable tests
Message-ID: <20191216214247.6544B8B802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=480708da03742fe341bd0b4b17c89a2a7636e2dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set -DSOLARUS_TESTS=OFF to disable tests (option added in version 1.6.1
with:
https://gitlab.com/solarus-games/solarus/commit/1829189c6050e36086b12c3806932e8657265467)

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/solarus/solarus.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/solarus/solarus.mk b/package/solarus/solarus.mk
index d522128c33..6f5853e909 100644
--- a/package/solarus/solarus.mk
+++ b/package/solarus/solarus.mk
@@ -20,7 +20,9 @@ SOLARUS_DEPENDENCIES = libgl libmodplug libogg libvorbis openal physfs sdl2 \
 	sdl2_image sdl2_ttf
 
 # Disable launcher GUI (requires Qt5)
-SOLARUS_CONF_OPTS = -DSOLARUS_GUI=OFF
+SOLARUS_CONF_OPTS = \
+	-DSOLARUS_GUI=OFF \
+	-DSOLARUS_TESTS=OFF
 
 ifeq ($(BR2_PACKAGE_LUAJIT),y)
 SOLARUS_CONF_OPTS += -DSOLARUS_USE_LUAJIT=ON
