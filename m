From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:14 +0200
Subject: [Buildroot] [PATCH 06/12] reproducibility/libgcrypt: override
	timestamps
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-6-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 package/libgcrypt/libgcrypt.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 7c27a22..89fe6a0 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,6 +18,10 @@ LIBGCRYPT_CONF_ENV = \
 LIBGCRYPT_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+LIBGCRYPT_MAKE_OPTS = BUILD_TIMESTAMP=$(SOURCE_DATE)
+endif
+
 # Code doesn't build in thumb mode
 ifeq ($(BR2_arm),y)
 LIBGCRYPT_CONF_ENV += CFLAGS="$(patsubst -mthumb,,$(TARGET_CFLAGS))"
-- 
2.8.2
