From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  1 Feb 2021 13:20:56 +0100
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats:
 get_config_packages(): use dict.values()
Message-ID: <20210201122056.6732-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to get both the key and the value out of the dict if the
key is not used, so use dict.values() instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index f58afc02ae..ac490a8d8f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -358,7 +358,7 @@ def get_pkglist(npackages, package_list):
 def get_config_packages():
     cmd = ["make", "--no-print-directory", "show-info"]
     js = json.loads(subprocess.check_output(cmd))
-    return set([v["name"] for _, v in js.items()])
+    return set([v["name"] for v in js.values()])
 
 
 def package_init_make_info():
-- 
2.20.1
