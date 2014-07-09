From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 15:28:20 +0200
Subject: [Buildroot] [git commit] libnl: Move the pthread dependency menu
	comment
Message-ID: <20140709134616.4EDE09CF0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=376e78016b09f1539c7cc8cf6bc7a7e6100eb97d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for this comment to be properly displayed, it must be moved to be
at the end of the file.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnl/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libnl/Config.in b/package/libnl/Config.in
index 1173278..74a2e79 100644
--- a/package/libnl/Config.in
+++ b/package/libnl/Config.in
@@ -6,9 +6,6 @@ config BR2_PACKAGE_LIBNL
 
 	  http://people.suug.ch/~tgr/libnl/
 
-comment "libnl needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-
 if BR2_PACKAGE_LIBNL
 
 config BR2_PACKAGE_LIBNL_TOOLS
@@ -20,5 +17,7 @@ config BR2_PACKAGE_LIBNL_TOOLS
 
 comment "libnl tools need a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
-
 endif
+
+comment "libnl needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
