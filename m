From: Nicolas =?utf-8?B?TcOpbsOpZ2FsZQ==?= <nicolas.menegale@openwide.fr>
Date: Tue, 27 Aug 2013 11:29:19 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] libffi: minor corrections in post install
	hooks
In-Reply-To: <1931727883.5578934.1377595721868.JavaMail.root@openwide.fr>
Message-ID: <757109398.5579025.1377595759907.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas M?n?gale <nicolas.menegale@openwide.fr>
---
v0: initial commit
In order to be sure that we just deal with the includes related with
the actual package described into libffi.mk it is better to explicitly
specify the version of the libffi we deal with into the post install
hooks.
---
 package/libffi/libffi.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 0ad5c84..96e7940 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -14,7 +14,7 @@ LIBFFI_AUTORECONF = YES
 # Move the headers to the usual location, and adjust the .pc file
 # accordingly.
 define LIBFFI_MOVE_STAGING_HEADERS
-	mv $(STAGING_DIR)/usr/lib/libffi-*/include/*.h $(STAGING_DIR)/usr/include/
+	mv $(STAGING_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(STAGING_DIR)/usr/include/
 	$(SED) '/^includedir.*/d' -e '/^Cflags:.*/d' \
 		$(STAGING_DIR)/usr/lib/pkgconfig/libffi.pc
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
@@ -25,7 +25,7 @@ LIBFFI_POST_INSTALL_STAGING_HOOKS += LIBFFI_MOVE_STAGING_HEADERS
 # Similar for target headers
 define LIBFFI_MOVE_TARGET_HEADERS
 	install -d $(TARGET_DIR)/usr/include/
-	mv $(TARGET_DIR)/usr/lib/libffi-*/include/*.h $(TARGET_DIR)/usr/include/
+	mv $(TARGET_DIR)/usr/lib/libffi-$(LIBFFI_VERSION)/include/*.h $(TARGET_DIR)/usr/include/
 	rm -rf $(TARGET_DIR)/usr/lib/libffi-*
 endef
 
-- 
1.7.9.5
