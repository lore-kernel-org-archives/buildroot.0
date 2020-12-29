From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 23:00:53 +0100
Subject: [Buildroot] [git commit] utils/scancpan: add GPL* as license file
Message-ID: <20201229214325.E9AEC80E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b689a5a7204c4d7e753c1f0c6b420a04739dedf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index a1ec794edd..3ce3203bd5 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -567,7 +567,7 @@ sub find_license_files {
     foreach (split /\n/, $manifest) {
         next if m|/|;
         s|\s+.*$||;
-        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE|LICENCE)/i;
+        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|GPL\S*|LICENSE|LICENCE)/i;
     }
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
