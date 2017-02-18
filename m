From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 18 Feb 2017 16:43:33 +0100
Subject: [Buildroot] [PATCH] package/sngrep: add missing ncurses dependencies
Message-ID: <20170218154333.24496-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ncurses panel and forms libraries are needed to build sngrep, otherwise
the configure script report the following errors:

Without panel library:
checking ncurses.h usability... yes
checking ncurses.h presence... yes
checking for ncurses.h... yes
checking for initscr in -lncurses... yes
checking for new_panel in -lpanel... no
configure: error:  You need to have ncurses panel library installed to compile sngrep.

Without form library:
checking ncurses.h usability... yes
checking ncurses.h presence... yes
checking for ncurses.h... yes
checking for initscr in -lncurses... yes
checking for new_panel in -lpanel... yes
checking for new_form in -lform... no
configure: error:  You need to have ncurses forms library installed to compile sngrep.

Fixes:
http://autobuild.buildroot.net/results/ee5/ee58cd4252e4da95e9bd025ced9ad3ba0fb7cb08

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adam Duskett <aduskett@codeblue.com>
---
 package/sngrep/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
index 4d0d80c..70d2354 100644
--- a/package/sngrep/Config.in
+++ b/package/sngrep/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_SNGREP
 	bool "sngrep"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  sngrep is a tool for displaying SIP calls message flows from
-- 
2.9.3
