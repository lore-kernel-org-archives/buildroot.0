From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:56 +0100
Subject: [Buildroot] [PATCH 04/17] cloop: ensure target directory exist
	before copying into
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-5-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/cloop/cloop.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 0ed9ff0..03008a4 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -10,6 +10,7 @@ define HOST_CLOOP_BUILD_CMDS
 endef
 
 define HOST_CLOOP_INSTALL_CMDS
+ mkdir -p $(HOST_DIR)/usr/bin
  install -m 755 $(@D)/create_compressed_fs $(HOST_DIR)/usr/bin
  install -m 755 $(@D)/extract_compressed_fs $(HOST_DIR)/usr/bin
 endef
-- 
1.7.2.3
