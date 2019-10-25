From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:16:49 +0200
Subject: [Buildroot] [git commit] package/libyang: fix build w/o threads
Message-ID: <20191025181036.26A47880EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68f3e7c3b1fa6d62299820f2dd54dbfeecb59859
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For building libyang a toolchain with thread support is needed. Add the dependancy
to BR2_TOOLCHAIN_HAS_THREADS.

Fixes:
  - http://autobuild.buildroot.net/results/1d84ff4aab67a98113d967b65467109e80bb5917

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libyang/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libyang/Config.in b/package/libyang/Config.in
index ebe51ff099..fec1160a6f 100644
--- a/package/libyang/Config.in
+++ b/package/libyang/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBYANG
 	bool "libyang"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_PCRE_UCP
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBYANG
 
 	  https://github.com/CESNET/libyang
 
-comment "libyang needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "libyang needs a toolchain w/ threads, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
