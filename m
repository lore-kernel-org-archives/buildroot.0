From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 16:34:10 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats:
 get_config_packages(): use dict.values()
Message-ID: <20210202152050.CAA13812BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97f1d5d151da45ecad2357a077cb4bf6c8252cbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
