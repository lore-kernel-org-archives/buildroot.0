From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 12:07:17 +0100
Subject: [Buildroot] [git commit] tn5250: needs mmu
Message-ID: <20140105110954.5B4A29C3A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbabf4947f8e562a5a46cf522ae44048eb40e456
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/02c/02cedc329c355255e9f9b3b87aa2777de321d1a4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tn5250/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tn5250/Config.in b/package/tn5250/Config.in
index 807def0..01be40b 100644
--- a/package/tn5250/Config.in
+++ b/package/tn5250/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TN5250
 	bool "tn5250"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Telnet client that emulates 5250 terminals and printers.
