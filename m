From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:55:54 -0400
Subject: [Buildroot] [RFC 4/4] genimage.sh: add usage to die function
In-Reply-To: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170418155554.28732-5-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also re-indents the die function using tabulations.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 50d6907..d0d3491 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -1,8 +1,11 @@
 #!/bin/bash
 
 die() {
-  echo "Error: $@" >&2
-  exit 1
+	echo "Usage: ${0##*/} BINARIES_DIR -c GENIMAGE_CFG" >&2
+	echo "" >&2
+
+	echo "Error: $@" >&2
+	exit 1
 }
 
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
@@ -18,7 +21,7 @@ while getopts :c: OPT ; do
 	esac
 done
 
-[ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
+[ -n "${GENIMAGE_CFG}" ] || die "missing option 'c'"
 
 rm -rf "${GENIMAGE_TMP}"
 
-- 
2.9.3
