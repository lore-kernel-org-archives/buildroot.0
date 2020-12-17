From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 17 Dec 2020 16:22:08 +0300
Subject: [Buildroot] [PATCH 2/2] package/timescaledb: add dependency on
 postgresql 12
In-Reply-To: <20201217132208.778308-1-fido_max@inbox.ru>
References: <20201217132208.778308-1-fido_max@inbox.ru>
Message-ID: <20201217132208.778308-3-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TimescaleDB 1.7.4 does not support postgresql 13.
PostgreSQL 12 must be selected to build timescaledb.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/timescaledb/Config.in b/package/timescaledb/Config.in
index af4a868527..f0e1c2e9b2 100644
--- a/package/timescaledb/Config.in
+++ b/package/timescaledb/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TIMESCALEDB
 	bool "timescaledb"
 	depends on BR2_PACKAGE_POSTGRESQL
+	depends on BR2_POSTGRESQL_VERSION_12
 	help
 	  TimescaleDB is an open-source database designed
 	  to make SQL scalable for time-series data.
-- 
2.29.2
