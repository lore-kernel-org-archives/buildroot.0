From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon,  4 Feb 2019 14:28:11 +0100
Subject: [Buildroot] [PATCH v3] docs/website: consolidate CDN's and enable
 SRI
Message-ID: <1549286891-10671-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Some of our cdn's are going discontinued (rawgit) and some others are
not recommended anymore, thus we update to the recommended cdnjs.
This patch enables also SRI protection on js to be sure the modules we
download are not manipulated in any way.

About SRI:
https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
[v1 -> v2]:
* Fixing wrong CDN for bootswatch
* Fixing commit message

[v2 -> v3]:
* Better commit message
* Giving sha256 to bootswatch SRI for conformity with the other cdns sri

 docs/website/footer.html | 6 +++---
 docs/website/header.html | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 2811fc5..5b18047 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,6 +1,6 @@
-	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
-	<script src="https://oss.maxcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
-	<script src="https://cdn.rawgit.com/zenorocha/clipboard.js/v1.7.1/dist/clipboard.min.js"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha256-U5ZEeKfGNOja007MMD3YBI0A3OSZOQbeG6z2f2Y0hu8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script type="text/javascript" src="js/buildroot.js"></script>
 </body>
 </html>
diff --git a/docs/website/header.html b/docs/website/header.html
index ef6724f..a6f16e6 100644
--- a/docs/website/header.html
+++ b/docs/website/header.html
@@ -10,12 +10,12 @@
 
 	<title>Buildroot - Making Embedded Linux Easy</title>
 
-	<link href="https://oss.maxcdn.com/bootswatch/3.3.7/paper/bootstrap.min.css" rel="stylesheet">
+	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/paper/bootstrap.min.css" integrity="sha256-LxKiHTQko0DUCUSgrIK23SYMymvfuj8uxXmblBvVWm0=" crossorigin="anonymous">
 	<link href="css/main.css" rel="stylesheet">
 
 	<!--[if lt IE 9]>
-	  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
-	  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
+	  <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.0/html5shiv.js" integrity="sha256-jHqcBHBWM2erADB7T7m7MFLQon8LlOY7ncC7jDaUScs=" crossorigin="anonymous"></script>
+	  <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.3.0/respond.min.js" integrity="sha256-g2lnLPqUkGXj7GDW+Zy47+O2ph+Ur1cmtdklVqkj+kg=" crossorigin="anonymous"></script>
 	<![endif]-->
 </head>
 
-- 
2.7.4
