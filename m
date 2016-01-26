From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 21:18:54 +0100
Subject: [Buildroot] [PATCH 3/3] docs/manual: update graph-depends
	documentation about --stop-on
In-Reply-To: <1453839534-3912-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453839534-3912-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1453839534-3912-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the graph-depends documentation to take into
account the new 'host' keyword that can be passed to the --stop-on and
--exclude options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index bca99f4..01cd31e 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -212,9 +212,10 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   default, +0+, means no limit.
 
 * +--stop-on PKG+, +-s PKG+, to stop the graph on the package +PKG+.
-  +PKG+ can be an actual package name, a glob, or the keyword 'virtual'
-  (to stop on virtual packages). The package is still present on the
-  graph, but its dependencies are not.
+  +PKG+ can be an actual package name, a glob, the keyword 'virtual'
+  (to stop on virtual packages), or the keyword 'host' (to stop on
+  host packages). The package is still present on the graph, but its
+  dependencies are not.
 
 * +--exclude PKG+, +-x PKG+, like +--stop-on+, but also omits +PKG+ from
   the graph.
-- 
2.6.4
