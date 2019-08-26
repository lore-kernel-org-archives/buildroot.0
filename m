From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:08:18 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: don't
 report "Others" if size is zero
Message-ID: <20190826204924.566308660B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c68ee73924c6860dc1f01b84f1a12b88039b2f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index bd10fbfb68..398c256e8b 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -137,8 +137,9 @@ def draw_graph(pkgsize, outputf):
         else:
             labels.append("%s (%d kB)" % (p, sz / 1000.))
             values.append(sz)
-    labels.append("Other (%d kB)" % (other_value / 1000.))
-    values.append(other_value)
+    if other_value != 0:
+        labels.append("Other (%d kB)" % (other_value / 1000.))
+        values.append(other_value)
 
     plt.figure()
     patches, texts, autotexts = plt.pie(values, labels=labels,
