From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 24 Jul 2008 15:21:56 +0200
Subject: [Buildroot] [PATCH 4/5] lxdoom-wad: enable kconfig entry for PrBoom
	package
In-Reply-To: <1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1216905717-9197-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-2-git-send-email-hans-christian.egtvedt@atmel.com>
	<1216905717-9197-3-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <1216905717-9197-4-git-send-email-hans-christian.egtvedt@atmel.com>
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
index 3b318e1..e3c9be8 100644
--- a/package/lxdoom/Config.in
+++ b/package/lxdoom/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LXDOOM
 	  This is the linux version of the popular doom game.
 config BR2_PACKAGE_LXDOOM_WAD
 	bool "doom shareware wad file"
-	depends on BR2_PACKAGE_LXDOOM
+	depends on BR2_PACKAGE_LXDOOM || BR2_PACKAGE_PRBOOM
 	help
 	  This will install the the shareware wad data file for the doom game.
 
-- 
1.5.4.3
