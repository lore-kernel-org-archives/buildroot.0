From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 5 Oct 2011 11:47:54 -0500
Subject: [Buildroot] [PATCH] pkg-stats: cnt should start with 0
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DCFE857@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package count, cnt, should start with an initial value of 0.  It
is incremented as each package *.mk file is checked.  Starting with a
value of 1 makes the first ID = 2 and results in the TOTAL being off
by 1.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

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
