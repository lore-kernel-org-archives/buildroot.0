From: imrehg at gmail.com <imrehg@gmail.com>
Date: Tue, 22 Sep 2015 21:48:54 +0800
Subject: [Buildroot] [PATCH 1/1] package/genimage: use git version,
	bump to latest
Message-ID: <1442929734-26752-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

Using the latest release 7 of genimage on Arch Linux at the
moment seems to result in segmentation fault, while it works on
other distros. The latest git version on the other hand runs
correctly on all platforms tested. Test was done by running:
"make wandboard_defconfig && make" as Wandboard is using genimage
in the post-image script.

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 package/genimage/genimage.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
index 07d95a4..773d515 100644
--- a/package/genimage/genimage.mk
+++ b/package/genimage/genimage.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-GENIMAGE_VERSION = 7
-GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
-GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
+GENIMAGE_VERSION = f23b67b7e3c57712c22e226742566e206cfb43be
+GENIMAGE_SITE = git://git.pengutronix.de/git/genimage.git
 GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse
 GENIMAGE_LICENSE = GPLv2
+GENIMAGE_AUTORECONF = YES
 
 $(eval $(host-autotools-package))
-- 
2.5.3
