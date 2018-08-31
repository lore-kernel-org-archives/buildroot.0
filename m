From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri, 31 Aug 2018 16:22:02 -0400
Subject: [Buildroot] [PATCH 1/3] leveldb: install memenv static library and
 headers
In-Reply-To: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
References: <20180831202204.28093-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180831202204.28093-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/leveldb/leveldb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index 54942a0f27..efbd61d16a 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -25,6 +25,8 @@ define LEVELDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+	$(INSTALL) -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib
+	cp -dpfr $(@D)/helpers $(STAGING_DIR)/usr/include
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
-- 
2.11.0
