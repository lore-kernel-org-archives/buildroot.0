From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 23:07:24 +0200
Subject: [Buildroot] [git commit] pkg-stats: use correct variable names for
	convert_to_*autotools
Message-ID: <20111005210730.7EC798E0CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e684cecbfa9c01ed8b7494e4b294c8b6b303747e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variable convert_to_autotools is not used in the script.  The correct
variables are convert_to_target_autotools and convert_to_host_autotools.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
