From: Cyril Bur <cyrilbur@gmail.com>
Date: Fri, 23 Sep 2016 15:47:17 +1000
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: bump version
Message-ID: <20160923054717.23785-1-cyrilbur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Most importantly this version includes a change to kvm-unit-tests which
means it will stop looking attempting to include host headers. This
change should fix build breakage on i386.

"ERROR: unsafe header/library path used in cross-compilation: '-I'
'/lib/modules/3.13.0-042stab111.12/build/include'"

The new version also includes more powerpc tests.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 989d398..7fd03ad 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 682187afcc998bc3dd25061e98b43792cc340b33
+KVM_UNIT_TESTS_VERSION = 0b04ed0610035792514fd8499eb4dacc185520d9
 KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPLv2
-- 
2.10.0
