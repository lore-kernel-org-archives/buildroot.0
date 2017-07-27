From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 27 Jul 2017 09:35:48 -0400
Subject: [Buildroot] [PATCH 1/1] host-mariadb: add host-openssl dependency
Message-ID: <20170727133548.30285-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fedora26, openssl 1.1.x is included by default.  This causes build errors
when building the host variant of mariadb. Adding host-openssl as a dependency
fixes this issue.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/mariadb/mariadb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1d6c2bcc4..8004709c7 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -22,6 +22,9 @@ MARIADB_DEPENDENCIES = \
 	libxml2 \
 	readline
 
+HOST_MARIADB_DEPENDENCIES = \
+	host-openssl
+
 # We won't need unit tests
 MARIADB_CONF_OPTS += -DWITH_UNIT_TESTS=0
 
-- 
2.13.3
