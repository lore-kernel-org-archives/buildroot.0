From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 7 Mar 2019 22:45:48 +0100
Subject: [Buildroot] [git commit] leveldb: install memenv static library and
 header
Message-ID: <20190307214326.9B7388EA4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16f847340d07dce620e4c3fc0a099aa79898d86a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project builds a tiny static library that consists of a single
symbol which creates an in-memory LevelDB database.

That library is not installed by default and may be used by other
projects.

This commit installs in the staging directory the libmemenv.a static
library and the memenv.h header file.

Signed-off-by: Ga??l PORTAY <gael.portay@collabora.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/leveldb/leveldb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/leveldb/leveldb.mk b/package/leveldb/leveldb.mk
index af9e879828..6078cd496c 100644
--- a/package/leveldb/leveldb.mk
+++ b/package/leveldb/leveldb.mk
@@ -25,6 +25,8 @@ define LEVELDB_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) \
 		INSTALL_ROOT=$(STAGING_DIR) INSTALL_PREFIX=/usr \
 		$(LEVELDB_MAKE_ARGS) -C $(@D) install
+	$(INSTALL) -D -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib/libmemenv.a
+	$(INSTALL) -D -m 0644 $(@D)/helpers/memenv/memenv.h $(STAGING_DIR)/usr/include/helpers/memenv/memenv.h
 endef
 
 define LEVELDB_INSTALL_TARGET_CMDS
