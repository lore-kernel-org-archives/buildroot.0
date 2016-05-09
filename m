From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:03:26 +0200
Subject: [Buildroot] [git commit] libglib2: remove gdbus-codegen from target
Message-ID: <20160509200332.CE46B81E7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9487c7065345f5e8f5702d20d3d5cbe7e3bbe3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It requires python and it's normally used at build time, hence since we
don't support toolchain in the target it really doesn't make much sense.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index fe303a7..50507f2 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -137,7 +137,7 @@ endif
 define LIBGLIB2_REMOVE_DEV_FILES
 	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
 	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext)
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,glib-compile-schemas glib-compile-resources glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,gdbus-codegen glib-compile-schemas glib-compile-resources glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
 	$(LIBGLIB2_REMOVE_GDB_FILES)
 endef
 
