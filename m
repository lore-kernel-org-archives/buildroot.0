From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 12:23:06 +0100
Subject: [Buildroot] [git commit branch/2020.02.x]
 support/testing/test_hardening: add missing Kconfig symbol
Message-ID: <20201114110939.716E08367C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd8bada8030d30ecd4e7436e2eb86618aa3c3964
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y is needed to use the
custom external toolchain x86-i686--glibc--bleeding-edge-2018.11-1.tar.bz2

Otherwise the symbol BR2_TOOLCHAIN_EXTERNAL_URL is lost.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981738
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981739
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981740
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981741
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981742
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981743

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7b9762f4ab5bf21bdb1cf29cc833c5d4d1ec009d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/core/test_hardening.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/core/test_hardening.py b/support/testing/tests/core/test_hardening.py
index edfb3315db..60e14303a3 100644
--- a/support/testing/tests/core/test_hardening.py
+++ b/support/testing/tests/core/test_hardening.py
@@ -10,6 +10,7 @@ class TestHardeningBase(infra.basetest.BRTest):
         BR2_powerpc64=y
         BR2_powerpc_e5500=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
         BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/powerpc64-e5500/tarballs/powerpc64-e5500--glibc--stable-2018.02-2.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
