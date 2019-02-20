From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 20 Feb 2019 21:51:09 +0100
Subject: [Buildroot] [git commit] package/poco: disable build for riscv
Message-ID: <20190220204935.E68CC8847E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0737f48c5f8f502cd16123c5251d4ccaaee900ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

poco does not support the riscv target.

Fixes:
http://autobuild.buildroot.net/results/9a8/9a8213c502df53222eafc3ecd2fcfa36db20950b/
http://autobuild.buildroot.net/results/dd4/dd48cac70e8cb697b42ee51561902df81edcea40/
http://autobuild.buildroot.net/results/030/030c6cc8e2a59b015f8f3793d76234a2ef4ab772/

Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poco/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 75e31b7e1e..7e1257146c 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_POCO
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_xtensa)
+		|| BR2_or1k || BR2_riscv || BR2_xtensa)
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_PCRE
 	help
