From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Dec 2018 16:24:25 +0100
Subject: [Buildroot] [PATCH] package/libgpgme: properly tweak gpgme-config
Message-ID: <20181211152425.32525-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgpgme installs a gpgme-config script, it should be tweaked using
the <pkg>_CONFIG_SCRIPTS mechanism. This is generally useful and is
going to be particularly important with per-package directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpgme/libgpgme.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index a70ffcf11d..85450c83d2 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -12,6 +12,7 @@ LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_LANGUAGE_BINDINGS = cl
+LIBGPGME_CONFIG_SCRIPTS = gpgme-config
 
 LIBGPGME_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
-- 
2.19.2
