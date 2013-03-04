From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 12:24:05 +0100
Subject: [Buildroot] [git commit] f2fs-tools: explicitly select libuuid
Message-ID: <20130304112555.D961E9AE7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e8eddaf2f1a66e80605e4e9e349799f1ff3cd43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly select BR2_PACKAGE_UTIL_LINUX_LIBUUID. Fixes:
http://autobuild.buildroot.net/results/da5c52b658d9efc25d2c2ad3980add3a36b99ee2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/f2fs-tools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index 20db928..99ee91c 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	help
