From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  9 Oct 2019 17:23:06 +0200
Subject: [Buildroot] [PATCH] docs/website: fixing cors request access
Message-ID: <1570634586-29441-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The service we were using for cors proxing disappeared rendering the
bottom part of website not working.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 docs/website/js/buildroot.js | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 48fafa6..bf80f11 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -1,11 +1,11 @@
 function load_activity(feedurl, divid) {
     let container = document.getElementById(divid);
     $.ajax({
-      url: "https://cors.io/?" + feedurl
+      url: "https://cors-anywhere.herokuapp.com/" + feedurl
     })
     .done(function(data){
         let x2js = new X2JS();
-        let result = x2js.xml_str2json(data);
+        let result = x2js.xml_str2json(data.documentElement.outerHTML);
         let loaded = 0;
         let nb_display = 8;
         if (result==null) return;
-- 
2.7.4
