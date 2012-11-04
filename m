From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  4 Nov 2012 18:37:37 +0100
Subject: [Buildroot] [PATCH] pkg-stats: fix the broken "results" link
Message-ID: <1352050657-919-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the top of the output html page there is a dangling "results" link.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/scripts/pkg-stats |    1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9c8ec49..929b8d1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -227,6 +227,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 done
 echo "</table>"
 
+echo "<a id="results"></a>"
 echo "<table>"
 echo "<tr>"
 echo "<td>Packages using the <i>generic</i> infrastructure</td>"
-- 
1.7.9.5
