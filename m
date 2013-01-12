From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 12 Jan 2013 20:59:55 +0100
Subject: [Buildroot] [git commit] empty: needs MMU
Message-ID: <20130112200214.47D4899893@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a3c29fd4cfb2959e7ff8e62966bf1b5ee470334
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The empty package uses the fork() system call, and so requires MMU.

Fixed autobuilder failures such as the following.

  http://autobuild.buildroot.net/results/4ad23e07b1bfe7bfd622aed8d54fa243b72eed59/build-end.log

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/empty/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/empty/Config.in b/package/empty/Config.in
index 67b09fc..7fd0877 100644
--- a/package/empty/Config.in
+++ b/package/empty/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EMPTY
 	bool "empty"
+	depends on BR2_USE_MMU # uses fork()
 	help
 	  Run processes and applications under pseudo-terminal (PTY) sessions.
 
