From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Aug 2014 09:01:38 +0200
Subject: [Buildroot] [PATCH 1/1] postgresql: remove devfiles from target
In-Reply-To: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
References: <1407605679-15342-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <b8f2dfad-6831-48d9-a7fa-c4775bbcf0a6@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris Bos <bos@je-eigen-domein.nl> schreef:
>Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>---
> package/postgresql/postgresql.mk | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
>index 0fecbc7..6d71b9c 100644
>--- a/package/postgresql/postgresql.mk
>+++ b/package/postgresql/postgresql.mk
>@@ -51,6 +51,8 @@ endef
> 
> define POSTGRESQL_INSTALL_TARGET_FIXUP
> 	$(INSTALL) -dm 0700 $(TARGET_DIR)/var/lib/pgsql
>+	rm -f $(TARGET_DIR)/usr/bin/pg_config
>+	rm -rf $(TARGET_DIR)/usr/lib/postgresql/pgxs
> endef

Not entirely sure here, but isn't the better approach for pg_config to add it to POSTGRESQL_CONFIG_SCRIPTS? This will ensure the file is fixed up for staging usr, and removed from target automatically.
