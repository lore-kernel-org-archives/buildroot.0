From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 19:08:42 +0200
Subject: [Buildroot] [git commit] pkg-stats: cnt should start with 0
Message-ID: <20111005183704.B9EFE8E226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7b75b71679a03d92850890e1980d7e3cc42b096
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package count, cnt, should start with an initial value of 0.  It
is incremented as each package *.mk file is checked.  Starting with a
value of 1 makes the first ID = 2 and results in the TOTAL being off
by 1.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/pkg-stats |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 8602b0f..3e89bd1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -73,7 +73,7 @@ convert_to_generic_target=0
 convert_to_generic_host=0
 convert_to_autotools=0
 total_patch_count=0
-cnt=1
+cnt=0
 for i in $(find package/ -name '*.mk') ; do
 
     if test \
