From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 22:14:08 +0100
Subject: [Buildroot] [git commit] freerdp: needs shared library
Message-ID: <20150310211544.05B1E817F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57e51169e553c8f3d059b8ba408064013d82fc84
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e5d/e5dee5220cbda69e4085cbddc842c7512d500163/
http://autobuild.buildroot.net/results/edf/edf03933caa8dc35cc42bbdd14cd83c1fb952a4f/
http://autobuild.buildroot.net/results/4cf/4cf8b172f7d662aa46d359ed56572afbdccf1d85/
http://autobuild.buildroot.net/results/d39/d3922966e951f929615654e58c36bc05775fa22a/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index ea36e0e..445bc2d 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FREERDP
 	bool "freerdp"
 	depends on BR2_USE_WCHAR
+	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -39,5 +40,5 @@ comment "freerdp server and client need X.Org"
 
 endif
 
-comment "freerdp needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "freerdp needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
