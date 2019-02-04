From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  4 Feb 2019 15:17:21 +0100
Subject: [Buildroot] [PATCH 3/3] docs/website/js/buildroot.js: Fix
 unterminated statements
In-Reply-To: <20190204141721.8203-1-aduskett@gmail.com>
References: <20190204141721.8203-1-aduskett@gmail.com>
Message-ID: <20190204141721.8203-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

Some statements are missing their semicolons.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 docs/website/js/buildroot.js | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 5250b4ff8f..4f36941ac3 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -20,7 +20,7 @@ function load_activity(feedurl, divid) {
             let div = document.createElement("p");
             let link = document.createElement("a");
             let d = new Date(entry.published);
-            let data = '[' + d.toLocaleDateString() + '] ' + entry.title
+            let data = '[' + d.toLocaleDateString() + '] ' + entry.title;
             let text = document.createTextNode(data);
             link.appendChild(text);
             link.title = entry.title;
@@ -59,7 +59,7 @@ let clipboard = new Clipboard('.btn');
 
 $(function () {
   $('[data-toggle="tooltip"]').tooltip()
-})
+});
 
 clipboard.on('success', function(e) {
     e.clearSelection();
-- 
2.17.2 (Apple Git-113)
