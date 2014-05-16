From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 23:05:20 +0200
Subject: [Buildroot] [PATCH 8/8] manual: document the new graph-depends
	options
In-Reply-To: <cover.1400273945.git.yann.morin.1998@free.fr>
References: <cover.1400273945.git.yann.morin.1998@free.fr>
Message-ID: <62b0daddcbd6ba88226ca7cb658b9ad021168b56.1400273945.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 docs/manual/common-usage.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index 772982a..9817915 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -94,6 +94,8 @@ to +make+ or set in the environment:
   default), or +png+.
 * +BR2_GRAPH_DEPS_OPTS+ to pass extra options to the dependency graph; see
   xref:graph-depends[] for the accepted options
+* +BR2_GRAPH_DOT_OPTS+ is passed verbatim as options to the +dot+ utility to
+  draw the dependency graph.
 
 An example that uses config files located in the toplevel directory and
 in your $HOME:
@@ -204,6 +206,9 @@ The +graph-depends+ behaviour can be controlled by setting options in the
 * +--depth N+, +-d N+, to limit the dependency depth to +N+ levels. The
   default, +0+, means no limit.
 
+* +--transitive+, +--no-transitive+, to draw (or not) the transitive
+  dependencies. The default is to draw transitive dependencies.
+
 --------------------------------
 BR2_GRAPH_DEPS_OPTS='-d 3' make graph-depends
 --------------------------------
-- 
1.8.3.2
