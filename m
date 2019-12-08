From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:48:14 +0100
Subject: [Buildroot] [git commit] package/bitcoin: give a default value for
 BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
Message-ID: <20191208214104.8C02F7F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=caa5baf53ae496320ed3fd2dba03725280b4535c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bitcoin can never be enabled because BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
is never set as it has no default value

Fixes:
 - No autobuilder failure

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bitcoin/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bitcoin/Config.in b/package/bitcoin/Config.in
index c6788d5f98..78b248890b 100644
--- a/package/bitcoin/Config.in
+++ b/package/bitcoin/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_BITCOIN_ARCH_SUPPORTS
 	bool
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	# bitcoin uses 8-byte __atomic intrinsics, which are not
 	# available on ARM noMMU platforms that we
 	# support. BR2_TOOLCHAIN_HAS_ATOMIC does not provide a
