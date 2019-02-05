From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 09:43:09 +0100
Subject: [Buildroot] [git commit] docs/website/js/buildroot.js: switch var
 to let
Message-ID: <20190205084223.717DA82C1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=385e08d54f4b193e4b973a37a55455a33ee272dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In javascript, let is preferred for local, var is preferred for global.
Change any local variables from "var" to "let"

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Acked-by: <angelo@amarulasolutions.com>
Tested-by: <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index fa5ad9a78e..3e6ff0d20b 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,51 +1,51 @@
 function load_activity(feedurl, divid) {
-    var container = document.getElementById(divid);
+    let container = document.getElementById(divid);
     $.ajax({
       url: "https://cors.io/?" + feedurl
     })
     .done(function(data){
-        var x2js = new X2JS();
-        var result = x2js.xml_str2json(data);
-        var loaded = 0;
-        var nb_display = 8;
+        let x2js = new X2JS();
+        let result = x2js.xml_str2json(data);
+        let loaded = 0;
+        let nb_display = 8;
         if (result==null) return;
-        for (var i = 0; i < result.feed.entry.length; i++) {
-            var entry = result.feed.entry[i];
+        for (let i = 0; i < result.feed.entry.length; i++) {
+            let entry = result.feed.entry[i];
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
             link.href = entry.link._href;
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
 
@@ -54,7 +54,7 @@ function showTooltip(elem, msg) {
     elem.setAttribute('aria-label', msg);
 }
 
-var clipboard = new Clipboard('.btn');
+let clipboard = new Clipboard('.btn');
 
 $(function () {
   $('[data-toggle="tooltip"]').tooltip()
@@ -68,7 +68,7 @@ clipboard.on('success', function(e) {
 $(function() {
   $('a[href*=\\#]:not([href=\\#])').click(function() {
     if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
-      var target = $(this.hash);
+        let target = $(this.hash);
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
         $('html,body').animate({
@@ -81,7 +81,7 @@ $(function() {
 });
 
 jQuery(document).ready(function($) {
-    var url = window.location.href;
+    let url = window.location.href;
     // Get the basename of the URL
     url = url.split(/[\\/]/).pop()
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
