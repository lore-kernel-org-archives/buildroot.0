From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 8 Mar 2017 00:50:51 +0100
Subject: [Buildroot] [PATCH 3/6] qt: remove broken iBase driver
In-Reply-To: <20170307235054.25149-1-arnout@mind.be>
References: <20170307235054.25149-1-arnout@mind.be>
Message-ID: <20170307235054.25149-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option has been marked as broken since 2010. No need for legacy
handling.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt/Config.sql.in | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/qt/Config.sql.in b/package/qt/Config.sql.in
index 452edd5133..5bd63d27a0 100644
--- a/package/qt/Config.sql.in
+++ b/package/qt/Config.sql.in
@@ -14,13 +14,6 @@ config BR2_PACKAGE_QT_MYSQL
 	  Build MySQL driver
 	  If unsure, say n.
 
-config BR2_PACKAGE_QT_IBASE
-	bool "iBase Driver"
-	depends on BROKEN # libfbclient not in BR
-	help
-	  Build iBase driver
-	  If unsure, say n.
-
 config BR2_PACKAGE_QT_ODBC
 	bool "ODBC Driver"
 	select BR2_PACKAGE_UNIXODBC
-- 
2.11.0
