From: Lionel Orry <lionel.orry@gmail.com>
Date: Wed, 20 May 2015 09:41:59 +0200
Subject: [Buildroot] [PATCH v2 1/1] autobuild web/rss: Fix base url for
	results
Message-ID: <1432107719-29817-1-git-send-email-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes the base url previously pointing at
http://buildroot.humanoidz.org to the right base url
http://autobuild.buildroot.org.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>

---
Changes v1 -> v2:
  - Correct the commit short text which was wrong

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 web/rss.php | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/web/rss.php b/web/rss.php
index fee8cd7..8b02a07 100644
--- a/web/rss.php
+++ b/web/rss.php
@@ -26,7 +26,7 @@ $results = bab_get_results(0, 50);
 echo " <items>\n";
 echo "  <rdf:Seq>\n";
 while ($current = mysql_fetch_object($results))
-  echo "<rdf:li rdf:resource=\"http://buildroot.humanoidz.org/results/" .
+  echo "<rdf:li rdf:resource=\"http://autobuild.buildroot.org/results/" .
     $current->identifier . "\"/>\n";
 echo "  </rdf:Seq>\n";
 echo " </items>\n";
@@ -35,7 +35,7 @@ echo "</channel>\n";
 mysql_data_seek($results, 0);
 
 while ($current = mysql_fetch_object($results)) {
-  echo " <item rdf:about=\"http://buildroot.humanoidz.org/results/" .
+  echo " <item rdf:about=\"http://autobuild.buildroot.org/results/" .
     $current->identifier . "\">\n";
 
   if ($current->status == 0)
@@ -46,7 +46,7 @@ while ($current = mysql_fetch_object($results)) {
     $status = "timed out";
 
     echo "  <title>Build " . $status . " at " . $current->builddate . "</title>\n";
-    echo "  <link>http://buildroot.humanoidz.org/results/" .
+    echo "  <link>http://autobuild.buildroot.org/results/" .
       $current->identifier . "</link>\n";
     echo "  <description>\n";
     if ($current->status == 0) {
-- 
2.1.0
