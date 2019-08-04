From: Victor Huesca <victor.huesca@bootlin.com>
Date: Sun,  4 Aug 2019 12:53:45 +0200
Subject: [Buildroot] [PATCH buildroot-test 6/9] utils/daily-mail: change the
 URL length formatting to reflect the actual URL length
In-Reply-To: <20190804105348.26660-1-victor.huesca@bootlin.com>
References: <20190804105348.26660-1-victor.huesca@bootlin.com>
Message-ID: <20190804105348.26660-7-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The formating length specifies a 40 characters long string but the
actual length is 79 characters long. This patch updates the lenght to
79.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/daily-mail | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/daily-mail b/utils/daily-mail
index c489fc1..4cc5345 100755
--- a/utils/daily-mail
+++ b/utils/daily-mail
@@ -193,9 +193,9 @@ def show_results(results, show_status, show_orphan=False):
         orphan_str = 'ORPH' if r.get('orphan') else ''
         url = http_baseurl + "/results/" + r['identifier']
         if show_status:
-            contents += "%12s | %30s | %3s | %40s" % (arch, reason, status_str, url)
+            contents += "%12s | %30s | %3s | %79s" % (arch, reason, status_str, url)
         else:
-            contents += "%12s | %30s | %40s" % (arch, reason, url)
+            contents += "%12s | %30s | %79s" % (arch, reason, url)
         if show_orphan:
             contents += " | %4s\n" % (orphan_str)
         else:
-- 
2.21.0
