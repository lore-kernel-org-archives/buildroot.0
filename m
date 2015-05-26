From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 26 May 2015 21:33:21 +0200
Subject: [Buildroot] [PATCH] package/gptfdisk: propagate ncurses reverse
	dependency
Message-ID: <1432668801-29112-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gptfdisk cgdisk select nucurses wchar support which is disabled
on bfin with FLAT binary format.

Add the ncurses's reverse dependency to gptfdisk.

Fixes:
http://autobuild.buildroot.net/results/ce3/ce35c072f0b7c3a7a1918cb865a2eecbba8a1b23/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gptfdisk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gptfdisk/Config.in b/package/gptfdisk/Config.in
index 61692f6..befdf77 100644
--- a/package/gptfdisk/Config.in
+++ b/package/gptfdisk/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_GPTFDISK_CGDISK
 	bool "ncurses cgdisk"
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_NCURSES_WCHAR # needed because of UTF-16
+	depends on !(BR2_bfin && BR2_BINFMT_FLAT) # ncurses wchar support
 	help
 	  Install the ncurses-based GUID partition table (GPT)
 	  manipulator /usr/sbin/cgdisk.
-- 
2.1.0
