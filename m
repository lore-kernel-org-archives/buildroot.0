From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Thu,  9 Mar 2017 16:15:21 +0100
Subject: [Buildroot] [PATCH 1/1] test-pkg: Extend the logfile with the first
	command as well
Message-ID: <1489072521-5514-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 support/scripts/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index a040ce1..0e7779d 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -108,7 +108,7 @@ build_one() {
 	_EOF_
     cat "${cfg}" >>"${dir}/.config"
 
-    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
+    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
         printf "FAILED\n"
         return 2
     fi
-- 
2.1.4
