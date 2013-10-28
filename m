From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Oct 2013 10:03:58 +0100
Subject: [Buildroot] [git commit] nano: needs wchar
Message-ID: <20131028090448.27CB49BAB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09d1176e1e8c9f72c431ca64f2561b405f89ece0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/317/3177b7d6168eec0620e4a1ade9166c9c84929e6e/

[Peter: add comment when not available]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/nano/Config.in b/package/nano/Config.in
index 9546fe7..395af9d 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NANO
 	bool "nano"
+	depends on BR2_USE_WCHAR
 	# full version uses fork()
 	select BR2_PACKAGE_NANO_TINY if !BR2_USE_MMU
 	select BR2_PACKAGE_NCURSES
@@ -15,3 +16,6 @@ config BR2_PACKAGE_NANO_TINY
 	depends on BR2_PACKAGE_NANO
 	help
 	  Disable all features for the sake of size.
+
+comment "nano needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
