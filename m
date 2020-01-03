From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  3 Jan 2020 16:18:41 +0100
Subject: [Buildroot] [PATCH 04/11] support/scripts/pkg-stats: do not exclued
 pkg name in json output
In-Reply-To: <20200103151849.10956-1-heiko.thiery@gmail.com>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
Message-ID: <20200103151849.10956-5-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 92fc01d655..4021aacceb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -676,7 +676,7 @@ def dump_html(packages, stats, date, commit, output):
 def dump_json(packages, stats, date, commit, output):
     # Format packages as a dictionnary instead of a list
     # Exclude local field that does not contains real date
-    excluded_fields = ['url_worker', 'name']
+    excluded_fields = ['url_worker']
     pkgs = {
         pkg.name: {
             k: v
-- 
2.20.1
