From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 09:08:22 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/2] web/index.php: allow
 filtering by date
In-Reply-To: <20190813070822.30230-1-victor.huesca@bootlin.com>
References: <20190813070822.30230-1-victor.huesca@bootlin.com>
Message-ID: <20190813070822.30230-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provide a way to pass a date as part of the filter. This date
can be either a single date or a couple 'start and end' dates as an
associative array to cover every case:

Example: "date[from]=2019-03-03&date[to]=2019-07-21"

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/index.php | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/web/index.php b/web/index.php
index 939cac5..0c79aa6 100644
--- a/web/index.php
+++ b/web/index.php
@@ -59,6 +59,9 @@ if (isset($_GET['subarch']) && preg_match("/^[A-Za-z0-9_\+\.\-]*$/", $_GET['suba
 if (isset ($_GET['submitter']))
   $filters["submitter"] = urldecode($_GET['submitter']);
 
+if (isset($_GET['date']))
+  $filters["date"] = $_GET['date'];
+
 bab_header("Buildroot tests");
 
 echo "<table>\n";
-- 
2.21.0
