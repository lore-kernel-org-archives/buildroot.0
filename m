From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 22:59:20 +0100
Subject: [Buildroot] [git commit] Makefile: fix old make check thinko
Message-ID: <20120209221235.6D76890A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8139e21c978d2c82f559849343ebcec3dd886607
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So it doesn't fail with 3.81.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index d3e8610..25da853 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ export BR2_VERSION:=2012.02-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION=3.81
-ifeq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MAKE_VERSION))
+ifneq ($(firstword $(sort $(MAKE_VERSION) $(MIN_MAKE_VERSION))),$(MIN_MAKE_VERSION))
 $(error You have make '$(MAKE_VERSION)' installed. GNU make >= $(MIN_MAKE_VERSION) is required)
 endif
 
