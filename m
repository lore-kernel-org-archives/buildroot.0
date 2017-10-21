From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 23:09:13 +0200
Subject: [Buildroot] [git commit] libdrm: make Etnaviv arch-independent
Message-ID: <20171021210224.487748016B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23baa1c1cf8a5f3f78c9681017e4fadcab4404b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vivante GPU could be a part of SoC along with any CPU architecture
thus get rid of nonsense dependency.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index e48246a..581f921 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -64,7 +64,6 @@ config BR2_PACKAGE_LIBDRM_OMAP
 
 config BR2_PACKAGE_LIBDRM_ETNAVIV
 	bool "etnaviv (experimental)"
-	depends on BR2_arm
 	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC
 	select BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	help
