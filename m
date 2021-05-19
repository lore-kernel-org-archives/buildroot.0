From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 09:26:50 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: verified CPE
 has a known id but not version
Message-ID: <20210519080212.DBD3E885A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b83bb13826ac3c34e6fb67a5092d94d98ca6a5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently a verified CPE reports the following if versions are not found
 cpe:2.3:a:qemu:qemu:5.2.0:*:*:*:*:*:*:*
 CPE identifier unknown in CPE database (Search)

This patch clarifies the report to state the 'version' is unknown instead
of the 'identifier'.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 0cd3674c52..42c36f7f94 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -610,7 +610,7 @@ def check_package_cpes(nvd_path, packages):
         if cpedb.find(p.cpeid):
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
-            p.status['cpe'] = ("error", "CPE identifier unknown in CPE database")
+            p.status['cpe'] = ("error", "CPE version unknown in CPE database")
 
 
 def calculate_stats(packages):
