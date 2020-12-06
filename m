From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  6 Dec 2020 07:22:50 +0100
Subject: [Buildroot] [PATCH 2/2] utils/scancpan: add GPL* as license file
In-Reply-To: <20201206062250.625306-1-francois.perrad@gadz.org>
References: <20201206062250.625306-1-francois.perrad@gadz.org>
Message-ID: <20201206062250.625306-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index a1ec794ed..3ce3203bd 100755
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
-- 
2.27.0
