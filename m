From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:34:33 +0100
Subject: [Buildroot] [git commit] support/scripts/test-pkg: extend logfile
	with olddefconfig output
Message-ID: <20170309203454.68AF78254E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac53042bf230eebab4eea552a2bafa27619676a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
