From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 20:08:51 +0200
Subject: [Buildroot] [git commit] ncftp: needs MMU
Message-ID: <20120506180941.A90F38F738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3aabcc997d13664da8e0fd4fd41636a82422e8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncftp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 7b6ae64..4aaa62d 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
