From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 11 Feb 2010 17:31:25 +0100
Subject: [Buildroot] [PATCH] alsamixer now seems to need libform,
	libmenu & libpanel (from ncurses)
Message-ID: <1265905885-31942-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Without this patch alsamixer complains about missing libs and
ldd says:
        libform.so.5 => not found
        libmenu.so.5 => not found
        libpanel.so.5 => not found
        libncurses.so.5 => /usr/lib/libncurses.so.5 (0x4000e000)
        libasound.so.2 => /usr/lib/libasound.so.2 (0x40056000)
        ... <cut>

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/multimedia/alsa-utils/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/alsa-utils/Config.in b/package/multimedia/alsa-utils/Config.in
index 54ab3f9..04057f4 100644
--- a/package/multimedia/alsa-utils/Config.in
+++ b/package/multimedia/alsa-utils/Config.in
@@ -24,6 +24,9 @@ config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 	bool "alsamixer"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
 	default y
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
-- 
1.6.0.4
