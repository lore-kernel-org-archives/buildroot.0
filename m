From: Martin Bark <martin@barkynet.com>
Date: Fri,  4 Mar 2016 17:16:35 +0000
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix not installing to the
	target
Message-ID: <1457111795-7214-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit https://git.busybox.net/buildroot/commit/?id=9f81bad fixed a build
error in kbd but unfortunately it broke the target install rule so that
nothing is being installed.

Move setting KBD_INSTALL_TARGET_OPTS after $(eval $(autotools-package))
so that it is set correctly and now installs to the target again.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/kbd/kbd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 9dabce1..9d959cf 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -17,6 +17,6 @@ KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 KBD_AUTORECONF = YES
 
-KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-
 $(eval $(autotools-package))
+
+KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
-- 
2.7.1
