From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Aug 2019 19:18:24 +0200
Subject: [Buildroot] [PATCH 3/9] support/graph-size: don't report "Others"
 if size is zero
In-Reply-To: <cover.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <e01ff079d40c53d0f84c699655de0dceef3f889b.1566062299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.20.1
