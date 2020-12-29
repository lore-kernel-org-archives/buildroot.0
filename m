From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:00:45 +0100
Subject: [Buildroot] [git commit] utils/scancpan: handles README.pod as
 license file
Message-ID: <20201229214325.DE32B8324A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1120980f303e0658bf1b67db54f93fea551cb815
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 327a58fc78..a1ec794edd 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -575,6 +575,9 @@ sub find_license_files {
     if (scalar @license_files == 0 && $manifest =~ m/(README\.md)[\n\s]/i) {
         @license_files = ($1);
     }
+    if (scalar @license_files == 0 && $manifest =~ m/(README\.pod)[\n\s]/i) {
+        @license_files = ($1);
+    }
     return @license_files;
 }
 
