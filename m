From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Mar 2010 15:19:42 +0100
Subject: [Buildroot] [git commit master] wget: needs WCHAR support in
	toolchain
Message-ID: <20100322145739.6C81577716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d6bb69459846c70ae622827454085ca94fb7b350
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wget/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 3877a3a..172359c 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_WGET
 	bool "wget"
+	depends on BR2_USE_WCHAR
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
 	  http://www.gnu.org/software/wget/
+
+comment "wget requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
-- 
1.6.3.3
