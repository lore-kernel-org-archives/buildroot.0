From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:55:52 -0400
Subject: [Buildroot] [RFC 2/4] genimage.sh: fix getopts traces
In-Reply-To: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170418155554.28732-3-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The first trace is never displayed, the second shows an empty string
because OPTARG is not set.

To display both traces properly, the optstring of getopts needs to
start with a colon.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 6684e73..6f9102c 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -10,7 +10,7 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 # First argument is BINARIES_DIR, skip it
 shift
 
-while getopts c: OPT ; do
+while getopts :c: OPT ; do
 	case "${OPT}" in
 	c) GENIMAGE_CFG="${OPTARG}";;
 	:) die "option '${OPTARG}' expects a mandatory argument\n";;
-- 
2.9.3
