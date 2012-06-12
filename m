From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:41 -0500
Subject: [Buildroot] [PATCH 5/7] qt: change use of BR2_JLEVEL to
	PARALLEL_JOBS
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-6-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b751696..ff9c1bf 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -488,7 +488,7 @@ define QT_CONFIGURE_CMDS
 		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
-		MAKEFLAGS="$(MAKEFLAGS) -j$(BR2_JLEVEL)" ./configure \
+		MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
 		$(if $(VERBOSE),-verbose,-silent) \
 		-force-pkg-config \
 		$(QT_CONFIGURE_OPTS) \
-- 
1.7.6.5
