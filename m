From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:35 +0200
Subject: [Buildroot] [PATCH 06/69] cramfs: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-7-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/cramfs/cramfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 72860b6b7a5d..3cbe2744e6e3 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -10,6 +10,7 @@ CRAMFS_LICENSE = GPLv2+
 CRAMFS_LICENSE_FILES = COPYING
 
 CRAMFS_DEPENDENCIES = zlib
+HOST_CRAMFS_DEPENDENCIES = host-zlib
 
 define CRAMFS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
-- 
2.1.0
