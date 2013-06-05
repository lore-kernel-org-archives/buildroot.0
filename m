From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Jun 2013 18:21:10 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-boards: set a default board
In-Reply-To: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default configuration doesn't set any board, but the
sunxi-boards.mk file errors out if no board is defined. This causes a
large number of build failures in the autobuilders, such as
http://autobuild.buildroot.org/results/b92/b928edc07f0939531d76833a17c851889ae06677/build-end.log.

The proposed approach to solve this is to set a default board. An
alternative approach would have been to remove the check that ensures
that a board has been set, but I believe it's less obvious for the
user.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-boards/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
index d9fd852..d8c82e0 100644
--- a/package/sunxi-boards/Config.in
+++ b/package/sunxi-boards/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_SUNXI_BOARDS
 if BR2_PACKAGE_SUNXI_BOARDS
 config BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE
 	string ".fex file to compile"
+	default "a10/hackberry.fex"
 	help
 	  This field defines the name of the .fex file for which the
 	  .bin file should be generated.
-- 
1.8.1.2
