From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jul 2016 00:22:40 +0200
Subject: [Buildroot] [PATCH] package/elementary: provide the path to
	elementary_codgen
Message-ID: <1469226160-26379-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elementary_codgen tool is build for the host, so use it while building
elementary for the target.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/elementary/elementary.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index a06809f..01fc6e4 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -19,6 +19,7 @@ ELEMENTARY_CONF_OPTS = \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
 	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
+	--with-elementary-codegen=$(HOST_DIR)/usr/bin/elementary_codegen \
 	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
 	--with-doxygen=no \
 	--disable-elementary-test
-- 
2.5.5
