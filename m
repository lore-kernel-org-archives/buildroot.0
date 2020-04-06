From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Apr 2020 22:16:36 +0200
Subject: [Buildroot] [git commit] support/testing: test_tmux: remove
 BR2_GENERATE_LOCALE
Message-ID: <20200406200249.54DD68D1F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96ee994443b3f3ca5e6259c684bbfb80ea5034ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_GENERATE_LOCALE can only be used by uClibc based toolchains with the
internal toolchain backend [1].

The test_tmux is using a external uClibc toolchain, so the
"BR2_GENERATE_LOCALE="en_US.UTF-8"" line disapear from
the generated dot config (.config) leading to an error due to
a new check in the testsuite infra.

[1] https://git.buildroot.net/buildroot/commit/?id=bd0ffe2206fbd32baf7f4a1dc5fde81cfad70462

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_tmux.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
index 7eb23cac97..b31854cab3 100644
--- a/support/testing/tests/package/test_tmux.py
+++ b/support/testing/tests/package/test_tmux.py
@@ -6,7 +6,6 @@ import infra.basetest
 class TestTmux(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_GENERATE_LOCALE="en_US.UTF-8"
         BR2_PACKAGE_TMUX=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
