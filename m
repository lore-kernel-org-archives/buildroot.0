From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:30 -0000
Subject: [Buildroot] [git commit branch/next] wget: requires wchar support
Message-ID: <20120802195245.89BFA8C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d8343a9ac81f3566ca3a093f3699d21bfce67cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/431853a9fda593fba41c1176ecee0bdfe38ce441

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wget/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/wget/Config.in b/package/wget/Config.in
index 3f79a64..354b48f 100644
--- a/package/wget/Config.in
+++ b/package/wget/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_WGET
 	bool "wget"
 	# fork()
 	depends on BR2_USE_MMU
+	depends on BR2_USE_WCHAR
 	help
 	  Network utility to retrieve files from http, https and ftp.
 
 	  http://www.gnu.org/software/wget/
+
+comment "wget requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
