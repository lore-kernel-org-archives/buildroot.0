From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 11:11:04 +0200
Subject: [Buildroot] [git commit] smack: needs kernel headers v3.0+
Message-ID: <20140424091111.3A98B9C9B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36afe6de9c8760b4dc26ca89e97e78dce627e716
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

smack uses symbols that are exported to userspace only since Linux kernel
commit 1dbe39424a43 (xattr.h: expose string defines to userspace).

Fixes:
http://autobuild.buildroot.net/results/7fc/7fc69002fbb37962e65e0f83384ae7a4e6eac8a9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smack/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/smack/Config.in b/package/smack/Config.in
index 618a680..55e9d2e 100644
--- a/package/smack/Config.in
+++ b/package/smack/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SMACK
 	bool "smack"
 	depends on !BR2_PREFER_STATIC_LIB # dlfcn.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  User space programs and libraries for SMACK.
 
@@ -28,5 +29,6 @@ config BR2_PACKAGE_SMACK
 
 	  https://github.com/smack-team/smack
 
-comment "smack needs a toolchain w/ dynamic library"
+comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
 	depends on BR2_PREFER_STATIC_LIB
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
