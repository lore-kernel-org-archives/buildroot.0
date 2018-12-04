From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  4 Dec 2018 05:37:50 +0100
Subject: [Buildroot] [PATCH 3/7] scancpan: allow the generation of more tests
In-Reply-To: <20181204043754.24556-1-francois.perrad@gadz.org>
References: <20181204043754.24556-1-francois.perrad@gadz.org>
Message-ID: <20181204043754.24556-4-francois.perrad@gadz.org>
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
index 45709e166..229ca1056 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -578,7 +578,7 @@ sub find_license_files {
 
 sub want_test {
     my ($distname) = @_;
-    return 1 if $need_dlopen{$distname} && scalar @{$deps_runtime{$distname}} > 1;
+    return 1 if $need_dlopen{$distname} && scalar @{$deps_runtime{$distname}} > 0;
 }
 
 sub get_dependencies {
-- 
2.17.1
