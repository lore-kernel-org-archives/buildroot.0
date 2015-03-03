From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:32 +0100
Subject: [Buildroot] [RFC v3 27/30] pkg-luarocks: add support for
	per-package staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-28-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-luarocks.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index 83f338e..4bdaff3 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -59,7 +59,10 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($(2)_SRCDIR) && \
-		$$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPTS)
+		$$(LUAROCKS_RUN) make --keep $$($(2)_ROCKSPEC) \
+		$$($(2)_BUILD_OPTS) OPENSSL_DIR=$$(STAGING_DIR)/usr \
+		EXPAT_DIR=$$(STAGING_DIR)/usr ZLIB_DIR=$$(STAGING_DIR)/usr \
+		SQLITE_DIR=$$(STAGING_DIR)/usr
 endef
 endif
 
-- 
2.3.1
