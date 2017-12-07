From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu,  7 Dec 2017 13:03:42 +0100
Subject: [Buildroot] [PATCH] libostree: install to staging
Message-ID: <20171207120342.25585-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install the libraries to staging to be usable by other packages.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 0e5eef717b..b43c228068 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -11,6 +11,7 @@ LIBOSTREE_SITE = https://github.com/ostreedev/ostree/releases/download/v$(LIBOST
 LIBOSTREE_LICENSE = GPL-2.0+
 LIBOSTREE_LICENSE_FILES = COPYING
 LIBOSTREE_DEPENDENCIES = e2fsprogs host-pkgconf libfuse libglib2 libgpgme xz
+LIBOSTREE_INSTALL_STAGING = YES
 
 LIBOSTREE_CONF_OPTS += \
 	--with-gpgme-prefix=$(STAGING_DIR)/usr \
-- 
2.15.0
