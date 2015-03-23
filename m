From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Mar 2015 23:56:33 +0100
Subject: [Buildroot] [PATCH 4/4] docs/manual: document new graph-depends
	options
In-Reply-To: <cover.1427150990.git.yann.morin.1998@free.fr>
References: <cover.1427150990.git.yann.morin.1998@free.fr>
Message-ID: <f9b988d14b88cd502a3ae47739597e45882bf1f3.1427150990.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 docs/manual/common-usage.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 89cd9fe..5b27b1f 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -208,6 +208,14 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 * +--depth N+, +-d N+, to limit the dependency depth to +N+ levels. The
   default, +0+, means no limit.
 
+* +--stop-on PKG+, +-s PKG+, to stop the graph on the package +PKG+.
+  +PKG+ can be an actual package name, a glob, or the keyword 'virtual'
+  (to stop on virtual packages). The package is still present on the
+  graph, but its dependencies are not.
+
+* +--exclude PKG+, +-x PKG+, like +--stop-on+, but also omits +PKG+ from
+  the graph.
+
 * +--transitive+, +--no-transitive+, to draw (or not) the transitive
   dependencies. The default is to not draw transitive dependencies.
 
-- 
1.9.1
