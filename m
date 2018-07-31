From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 23:01:58 +0200
Subject: [Buildroot] [git commit] package/mesa3d: fix xlib_libxshmfence
 dependency
Message-ID: <20180731210652.3D8048B353@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0386515cda6ec9797cf3dd4b6ece8f956fccf228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/6b2/6b214f1013d2def0b7ff33af3115147f47afd7a1/
http://autobuild.buildroot.net/results/8b8/8b8251235f6b08ae2275659f7af241d6d43df074/
http://autobuild.buildroot.net/results/468/4681b76cbca66a267741df80719a4c2e032c6b00/
http://autobuild.buildroot.net/results/90f/90fee90a4a8f6bb35be94ee437f8f7c1f0cbb5d9/
http://autobuild.buildroot.net/results/1b8/1b862e22f9d1dfaf9b8d3a998061a83012302b05/
http://autobuild.buildroot.net/results/ebe/ebe3e12887c89649ad3de0045846836957d83396/
http://autobuild.buildroot.net/results/b7b/b7b300cc056bdc51a0570be2f250b806e306999e/
http://autobuild.buildroot.net/results/c39/c3960a95741341114ced8907de09b6a266999184/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index dd36a5e0fd..eec72654cd 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -57,7 +57,8 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_TOOLCHAIN_HAS_SYNC_4
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
+		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
