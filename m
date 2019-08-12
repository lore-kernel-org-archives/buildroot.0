From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon, 12 Aug 2019 16:43:44 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/2] web/funcs.inc.php: fix
 'bab_format_sql_filter' indentation
In-Reply-To: <20190812144345.26794-1-victor.huesca@bootlin.com>
References: <20190812144345.26794-1-victor.huesca@bootlin.com>
Message-ID: <20190812144345.26794-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'bab_format_sql_filter' function uses tabs indentation whereas the
overall file uses two spaces. This patch simply replace those tabs by
spaces for consistency.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/funcs.inc.php | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/web/funcs.inc.php b/web/funcs.inc.php
index 7e912c1..9582e50 100644
--- a/web/funcs.inc.php
+++ b/web/funcs.inc.php
@@ -32,29 +32,29 @@ function bab_footer()
 
 function bab_format_sql_filter($db, $filters)
 {
-	$status_map = array(
-		"OK" => 0,
-		"NOK" => 1,
-		"TIMEOUT" => 2,
-	);
+  $status_map = array(
+    "OK" => 0,
+    "NOK" => 1,
+    "TIMEOUT" => 2,
+  );
 
-	$sql_filters = implode(' and ', array_map(
-		function ($v, $k) use ($db, $status_map) {
-			if ($k == "reason")
-				return sprintf("%s like %s", $k, $db->quote_smart($v));
-			else if ($k == "status")
-				return sprintf("%s=%s", $k, $db->quote_smart($status_map[$v]));
-			else
-				return sprintf("%s=%s", $k, $db->quote_smart($v));
-		},
-		$filters,
-		array_keys($filters)
-	));
+  $sql_filters = implode(' and ', array_map(
+    function ($v, $k) use ($db, $status_map) {
+      if ($k == "reason")
+        return sprintf("%s like %s", $k, $db->quote_smart($v));
+      else if ($k == "status")
+        return sprintf("%s=%s", $k, $db->quote_smart($status_map[$v]));
+      else
+        return sprintf("%s=%s", $k, $db->quote_smart($v));
+    },
+    $filters,
+    array_keys($filters)
+  ));
 
-	if (count($filters))
-		return "where " . $sql_filters;
-	else
-		return "";
+  if (count($filters))
+    return "where " . $sql_filters;
+  else
+    return "";
 }
 
 /*
-- 
2.21.0
