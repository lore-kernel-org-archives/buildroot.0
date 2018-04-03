From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 12:52:09 +0200
Subject: [Buildroot] [git commit] libbsd: disable for xtensa and blackfin
Message-ID: <20180403105357.516778349B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c810ef1ac425f043872653637a4f0fd5f2792bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
implicitly enabled libbsd for the uClibc only architectures xtensa and
blackfin. But libbsd does not support these architectures, since its
local-elf.h header lacks the required target specific definitions.

Fixes:
http://autobuild.buildroot.net/results/ff1/ff1a52a53bed43cda9e235081a61b352e6e07aa1/
http://autobuild.buildroot.net/results/b13/b13c2f248f277c72b5d266208f991f34474cea14/
http://autobuild.buildroot.net/results/182/182356701c2110a014c9d6c8d9f18a6efeb26e70/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index f6c2e4be4b..e80e9ea824 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	# libbsd does not support those architectures (see src/local-elf.h)
 	depends on !BR2_microblaze
 	depends on !BR2_arc
+	depends on !BR2_xtensa
+	depends on !BR2_bfin
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
