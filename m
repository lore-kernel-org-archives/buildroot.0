From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2019 22:52:11 +0200
Subject: [Buildroot] [git commit] docs/website: fixing cors request access
Message-ID: <20191009204819.686A28B8E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=198ef6b936b10eddb667e8e8e11d6b56e5a7629f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The service we were using for cors proxing disappeared rendering the
bottom part of website not working.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/js/buildroot.js | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 48fafa67ac..bf80f11d7a 100644
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
