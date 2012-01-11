From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 11 Jan 2012 15:34:39 +0100
Subject: [Buildroot] [PATCH] pkg-stats: fix table layout
Message-ID: <1326292479-11992-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "Patch count" cell needs rowspan=2, otherwise the host/target cells are
misaligned.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 64aae5f..8228274 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -51,7 +51,7 @@ tr.correct td {
 <tr>
 <td rowspan=\"2\">Id</td>
 <td rowspan=\"2\">Package</td>
-<td>Patch count</td>
+<td rowspan=\"2\">Patch count</td>
 <td colspan=\"2\" class=\"centered\">AUTOTARGETS</td>
 <td colspan=\"2\" class=\"centered\">GENTARGETS</td>
 <td colspan=\"2\" class=\"centered\">CMAKETARGETS</td>
-- 
1.7.5.4
