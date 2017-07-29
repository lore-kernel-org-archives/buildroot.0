From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:41:57 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: fix
	ARM internal fragment
Message-ID: <20170729133957.136B880236@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8097eb284bb289e3c872f9cb07aa1227ae93e67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The toolchain configuration used by the autobuilders to test the
internal toolchain backend on ARM contains an option that no longer
exists: BR2_UCLIBC_VERSION_NG. This option has been removed since
uClibc-ng has been made the one and only uClibc version supported.

Due to this option no longer existing, this toolchain configuration
was in fact never used, because the randgenconfig script validates
that a toolchain configuration is valid by checking that all lines are
still present in the final .config.

Therefore, this commit removes the bogus option, which will make sure
this toolchain config gets used again by our autobuilders.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/autobuild/br-arm-internal-full.config | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-full.config b/support/config-fragments/autobuild/br-arm-internal-full.config
index 2e70534..b5f1006 100644
--- a/support/config-fragments/autobuild/br-arm-internal-full.config
+++ b/support/config-fragments/autobuild/br-arm-internal-full.config
@@ -1,6 +1,5 @@
 BR2_arm=y
 BR2_ARM_EABI=y
-BR2_UCLIBC_VERSION_NG=y
 BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
