From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  9 May 2010 23:26:39 +0200
Subject: [Buildroot] [PATCH 5/9] libgcrypt: specify where gpg-error-config is
In-Reply-To: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273440344.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8b47ede9e6d5301839d2d96dfd56e2117e0e8818.1273440344.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgcrypt depends on libgpg-error, but it needs to know where the
gpg-error-config utility is.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/libgcrypt.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index ef13de7..646ad83 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -12,7 +12,8 @@ LIBGCRYPT_INSTALL_TARGET = YES
 LIBGCRYPT_CONF_ENV = \
 	ac_cv_sys_symbol_underscore=no
 LIBGCRYPT_CONF_OPT = \
-	--disable-optimization
+	--disable-optimization \
+	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 LIBGCRYPT_DEPENDENCIES = libgpg-error
 
-- 
1.6.3.3
