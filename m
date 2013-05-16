From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 May 2013 09:21:08 +0200
Subject: [Buildroot] [git commit] aircrack-ng: don't drop TARGET_LDFLAGS
Message-ID: <20130516082742.707E09A190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6cdb6cc97637d2399d258f42b9f055f5674f2807
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aircrack-ng/aircrack-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index a36cf34..bac45d1 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -20,7 +20,7 @@ else
 	AIRCRACK_NG_MAKE_OPTS = sqlite=false
 endif
 
-AIRCRACK_NG_LDFLAGS = -lz \
+AIRCRACK_NG_LDFLAGS = $(TARGET_LDFLAGS) -lz \
 	$(if $(BR2_PREFER_STATIC_LIB),-ldl -lpthread)
 
 define AIRCRACK_NG_BUILD_CMDS
