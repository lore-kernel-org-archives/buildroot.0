From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Mar 2013 10:52:26 +0100
Subject: [Buildroot] [git commit] at91bootstrap: fix upstream URL
Message-ID: <20130312095304.0DB4B9ADA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49610bbc2149213ffcca2d160f0d108669e7021a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AT91Bootstrap 1.x seems to have disappeared from atmel.com (but return
HTML instead of a 404), so use the at91.com FTP server instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/at91bootstrap/at91bootstrap.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
index 46862c0..67b68c0 100644
--- a/boot/at91bootstrap/at91bootstrap.mk
+++ b/boot/at91bootstrap/at91bootstrap.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 AT91BOOTSTRAP_VERSION = 1.16
-AT91BOOTSTRAP_SITE = http://www.atmel.com/Images
+AT91BOOTSTRAP_SITE = ftp://www.at91.com/pub/at91bootstrap/
 AT91BOOTSTRAP_SOURCE = AT91Bootstrap$(AT91BOOTSTRAP_VERSION).zip
 
 AT91BOOTSTRAP_BOARD = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP_BOARD))
