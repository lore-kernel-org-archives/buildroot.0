From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 08:08:12 -0400
Subject: [Buildroot] [PATCH v2 12/14] postgresql: support libressl
In-Reply-To: <20170731120815.5315-1-aduskett@gmail.com>
References: <20170731120815.5315-1-aduskett@gmail.com>
Message-ID: <20170731120815.5315-12-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
Changes v1 -> v2:
  - None.

 package/postgresql/postgresql.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 62b41cbea..a8de14572 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -54,7 +54,11 @@ POSTGRESQL_CONF_ENV += ZIC="$(ZIC)"
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-POSTGRESQL_DEPENDENCIES += openssl
+BR2_PACKAGE_OPENSSL += openssl
+POSTGRESQL_CONF_OPTS += --with-openssl
+endif
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+BR2_PACKAGE_OPENSSL += libressl
 POSTGRESQL_CONF_OPTS += --with-openssl
 endif
 
-- 
2.13.3
