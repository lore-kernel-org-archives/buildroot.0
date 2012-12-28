From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 12:12:26 +0100
Subject: [Buildroot] [git commit] dialog: needs mmu
Message-ID: <20121228111227.D20109A4D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d9d842d871b8645f70c3a90f59f8e2e09935656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/b673ef6d6315dc5df77e000199a63f90904829d5

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dialog/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dialog/Config.in b/package/dialog/Config.in
index 9d3462e..db5197f 100644
--- a/package/dialog/Config.in
+++ b/package/dialog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DIALOG
 	bool "dialog"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
