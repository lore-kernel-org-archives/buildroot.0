From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:49 +0200
Subject: [Buildroot] [PATCH 7/7] script: use qstrip
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4a37bf3b9eb6d34a3fb75140234c21417521ae17.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
