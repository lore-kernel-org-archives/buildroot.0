From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Jan 2017 13:46:51 +0100
Subject: [Buildroot] [git commit] nmon: not available on uclibc/musl
Message-ID: <20170109124755.941B481DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a96d58f6bab15a27193b0fc3188e9a5603237d89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/70c/70ce1aa234e321884469d04282f80750bcf9abc8/

nmon uses fstab.h which is only provided by glibc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nmon/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nmon/Config.in b/package/nmon/Config.in
index 9a620f4..574ced3 100644
--- a/package/nmon/Config.in
+++ b/package/nmon/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_NMON
 	bool "nmon"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fstab.h
 	select BR2_PACKAGE_NCURSES
 	help
 	  Nmon is short for Nigel's performance Monitor for Linux
 
 	  http://nmon.sourceforge.net/pmwiki.php
+
+comment "nmon needs a glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
