From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 22:01:08 +0200
Subject: [Buildroot] [git commit master] ncftp: needs largefile support in
	toolchain
Message-ID: <20091003200150.5A95C776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b80f662168f25704536dd535853dba534b3e43d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ncftp/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 7b6ae64..a29934a 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NCFTP
 	bool "ncftp"
+	depends on BR2_LARGEFILE
 	help
 	  NcFTP Client (also known as just NcFTP) is a set of FREE application
 	  programs implementing the File Transfer Protocol (FTP).
@@ -30,3 +31,6 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 	select BR2_PACKAGE_NCURSES
 
 endmenu
+
+comment "ncftp requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
-- 
1.6.3.3
