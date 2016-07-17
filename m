From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Jul 2016 22:22:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/elementary: add path to eolian_cxx
In-Reply-To: <1468786924-18394-1-git-send-email-romain.naour@gmail.com>
References: <1468786924-18394-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1468786924-18394-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When efl package is build with Eolian support, eolian_cxx tool is
build for the host.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/elementary/elementary.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 33d4034..dfd296e 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -18,6 +18,7 @@ ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx \
 	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
 	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
 	--with-doxygen=no \
@@ -30,6 +31,7 @@ HOST_ELEMENTARY_CONF_OPTS = \
 	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \
+	--with-eolian-cxx=$(HOST_DIR)/usr/bin/eolian_cxx \
 	--with-doxygen=no \
 	--disable-elementary-test
 
-- 
2.5.5
