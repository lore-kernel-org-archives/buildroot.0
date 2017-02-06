From: Brian 'redbeard' Harrington <redbeard@coreos.com>
Date: Mon,  6 Feb 2017 08:48:02 -0800
Subject: [Buildroot] [PATCH 1/1] package/lightning: Fix GNU Mirror Path
Message-ID: <1486399682-14656-1-git-send-email-redbeard@coreos.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
---
 package/lightning/lightning.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index b74147a..052e593 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTNING_VERSION = 2.1.0
-LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning
+LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPLv3+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
-- 
2.7.4
