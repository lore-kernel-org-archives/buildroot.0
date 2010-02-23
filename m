From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:42 +0100
Subject: [Buildroot] [PATCH 18/40] package infrastructure: add PERLLIB
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <405a7ecaa19d229e144062a338d5a3b8cd21c96c.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we build Perl modules in $(HOST_DIR), PERLLIB must be defined
to $(HOST_DIR)/usr/lib/perl.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 043ef3e..1e412a6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -228,6 +228,8 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib" \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_CONFIGURE_ENV=\
@@ -237,7 +239,8 @@ TARGET_CONFIGURE_ENV=\
 	FCFLAGS="$(TARGET_FCFLAGS)" \
 
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
+		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -275,12 +278,14 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		ORIGINAL_NM_FOR_TARGET="$(TARGET_NM)" \
 		ORIGINAL_OBJDUMP_FOR_TARGET="$(TARGET_OBJDUMP)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
+		PERLLIB="$(HOST_DIR)/usr/lib/perl"
 
 
 #######################################################################
-- 
1.6.3.3
