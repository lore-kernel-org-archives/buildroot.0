From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  9 Dec 2017 22:29:59 +0100
Subject: [Buildroot] [PATCH 1/9] support/scripts/genimage.sh: show usage
 when invoked incorrectly
In-Reply-To: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1512855007-1834-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 support/scripts/genimage.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 625afc108c82..5ed9f9c1ae1e 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,7 +1,11 @@
 #!/usr/bin/env bash
 
 die() {
-  echo "Error: $@" >&2
+  cat <<EOF >&2
+Error: $@
+
+Usage: S{0} -c GENIMAGE_CONFIG_FILE
+EOF
   exit 1
 }
 
-- 
2.7.4
