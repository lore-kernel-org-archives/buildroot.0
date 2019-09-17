From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:51:01 +0200
Subject: [Buildroot] [git commit] utils/scancpan: improve license file
 detection
Message-ID: <20190917204613.1EDD68EA82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f71f944fe61b3671d1e72b3f6aaae5b238446eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MANIFEST may contains line like this:
"LICENSE                     LICENSE file (added by Distar)"
so, retains only the first word.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/scancpan b/utils/scancpan
index 1fccc980af..484ccaca95 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -566,6 +566,7 @@ sub find_license_files {
     my @license_files;
     foreach (split /\n/, $manifest) {
         next if m|/|;
+        s|\s+.*$||;
         push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
     }
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
