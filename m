From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  3 Nov 2014 00:58:15 +0100
Subject: [Buildroot] [PATCH 2/3] website: Fix indent
In-Reply-To: <1414972696-10647-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414972696-10647-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414972696-10647-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 docs/js/buildroot.js | 80 +++++++++++++++++++++++++++-------------------------
 1 file changed, 41 insertions(+), 39 deletions(-)

diff --git a/docs/js/buildroot.js b/docs/js/buildroot.js
index 6e0d97a..dd6ca6e 100644
--- a/docs/js/buildroot.js
+++ b/docs/js/buildroot.js
@@ -2,61 +2,63 @@ function load_activity(feedurl, divid) {
     var feed = new google.feeds.Feed(feedurl);
     feed.setNumEntries(30);
     feed.load(function(result) {
-      if (!result.error) {
-        var container = document.getElementById(divid);
-        var loaded = 0;
-        var nb_display = 8;
-        for (var i = 0; i < result.feed.entries.length; i++) {
-          var entry = result.feed.entries[i];
-          if (entry.title.indexOf("git commit") != -1)
-            continue;
-          loaded += 1;
-          if (loaded > nb_display)
-            break;
-          var div = document.createElement("p");
-          var link = document.createElement("a");
-          var d = new Date(entry.publishedDate);
-          var data = '[' + d.toLocaleDateString() + '] ' + entry.title
-          var text = document.createTextNode(data);
-          link.appendChild(text);
-          link.title = entry.title;
-          link.href = entry.link
-          div.appendChild(link);
-          container.appendChild(div);
+        if (!result.error) {
+            var container = document.getElementById(divid);
+            var loaded = 0;
+            var nb_display = 8;
+            for (var i = 0; i < result.feed.entries.length; i++) {
+                var entry = result.feed.entries[i];
+                if (entry.title.indexOf("git commit") != -1)
+                    continue;
+                loaded += 1;
+                if (loaded > nb_display)
+                    break;
+                var div = document.createElement("p");
+                var link = document.createElement("a");
+                var d = new Date(entry.publishedDate);
+                var data = '[' + d.toLocaleDateString() + '] ' + entry.title
+                var text = document.createTextNode(data);
+                link.appendChild(text);
+                link.title = entry.title;
+                link.href = entry.link
+                div.appendChild(link);
+                container.appendChild(div);
+            }
+            var empty = nb_display - loaded;
+            for (var i = 0; i < empty; i++) {
+                container.appendChild(document.createElement("p"));
+            }
         }
-        var empty = nb_display - loaded;
-        for (var i = 0; i < empty; i++) {
-          container.appendChild(document.createElement("p"));
-        }
-      }
     });
 }
 
 function initialize() {
-  load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
-  load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
+    load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
+    load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
 }
 
 function google_analytics() {
-  var _gaq = _gaq || [];
-  _gaq.push(['_setAccount', 'UA-21761074-1']);
-  _gaq.push(['_setDomainName', 'none']);
-  _gaq.push(['_setAllowLinker', true]);
-  _gaq.push(['_trackPageview']);
+    var _gaq = _gaq || [];
+    _gaq.push(['_setAccount', 'UA-21761074-1']);
+    _gaq.push(['_setDomainName', 'none']);
+    _gaq.push(['_setAllowLinker', true]);
+    _gaq.push(['_trackPageview']);
 
-  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
-  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
-  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
+    var ga = document.createElement('script');
+    ga.type = 'text/javascript';
+    ga.async = true;
+    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+    var s = document.getElementsByTagName('script')[0];
+    s.parentNode.insertBefore(ga, s);
 }
 
 google.load("feeds", "1");
 google.setOnLoadCallback(initialize);
 google_analytics();
 
-jQuery(document).ready(function($){
+jQuery(document).ready(function($) {
     var url = window.location.href;
     // Get the basename of the URL
     url = url.split(/[\\/]/).pop()
-    $('.nav a[href="/'+url+'"]').parent().addClass('active');
+    $('.nav a[href="/' + url + '"]').parent().addClass('active');
 });
-
-- 
2.1.1
