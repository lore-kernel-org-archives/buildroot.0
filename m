From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Fri, 16 Dec 2011 17:22:59 +0100
Subject: [Buildroot] [git commit] repair ML search knob
Message-ID: <20111216162639.C10718FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0bf480856ecec5c5f27622b36a9800172f41f865
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 docs/lists.html |   24 ++++++++++++++----------
 1 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/docs/lists.html b/docs/lists.html
index 31d47d4..b806d77 100644
--- a/docs/lists.html
+++ b/docs/lists.html
@@ -21,16 +21,20 @@ list with frequently asked questions...
 <p>
 
 <center>
-<form method="GET" action="http://www.google.com/custom">
-<input type="hidden" name="domains" value="lists.busybox.net">
-<input type="hidden" name="sitesearch" value="lists.busybox.net">
-<input type="text" name="q" size="31" maxlength="255" value="">
-<br>
-<input type="submit" name="sa" value="search the mailing list archives">
-<br>
-<a href="http://www.google.com/"><img src="http://www.google.com/logos/Logo_25wht.gif" border="0" alt="Google" height="32" width="75" align="middle"></a>
-<br>
-</form>
+<div id="cse" style="width: 100%;">Loading</div>
+<script src="http://www.google.com/jsapi" type="text/javascript"></script>
+<script type="text/javascript">
+	google.load('search', '1', {language : 'en'});
+	google.setOnLoadCallback(function() {
+		var customSearchControl = new google.search.CustomSearchControl(
+					      '009810735161915413714:3rfmqierl8s');
+		customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
+		var customSearchOptions = new google.search.DrawOptions();
+		customSearchOptions.enableSearchboxOnly("http://google.com/cse?cx=009810735161915413714:3rfmqierl8s");
+		customSearchControl.draw('cse', customSearchOptions);
+	}, true);
+</script>
+<link rel="stylesheet" href="http://www.google.com/cse/style/look/default.css" type="text/css" />
 </center>
 
 <!--#include file="footer.html" -->
