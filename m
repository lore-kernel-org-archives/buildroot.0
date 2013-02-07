From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  7 Feb 2013 23:35:07 +0100
Subject: [Buildroot] [PATCH v2 5/5] libgpg-error: use <pkg>_CONFIG_SCRIPTS
In-Reply-To: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360276507-17272-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1360276507-17272-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libgpg-error installs a gpg-error-config script, but it wasn't fixed
up properly. Use the <pkg>_CONFIG_SCRIPTS to handle this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
---
Changelog v1 -> v2:
 * Add Acked-by from Samuel
---
 package/libgpg-error/libgpg-error.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 288165b..4114310 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -9,5 +9,6 @@ LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
+LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 
 $(eval $(autotools-package))
-- 
1.7.9.5
