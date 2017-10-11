From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 21:58:40 +0200
Subject: [Buildroot] [git commit] libdrm: VC4 change dependency to arm OR
	aarch64
Message-ID: <20171011195126.D54278110E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95108c5895897fc1cc5707fe68e6e345e307f255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable selection of VC4 driver when compiling for Rpi3 using aarch64

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index b90aea7..e48246a 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -94,7 +94,7 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 
 config BR2_PACKAGE_LIBDRM_VC4
 	bool "vc4"
-	depends on BR2_arm
+	depends on BR2_aarch64 || BR2_arm
 	help
 	  Install vc4 (Raspberry Pi) driver.
 
