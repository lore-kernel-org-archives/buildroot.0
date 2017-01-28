From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jan 2017 17:57:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/sngrep: needs ncurses
	form/menu/panel libraries
Message-ID: <20170128165745.5149-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please see configure checks for the various ncurses libraries:

form
https://github.com/irontec/sngrep/blob/master/configure.ac#L90

menu
https://github.com/irontec/sngrep/blob/master/configure.ac#L94

panel
https://github.com/irontec/sngrep/blob/master/configure.ac#L86

Fixes
http://autobuild.buildroot.net/results/3a4/3a4751fcc6184d562df80d1cd6bf53e788e21392/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sngrep/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sngrep/Config.in b/package/sngrep/Config.in
index 4d0d80c13..1d2ee4787 100644
--- a/package/sngrep/Config.in
+++ b/package/sngrep/Config.in
@@ -5,6 +5,9 @@ config BR2_PACKAGE_SNGREP
 	bool "sngrep"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_FORM
+	select BR2_PACKAGE_NCURSES_TARGET_MENU
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  sngrep is a tool for displaying SIP calls message flows from
-- 
2.11.0
