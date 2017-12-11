From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Dec 2017 20:14:39 +0100
Subject: [Buildroot] [git commit] support/scripts/genimage.sh: show usage
 when invoked incorrectly
Message-ID: <20171211191702.2789A8220B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6887ad7003707743c9d5f3dbaffe3b2de3e3ba6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use ${0}]
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/genimage.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 625afc1..039b3fe 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,7 +1,11 @@
 #!/usr/bin/env bash
 
 die() {
-  echo "Error: $@" >&2
+  cat <<EOF >&2
+Error: $@
+
+Usage: ${0} -c GENIMAGE_CONFIG_FILE
+EOF
   exit 1
 }
 
