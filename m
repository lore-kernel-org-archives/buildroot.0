From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  4 Feb 2019 15:17:19 +0100
Subject: [Buildroot] [PATCH 1/3] docs/website/js/buildroot.js: switch var to
 let
Message-ID: <20190204141721.8203-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

In javascript, let is preferred for local, var is preferred for global.
Change any local variables from "var" to "let"

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 docs/website/js/buildroot.js | 46 ++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index ec28cbb750..dac912c160 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,52 +1,52 @@
 function load_activity(feedurl, divid) {
-    var yqlURL = "https://query.yahooapis.com/v1/public/yql";
-    var yqlQS = "?q=select%20entry%20from%20xml%20where%20url%20%3D%20'";
-    var yqlOPTS = "'%20limit%2010&format=json&callback=";
-    var container = document.getElementById(divid);
-    var url = yqlURL + yqlQS + encodeURIComponent(feedurl) + yqlOPTS;
+    let yqlURL = "https://query.yahooapis.com/v1/public/yql";
+    let yqlQS = "?q=select%20entry%20from%20xml%20where%20url%20%3D%20'";
+    let yqlOPTS = "'%20limit%2010&format=json&callback=";
+    let container = document.getElementById(divid);
+    let url = yqlURL + yqlQS + encodeURIComponent(feedurl) + yqlOPTS;
 
     $.getJSON(url, function(data){
-        var result = data.query.results;
-        var loaded = 0;
-        var nb_display = 8;
+        let result = data.query.results;
+        let loaded = 0;
+        let nb_display = 8;
         if (result==null) return;
-        for (var i = 0; i < result.feed.length; i++) {
-            var entry = result.feed[i].entry;
+        for (let i = 0; i < result.feed.length; i++) {
+            let entry = result.feed[i].entry;
             if (entry.title.indexOf("git commit") != -1)
                 continue;
             loaded += 1;
             if (loaded > nb_display)
                 break;
-            var div = document.createElement("p");
-            var link = document.createElement("a");
-            var d = new Date(entry.published);
-            var data = '[' + d.toLocaleDateString() + '] ' + entry.title
-            var text = document.createTextNode(data);
+            let div = document.createElement("p");
+            let link = document.createElement("a");
+            let d = new Date(entry.published);
+            let data = '[' + d.toLocaleDateString() + '] ' + entry.title
+            let text = document.createTextNode(data);
             link.appendChild(text);
             link.title = entry.title;
             link.href = entry.link.href;
             div.appendChild(link);
             container.appendChild(div);
         }
-        var empty = nb_display - loaded;
-        for (var i = 0; i < empty; i++) {
+        let empty = nb_display - loaded;
+        for (let i = 0; i < empty; i++) {
             container.appendChild(document.createElement("p"));
         }
     });
 }
 
 function google_analytics() {
-    var _gaq = _gaq || [];
+    let _gaq = _gaq || [];
     _gaq.push(['_setAccount', 'UA-21761074-1']);
     _gaq.push(['_setDomainName', 'none']);
     _gaq.push(['_setAllowLinker', true]);
     _gaq.push(['_trackPageview']);
 
-    var ga = document.createElement('script');
+    let ga = document.createElement('script');
     ga.type = 'text/javascript';
     ga.async = true;
     ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
-    var s = document.getElementsByTagName('script')[0];
+    let s = document.getElementsByTagName('script')[0];
     s.parentNode.insertBefore(ga, s);
 }
 
@@ -55,7 +55,7 @@ function showTooltip(elem, msg) {
     elem.setAttribute('aria-label', msg);
 }
 
-var clipboard = new Clipboard('.btn');
+let clipboard = new Clipboard('.btn');
 
 $(function () {
   $('[data-toggle="tooltip"]').tooltip()
@@ -69,7 +69,7 @@ clipboard.on('success', function(e) {
 $(function() {
   $('a[href*=\\#]:not([href=\\#])').click(function() {
     if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
-      var target = $(this.hash);
+      let target = $(this.hash);
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
         $('html,body').animate({
@@ -82,7 +82,7 @@ $(function() {
 });
 
 jQuery(document).ready(function($) {
-    var url = window.location.href;
+    let url = window.location.href;
     // Get the basename of the URL
     url = url.split(/[\\/]/).pop()
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
-- 
2.17.2 (Apple Git-113)
