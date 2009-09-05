From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2009 15:24:12 +0200
Subject: [Buildroot] [git commit master] script: use qstrip
Message-ID: <20090905132513.012BF775D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4a37bf3b9eb6d34a3fb75140234c21417521ae17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/test/Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/scripts/test/Makefile b/scripts/test/Makefile
index 7396cf7..ec7a45d 100644
--- a/scripts/test/Makefile
+++ b/scripts/test/Makefile
@@ -2,6 +2,4 @@ include .config
 
 
 ARCH:	
-	@echo	$(strip $(subst ",,$(BR2_ARCH)))
-#")))
-
+	@echo	$(call qstrip,$(BR2_ARCH))
-- 
1.6.3.3
