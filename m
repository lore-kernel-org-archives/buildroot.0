From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Mar 2013 21:30:16 +0100
Subject: [Buildroot] [git commit] CMake packages: remove .cmake files from
	target directory
Message-ID: <20130310203045.A85E69AF86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df99efb3d9114aa09153fdb1f47b7ce695e8f53b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like pkgconfig files.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 1300725..c462bb1 100644
--- a/Makefile
+++ b/Makefile
@@ -452,7 +452,9 @@ ifeq ($(BR2_HAVE_DEVFILES),y)
 	( support/scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
 else
 	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
-		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig
+		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
+		$(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake
+	find $(TARGET_DIR)/usr/{lib,share}/ -name '*.cmake' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
 endif
