From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:20:10 +0100
Subject: [Buildroot] [git commit] utils/scancpan: allow the generation of
 more tests
Message-ID: <20181206212822.ED72586DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84179d4a04b4d6d26519f756678a609a9a7369ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index 6592afc2fd..8073ad1978 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -578,7 +578,7 @@ sub find_license_files {
 
 sub want_test {
     my ($distname) = @_;
-    return 1 if $need_dlopen{$distname} && scalar @{$deps_runtime{$distname}} > 1;
+    return 1 if $need_dlopen{$distname} && scalar @{$deps_runtime{$distname}} > 0;
 }
 
 sub get_dependencies {
