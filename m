From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 22:05:23 +0200
Subject: [Buildroot] [git commit] ti-gfx: select fbset as it is a runtime
	dependency
Message-ID: <20140602200547.B14F29CDC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e10125d25455a734528b0a18c9bca6e5c1ba4ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Spenser Gilliland" <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index 3e8648e..4ee8622 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TI_GFX
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_FBSET if !BR2_PACKAGE_BUSYBOX # Runtime dependency only
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
 	help
 	  Graphics libraries for TI boards.
