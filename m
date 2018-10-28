From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Oct 2018 15:16:07 +0100
Subject: [Buildroot] [git commit] scancpan: also use README.md as default
 license file
Message-ID: <20181028142403.1D0FD82D99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b7563f3d64b728a5bb8f84061b1d728605012da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 7c1e4236f9..e77863de34 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -568,6 +568,9 @@ sub find_license_files {
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
     }
+    if (scalar @license_files == 0 && $manifest =~ m/(README\.md)[\n\s]/i) {
+        @license_files = ($1);
+    }
     return @license_files;
 }
 
