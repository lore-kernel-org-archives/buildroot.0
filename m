From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 00:38:20 +0200
Subject: [Buildroot] [PATCH 5/5] docs/manual: document rt-graph-depends and
	<pkg>-rt-graph-depends
In-Reply-To: <cover.1439159331.git.yann.morin.1998@free.fr>
References: <cover.1439159331.git.yann.morin.1998@free.fr>
Message-ID: <fbaad2935f74aebe3ab32466f404238afd1c0dc6.1439159331.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 5b27b1f..9a7c6f2 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -227,6 +227,32 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 BR2_GRAPH_DEPS_OPTS='-d 3 --no-transitive --colours=red,green,blue' make graph-depends
 --------------------------------
 
+Finally, there is a special dependency graph which displays the
+status of the build, coloring packages as they are extracted,
+patched, configured, built and installed. Once your build is
+on-going in a console, you can run, from another console:
+
+---------------------
+make rt-graph-depends
+---------------------
+
+And open the resulting graph with your favourite viewer. The graph
+is updated in near-realtime, so you can reload it from time to time
+to see the progress. Some viewers (e.g. `evince` for PDF, `geeqie`
+for images) will auto-reload the file as soon as it changes, so you
+get to see the progress automatically!
+
+As for `graph-depends`, you can limit the graph to a specific package's
+dependencies with `<pkg>-rt-graph-depends`, like so:
+
+---------------------------
+make <pkg>-rt-graph-depends
+---------------------------
+
+.Note
+`make rt-graph-depends` and `make <pkg>-rt-graph-depends` never
+terminate. You have to terminate them manually, with `Ctrl-C`.
+
 === Graphing the build duration
 
 [[graph-duration]]
-- 
1.9.1
