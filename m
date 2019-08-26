From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:51:47 +0200
Subject: [Buildroot] [git commit branch/next] support/graph-size: reorder
 colours assigned to sizes
Message-ID: <20190826204924.87C5B8660B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20cbf17e0a89dbe9aa8d488a7e06a0c4103a4877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/size-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/size-stats b/support/scripts/size-stats
index 996c0d660e..dea3a6007c 100755
--- a/support/scripts/size-stats
+++ b/support/scripts/size-stats
@@ -38,8 +38,8 @@ class Config:
     biggest_first = False
     iec = False
     size_limit = 0.01
-    colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
-              '#0068b5', '#f28e00', '#940084', '#97c000']
+    colors = ['#e60004', '#f28e00', '#ffed00', '#940084',
+              '#2e1d86', '#0068b5', '#009836', '#97c000']
 
 
 #
