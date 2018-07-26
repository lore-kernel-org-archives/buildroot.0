From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 26 Jul 2018 10:08:00 +0200
Subject: [Buildroot] [PATCH v2] libostree: override path to gpg-error-config
Message-ID: <20180726080800.5564-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libostree has begun to use `gpg-error-config` in their configuration
script.
Point out gpg-error-config in staging dir to avoid using the one
installed on the host system.

Fixes:
 http://autobuild.buildroot.net/results/447b96e449e881cf1bd9644cda0f386aa4c75724

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Notes:
    v2:
    	- override ac_cv_path_GPG_ERROR_CONFIG instead of  GPG_ERROR_CONFIG

 package/libostree/libostree.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 24eda0d1db..414cca104a 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -12,6 +12,7 @@ LIBOSTREE_LICENSE = LGPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-bison host-pkgconf libfuse libglib2 libgpgme xz
 LIBOSTREE_INSTALL_STAGING = YES
+LIBOSTREE_CONF_ENV = GPG_ERROR_CONFIG=$(STAGING_DIR)/usr/bin/gpg-error-config
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
-- 
2.18.0
