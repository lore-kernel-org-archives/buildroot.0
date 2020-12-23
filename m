From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 23 Dec 2020 11:59:49 +0100
Subject: [Buildroot] [PATCH 2/3] package/mutt: add zlib optional dependency
In-Reply-To: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
References: <20201223105950.2278971-1-fontaine.fabrice@gmail.com>
Message-ID: <20201223105950.2278971-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zlib is an optional dependency which is enabled by default since version
1.14.1 and
https://gitlab.com/muttmua/mutt/-/commit/136ae0add512f21bc418f9e31a2f1b970ad1a490

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index cc4b5f56b4..4e14004577 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -61,6 +61,13 @@ else
 MUTT_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MUTT_DEPENDENCIES += zlib
+MUTT_CONF_OPTS += --with-zlib=$(STAGING_DIR)/usr
+else
+MUTT_CONF_OPTS += --without-zlib
+endif
+
 # Avoid running tests to check for:
 #  - target system is *BSD
 #  - C99 conformance (snprintf, vsnprintf)
-- 
2.29.2
