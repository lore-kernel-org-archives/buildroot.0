From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Aug 2019 19:18:30 +0200
Subject: [Buildroot] [PATCH 9/9] support/graph-size: reorder colours
 assigned to sizes
In-Reply-To: <cover.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <a909934ace732d61aac79aa4fdc6d3f0176c17bc.1566062299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we can order packages from biggest to smallest, it makes sense
to assign the most aggressive colours to the biggest packages.

As such, reorder the current colours so that we have, in order:
  - red-ish
  - orange-ish
  - yellow-ish
  - purple-ish
  - eggplant-ish (is that even a colour? :-] )
  - some-indeterminate-blue-ish
  - dark-green-ish
  - light-green-ish

For the previous, smallest-first ordering, it does not matter much what
the ordering is: the actual colours are still somewhat-unpredictably
assigned to packages, depending on the cut-off limit...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 support/scripts/size-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index f6b8e6644d..9cb8a33118 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -38,8 +38,8 @@ class Config():
     biggest_first = False
     iec = False
     size_limit = 0.01
-    colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
-              '#0068b5', '#f28e00', '#940084', '#97c000']
+    colors = ['#e60004', '#f28e00', '#ffed00', '#940084',
+              '#2e1d86', '#0068b5', '#009836', '#97c000']
 
 
 #
-- 
2.20.1
