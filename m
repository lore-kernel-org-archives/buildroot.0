From: Nigel Kukard <nkukard@lbsd.net>
Date: Mon, 21 Dec 2009 07:18:32 +0000
Subject: [Buildroot] [PATCH 1/1] Install uuid.h into staging a some other
	apps like xfsprogs need it
In-Reply-To: <cover.1261379909.git.nkukard@lbsd.net>
References: <cover.1261379909.git.nkukard@lbsd.net>
Message-ID: <66db896cdd0b2ec3310eec09ee314137c50e7d8d.1261379909.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/e2fsprogs/e2fsprogs.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index fd03f02..c8d3cf3 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,6 +7,8 @@ E2FSPROGS_VERSION:=1.41.9
 E2FSPROGS_SOURCE=e2fsprogs-$(E2FSPROGS_VERSION).tar.gz
 E2FSPROGS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/e2fsprogs
 
+E2FSPROGS_DIR=$(BUILD_DIR)/e2fsprogs-$(E2FSPROGS_VERSION)
+
 E2FSPROGS_AUTORECONF = NO
 E2FSPROGS_LIBTOOL_PATCH = NO
 
@@ -91,5 +93,7 @@ endif
 ifeq ($(BR2_PACKAGE_E2FSPROGS_FINDFS),y)
 	ln -sf e2label ${TARGET_DIR}/usr/sbin/findfs
 endif
+	mkdir -p ${STAGING_DIR}/usr/include/uuid
+	install ${E2FSPROGS_DIR}/lib/uuid/uuid.h ${STAGING_DIR}/usr/include/uuid/uuid.h
 	touch $@
 
-- 
1.6.4
