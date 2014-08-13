From: Floris Bos <bos@je-eigen-domein.nl>
Date: Wed, 13 Aug 2014 15:57:10 +0200
Subject: [Buildroot] [PATCH v2 2/3] postgresql: remove devfiles from target
In-Reply-To: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407938231-22544-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <1407938231-22544-2-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index dd2e678..19f9163 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -52,6 +52,7 @@ endef
 
 define POSTGRESQL_INSTALL_TARGET_FIXUP
 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
+	$(RM) -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
 endef
 
 POSTGRESQL_POST_INSTALL_TARGET_HOOKS += POSTGRESQL_INSTALL_TARGET_FIXUP
-- 
1.8.3.2
