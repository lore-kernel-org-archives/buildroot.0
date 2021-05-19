From: Matthew Weber <matthew.weber@collins.com>
Date: Tue, 18 May 2021 21:46:36 -0500
Subject: [Buildroot] [PATCH v2 1/3] support/scripts/pkg-stats: verified CPE
 has a known id but not version
Message-ID: <20210519024638.63607-1-matthew.weber@collins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently a verified CPE reports the following if versions are not found
 cpe:2.3:a:qemu:qemu:5.2.0:*:*:*:*:*:*:*
 CPE identifier unknown in CPE database (Search)

This patch clarifies the report to state the 'version' is unknown instead
of the 'identifier'.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
Changes v1 -> v2
 - New
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
-- 
2.17.1
