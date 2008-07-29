From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 29 Jul 2008 08:46:47 +0200
Subject: [Buildroot] [PATCH v2 4/5] lxdoom-wad: enable kconfig entry for
	PrBoom package
In-Reply-To: <1217314008-22850-3-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1217314008-22850-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1217314008-22850-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1217314008-22850-3-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1217314008-22850-4-git-send-email-hans-christian.egtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will let the user install the Doom shareware wad file if PrBoom is
selected.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 package/lxdoom/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lxdoom/Config.in b/package/lxdoom/Config.in
index 087183d..5970e18 100644
--- a/package/lxdoom/Config.in
+++ b/package/lxdoom/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LXDOOM
 	  This is the linux version of the popular doom game.
 config BR2_PACKAGE_LXDOOM_WAD
 	bool "doom shareware wad file"
-	depends on BR2_PACKAGE_LXDOOM
+	depends on BR2_PACKAGE_LXDOOM || BR2_PACKAGE_PRBOOM
 	help
 	  This will install the shareware wad data file for the doom game.
 
-- 
1.5.4.3
