From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 23:46:46 +0100
Subject: [Buildroot] [git commit] utils/scancpan: handle LICENCE spelling
Message-ID: <20191029224211.C75CD8D6CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f42e355b56df634939d6dd1b4816c764add563ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License files are sometimes called LICENCE, so support that as well.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 484ccaca95..16e495bdac 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -567,7 +567,7 @@ sub find_license_files {
     foreach (split /\n/, $manifest) {
         next if m|/|;
         s|\s+.*$||;
-        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
+        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE|LICENCE)/i;
     }
     if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
         @license_files = ($1);
