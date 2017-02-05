From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 22:47:29 +0100
Subject: [Buildroot] [git commit] docs/website: switching from gmane to
	nabble
Message-ID: <20170205214745.79C0B80525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18426200e629166595d7f35f3cd7647698f5b7e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gmane mailing list infrastructure is broken from some time,
switching to nabble both for rss and search services.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/website/js/buildroot.js | 2 +-
 docs/website/support.html    | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/website/js/buildroot.js b/docs/website/js/buildroot.js
index 83983e6..da43664 100644
--- a/docs/website/js/buildroot.js
+++ b/docs/website/js/buildroot.js
@@ -87,7 +87,7 @@ jQuery(document).ready(function($) {
     url = url.split(/[\\/]/).pop()
     $('.nav a[href="/' + url + '"]').parent().addClass('active');
 
-    load_activity("http://rss.gmane.org/topics/excerpts/gmane.comp.lib.uclibc.buildroot", "mailing-list-activity");
+    load_activity("http://buildroot-busybox.2317881.n4.nabble.com/Buildroot-busybox-ft2.xml", "mailing-list-activity");
     load_activity("http://git.buildroot.org/buildroot/atom/?h=master", "commit-activity");
 
     $('#slides').html('<iframe src="https://docs.google.com/gview?url=http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf&embedded=true" style="position:absolute; width:100%; height:100%; top:0; left:0;" frameborder="0"></iframe>')
diff --git a/docs/website/support.html b/docs/website/support.html
index 92ee03b..a1184c8 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -50,9 +50,11 @@
 		    list, since there is a good chance someone else has asked the same question
 		    before.</p>
 
-		  <form method="get" action="http://search.gmane.org/">
+		  <form method="get" action="http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp">
 		    <input type="text" name="query">
-		    <input type="hidden" name="group" value="gmane.comp.lib.uclibc.buildroot">
+		    <input type="hidden" name="macro" value="search_page">
+		    <input type="hidden" name="node" value="2">
+		    <input type="hidden" name="sort" value="date">
 		    <button type="submit" class="btn btn-default">Submit</button>
 		  </form>
 		</div>
