From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:55:53 -0400
Subject: [Buildroot] [RFC 3/4] genimage.sh: strip getopts EOL characters
In-Reply-To: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170418155554.28732-4-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The \n polutes the output.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 6f9102c..50d6907 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -13,8 +13,8 @@ shift
 while getopts :c: OPT ; do
 	case "${OPT}" in
 	c) GENIMAGE_CFG="${OPTARG}";;
-	:) die "option '${OPTARG}' expects a mandatory argument\n";;
-	\?) die "unknown option '${OPTARG}'\n";;
+	:) die "option '${OPTARG}' expects a mandatory argument";;
+	\?) die "unknown option '${OPTARG}'";;
 	esac
 done
 
-- 
2.9.3
