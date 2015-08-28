From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Fri, 28 Aug 2015 13:12:50 +0200
Subject: [Buildroot] [PATCH] package/mke2img: set sparse_super for revision 1
Message-ID: <1440760370-61713-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sparse_super feature is more efficient in terms of speed and
available space, so set it by default if supported, i.e. for revision 1.

This gives a huge speed gain for large resize2fs operations, especially
for expansion.

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/mke2img/mke2img | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
index 5e2f62f..806cb1f 100755
--- a/package/mke2img/mke2img
+++ b/package/mke2img/mke2img
@@ -76,7 +76,7 @@ main() {
 
     # Upgrade to rev1 if needed
     if [ ${rev} -ge 1 ]; then
-        tune2fs_O_opts+=",filetype"
+        tune2fs_O_opts+=",filetype,sparse_super"
     fi
 
     # Add a journal for ext3 and above
-- 
2.1.4
