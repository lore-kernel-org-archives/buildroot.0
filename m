From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Thu, 24 Oct 2019 08:37:16 +0200
Subject: [Buildroot] [PATCH vX 1/1] package/libyang: fix build w/o threads
Message-ID: <20191024063716.6562-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

For building libyang a toolchain with thread support is needed. Add the dependancy
to BR2_TOOLCHAIN_HAS_THREADS.

Fixes:
  - http://autobuild.buildroot.net/results/1d84ff4aab67a98113d967b65467109e80bb5917

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
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
-- 
2.20.1
