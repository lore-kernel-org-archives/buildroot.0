From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 12:51:53 +0100
Subject: [Buildroot] [git commit] dialog: needs mmu
Message-ID: <20130225115315.0075F9AD34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c1fecebaa4e7378042783d7ef81fa55b0ffdc42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/bfb968d611e8dea43c604726a3005c72a7d6ee28/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dialog/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index db5197f..b3efd8d 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
