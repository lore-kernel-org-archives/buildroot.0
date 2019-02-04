From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  4 Feb 2019 15:17:20 +0100
Subject: [Buildroot] [PATCH 2/3] docs/website/js/buildroot.js: Fix possible
 type coercion
In-Reply-To: <20190204141721.8203-1-aduskett@gmail.com>
References: <20190204141721.8203-1-aduskett@gmail.com>
Message-ID: <20190204141721.8203-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

With javascript, when comparing variables, using === instead of ==
is preferred.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 docs/website/js/buildroot.js | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index dac912c160..5250b4ff8f 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -12,7 +12,7 @@ function load_activity(feedurl, divid) {
         if (result==null) return;
         for (let i = 0; i < result.feed.length; i++) {
             let entry = result.feed[i].entry;
-            if (entry.title.indexOf("git commit") != -1)
+            if (entry.title.indexOf("git commit") !== -1)
                 continue;
             loaded += 1;
             if (loaded > nb_display)
@@ -45,7 +45,7 @@ function google_analytics() {
     let ga = document.createElement('script');
     ga.type = 'text/javascript';
     ga.async = true;
-    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+    ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     let s = document.getElementsByTagName('script')[0];
     s.parentNode.insertBefore(ga, s);
 }
@@ -68,7 +68,7 @@ clipboard.on('success', function(e) {
 
 $(function() {
   $('a[href*=\\#]:not([href=\\#])').click(function() {
-    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
+    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
       let target = $(this.hash);
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
-- 
2.17.2 (Apple Git-113)
