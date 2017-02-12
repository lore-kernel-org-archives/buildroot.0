From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:59:49 +0100
Subject: [Buildroot] [git commit] support/test-pkg: check the config snippet
	exists
Message-ID: <20170212150011.46FB38215C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55bbbe04c31dd32bd2f4eb8c1c27e95abea666d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/test-pkg | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 9066fa0..11ec18c 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -39,6 +39,9 @@ main() {
     if [ -z "${cfg}" ]; then
         printf "error: no config snippet specified\n" >&2; exit 1
     fi
+    if [ ! -e "${cfg}" ]; then
+        printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
+    fi
     if [ -z "${dir}" ]; then
         dir="${HOME}/br-test-pkg"
     fi
