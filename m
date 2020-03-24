From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:27:57 +0100
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: fix flake8 E501
 warning
Message-ID: <20200324144153.3B3927FBD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7f33771b3a7889e5781b30830b1400489880252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

support/scripts/pkg-stats:281:133: E501 line too long (139 > 132 characters)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 039a1937b9..4d8e932a9f 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -278,7 +278,8 @@ class Package:
 
     def __str__(self):
         return "%s (path='%s', license='%s', license_files='%s', hash='%s', patches=%d)" % \
-            (self.name, self.path, self.is_status_ok('license'), self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
+            (self.name, self.path, self.is_status_ok('license'),
+             self.is_status_ok('license-files'), self.status['hash'], self.patch_count)
 
 
 class CVE:
