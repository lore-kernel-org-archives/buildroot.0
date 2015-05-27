From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 13:40:18 +0200
Subject: [Buildroot] [git commit] package/gptfdisk: propagate ncurses
	reverse dependency
Message-ID: <20150527114110.61C9681E11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4a7aeed539631a91cae2c00dec4d20ccc6dda31
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gptfdisk cgdisk select nucurses wchar support which is disabled
on bfin with FLAT binary format.

Add the ncurses's reverse dependency to gptfdisk.

Fixes:
http://autobuild.buildroot.net/results/ce3/ce35c072f0b7c3a7a1918cb865a2eecbba8a1b23/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gptfdisk/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
