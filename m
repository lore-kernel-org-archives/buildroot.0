From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Aug 2014 11:52:27 +0200
Subject: [Buildroot] [PATCH 5/5] package/taglib: fix static link
In-Reply-To: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409392347-16392-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/a9c/a9cfe66c57bffc5a4560b2e4dcb41994da59e294/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/taglib/taglib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 8e6a3bd..532a792 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -22,6 +22,8 @@ ifeq ($(BR2_PACKAGE_TAGLIB_MP4),y)
 TAGLIB_CONF_OPT += -DWITH_MP4=ON
 endif
 
+TAGLIB_CONF_OPT += -DENABLE_STATIC=$(if $(BR2_PREFER_STATIC_LIB),ON,OFF)
+
 define TAGLIB_REMOVE_DEVFILE
 	rm -f $(TARGET_DIR)/usr/bin/taglib-config
 endef
-- 
2.1.0
