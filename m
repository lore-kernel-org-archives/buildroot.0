From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Sep 2015 12:13:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: needs MMU support
Message-ID: <1441447989-9063-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/405/40562b1b68bb7c57a37907eb16fcae88448f5bc6/
http://autobuild.buildroot.net/results/194/194ee885dd195706bded3ed524ff1685f4f6d4b5/
http://autobuild.buildroot.net/results/55c/55c00309bc7497529d28e48dce14299adeb11ede/
http://autobuild.buildroot.net/results/5d4/5d4e40fc4bb9c5a7ede26434c3d6ab325c631ecc/
http://autobuild.buildroot.net/results/8be/8bead9cfd826843482ccc37e9c1290b8774c8de0/
http://autobuild.buildroot.net/results/401/40100e6b07c3057ba427975ffdf3c3834c6fb385/
http://autobuild.buildroot.net/results/d70/d7083a8b197e1833ddaa30620ec1037ed15ec0ce/
http://autobuild.buildroot.net/results/6a2/6a20f29e65f446165b21cba3d55294e6ea446ff2/
http://autobuild.buildroot.net/results/718/718fdc0e5c67fd5cb1bceaec97f39285c159fbda/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/Config.in b/package/libssh/Config.in
index 080ad18..719ca8c 100644
--- a/package/libssh/Config.in
+++ b/package/libssh/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSSH
         bool "libssh"
+        depends on BR2_USE_MMU # fork()
         # Either OpenSSL or libgcrypt are mandatory
         select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
         help
-- 
2.1.4
