From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 09:43:25 +0100
Subject: [Buildroot] [git commit] docs/website/js/buildroot.js: fix possible
 type coercion
Message-ID: <20190205084223.77002800AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fac5df7e6f6ba92005082aeaabcca5ed69d7667
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With javascript, when comparing variables, using === instead of ==
is preferred.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Acked-by: <angelo@amarulasolutions.com>
Tested-by: <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 3e6ff0d20b..1b08f9b4df 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -11,7 +11,7 @@ function load_activity(feedurl, divid) {
         if (result==null) return;
         for (let i = 0; i < result.feed.entry.length; i++) {
             let entry = result.feed.entry[i];
-            if (entry.title.indexOf("git commit") != -1)
+            if (entry.title.indexOf("git commit") !== -1)
                 continue;
             loaded += 1;
             if (loaded > nb_display)
@@ -44,7 +44,7 @@ function google_analytics() {
     let ga = document.createElement('script');
     ga.type = 'text/javascript';
     ga.async = true;
-    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
+    ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
     let s = document.getElementsByTagName('script')[0];
     s.parentNode.insertBefore(ga, s);
 }
@@ -67,7 +67,7 @@ clipboard.on('success', function(e) {
 
 $(function() {
   $('a[href*=\\#]:not([href=\\#])').click(function() {
-    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
+    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') && location.hostname === this.hostname) {
         let target = $(this.hash);
       target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
       if (target.length) {
