From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Feb 2017 15:53:06 +0100
Subject: [Buildroot] [PATCH 2/7 v4] support/scripts: check the config
	snippet exists
In-Reply-To: <cover.1486911180.git.yann.morin.1998@free.fr>
References: <cover.1486911180.git.yann.morin.1998@free.fr>
Message-ID: <7ccab625829fd6ffb0487f067c4267a6b3e3f82b.1486911180.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
