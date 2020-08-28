From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:45:12 +0200
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/scripts/pkg-stats: fix flake8 E501 warning
Message-ID: <20200828155254.1F45F811FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48d9765054ecd87cedace9337ba1313062c6714d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:

support/scripts/pkg-stats:281:133: E501 line too long (139 > 132 characters)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f7f33771b3a7889e5781b30830b1400489880252)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 06d5bd078c..d6239024eb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -278,7 +278,8 @@ class Package:
 
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.is_status_ok('license'), self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+            (self.name, self.path, self.is_status_ok('license'),
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
 class CVE:
