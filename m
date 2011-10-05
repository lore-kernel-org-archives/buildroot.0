From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 15:34:59 -0500
Subject: [Buildroot] [PATCH] pkg-stats: use correct variable names for
 convert_to_*autotools
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE980@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variable convert_to_autotools is not used in the script.  The correct
variables are convert_to_target_autotools and convert_to_host_autotools.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3e89bd1..30a21f2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -71,7 +71,8 @@ tr.correct td {
 
 convert_to_generic_target=0
 convert_to_generic_host=0
-convert_to_autotools=0
+convert_to_target_autotools=0
+convert_to_host_autotools=0
 total_patch_count=0
 cnt=0
 for i in $(find package/ -name '*.mk') ; do
