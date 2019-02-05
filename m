From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Feb 2019 09:43:27 +0100
Subject: [Buildroot] [git commit] docs/website/js/buildroot.js: fix
 unterminated statements
Message-ID: <20190205084223.7EE3F800AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcf418d0a49c843b27a695f7647556535b50ac5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some statements are missing their semicolons.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Acked-by: <angelo@amarulasolutions.com>
Tested-by: <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/js/buildroot.js | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 1b08f9b4df..48fafa67ac 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -19,7 +19,7 @@ function load_activity(feedurl, divid) {
             let div = document.createElement("p");
             let link = document.createElement("a");
             let d = new Date(entry.published);
-            let data = '[' + d.toLocaleDateString() + '] ' + entry.title
+            let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
             let text = document.createTextNode(data);
             link.appendChild(text);
             link.title = entry.title;
@@ -58,7 +58,7 @@ let clipboard = new Clipboard('.btn');
 
 $(function () {
   $('[data-toggle="tooltip"]').tooltip()
-})
+});
 
 clipboard.on('success', function(e) {
     e.clearSelection();
@@ -83,7 +83,7 @@ $(function() {
 jQuery(document).ready(function($) {
     let url = window.location.href;
     // Get the basename of the URL
-    url = url.split(/[\\/]/).pop()
+    url = url.split(/[\\/]/).pop();
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
 
     load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
