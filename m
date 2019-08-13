From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 15:13:19 +0200
Subject: [Buildroot] [PATCH buildroot-test v3 3/3] web/index.php: add
 support for configuration symbols via GET
In-Reply-To: <20190813131319.14860-1-victor.huesca@bootlin.com>
References: <20190813131319.14860-1-victor.huesca@bootlin.com>
Message-ID: <20190813131319.14860-4-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add support of a 'symbols[<symbol>]=<value>' option via GET
as it is done with other fields.

This syntax allows to pass multiple configuration symbols and values
while keeping the URL clean.

This interface allows to search configurations with specific symbols and
values.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/index.php | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/web/index.php b/web/index.php
index 0c79aa6..503e5ad 100644
--- a/web/index.php
+++ b/web/index.php
@@ -62,6 +62,9 @@ if (isset ($_GET['submitter']))
 if (isset($_GET['date']))
   $filters["date"] = $_GET['date'];
 
+if (isset($_GET['symbols']) && is_array($_GET['symbols']))
+  $filters['symbols'] = $_GET['symbols'];
+
 bab_header("Buildroot tests");
 
 echo "<table>\n";
-- 
2.21.0
