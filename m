From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Mar 2020 20:35:22 +0100
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xcb-proto: bump version to
 1.14
In-Reply-To: <20200309193523.185144-1-bernd.kuhls@t-online.de>
References: <20200309193523.185144-1-bernd.kuhls@t-online.de>
Message-ID: <20200309193523.185144-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow upstream switch to xz tarball:
https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/6d846028718206769d6b70c96239b926e782b4aa

Removed XCB_PROTO_POST_INSTALL_STAGING_HOOKS, not needed anymore due
to upstream fix:
https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/bd7a481a3bee9283277badda95730f52185127bc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xcb-proto/xcb-proto.hash |  8 +++-----
 package/x11r7/xcb-proto/xcb-proto.mk   | 14 ++------------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/package/x11r7/xcb-proto/xcb-proto.hash b/package/x11r7/xcb-proto/xcb-proto.hash
index b2ef3ee20b..c6d2d8e341 100644
--- a/package/x11r7/xcb-proto/xcb-proto.hash
+++ b/package/x11r7/xcb-proto/xcb-proto.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002852.html
-md5 abe9aa4886138150bbc04ae4f29b90e3  xcb-proto-1.13.tar.bz2
-sha1 f7fa35ab59af18cecadbe83fe705281dcfd82ffd  xcb-proto-1.13.tar.bz2
-sha256 7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1  xcb-proto-1.13.tar.bz2
-sha512 002aa2aa0ad503977e03419c6f136f1e3aa8c787916830ce6d6be8f81ca99edc1d8fc5f71ce8c592b490cc767bf6567695f0bafe55fe3f743076bcddbaac07f7  xcb-proto-1.13.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2020-February/003038.html
+sha256 186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605  xcb-proto-1.14.tar.xz
+sha512 de66d568163b6da2be9d6c59984f3afa3acd119a781378638045fd68018665ef5c9af98f024e9962ba3eb7c7a4d85c27ba70ffafceb2324ccc6940f34de16690  xcb-proto-1.14.tar.xz
 # Locally computed
 sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/xcb-proto/xcb-proto.mk b/package/x11r7/xcb-proto/xcb-proto.mk
index b85dad7f2c..f7a3ad55b1 100644
--- a/package/x11r7/xcb-proto/xcb-proto.mk
+++ b/package/x11r7/xcb-proto/xcb-proto.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XCB_PROTO_VERSION = 1.13
-XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.bz2
+XCB_PROTO_VERSION = 1.14
+XCB_PROTO_SOURCE = xcb-proto-$(XCB_PROTO_VERSION).tar.xz
 XCB_PROTO_SITE = http://xcb.freedesktop.org/dist
 XCB_PROTO_LICENSE = MIT
 XCB_PROTO_LICENSE_FILES = COPYING
@@ -15,15 +15,5 @@ XCB_PROTO_INSTALL_STAGING = YES
 XCB_PROTO_DEPENDENCIES = host-python
 HOST_XCB_PROTO_DEPENDENCIES = host-python
 
-# xcbincludedir/pythondir is used by E.G. libxcb at build time to find the
-# xml / python files, so ensure these expand to their full (host) paths
-define XCB_PROTO_FIXUP_PC_FILE
-	$(SED) 's|^\(xcbincludedir=\)|\1$(STAGING_DIR)|' \
-		-e 's|^\(pythondir=\)|\1$(STAGING_DIR)|' \
-		$(STAGING_DIR)/usr/lib/pkgconfig/xcb-proto.pc
-endef
-
-XCB_PROTO_POST_INSTALL_STAGING_HOOKS += XCB_PROTO_FIXUP_PC_FILE
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.25.0
