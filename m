From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 May 2020 10:57:21 +0200
Subject: [Buildroot] [PATCH] package: don't use BR2_KERNEL_MIRROR for git
 downloads
Message-ID: <20200524085721.641-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git repositories are not served on the kernel.org CDN:

    fatal: repository 'https://cdn.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/' not found

Switch to explicitly use the git.kernel.org server.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Cyril Bur <cyrilbur@gmail.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 package/kvmtool/kvmtool.mk               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index d83d31d2ee..a972602fb9 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KVM_UNIT_TESTS_VERSION = kvm-unit-tests-20171020
-KVM_UNIT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/scm/virt/kvm/kvm-unit-tests.git
+KVM_UNIT_TESTS_SITE = https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git
 KVM_UNIT_TESTS_SITE_METHOD = git
 KVM_UNIT_TESTS_LICENSE = LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
diff --git a/package/kvmtool/kvmtool.mk b/package/kvmtool/kvmtool.mk
index 5894e4771d..2984817c7e 100644
--- a/package/kvmtool/kvmtool.mk
+++ b/package/kvmtool/kvmtool.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 KVMTOOL_VERSION = f77d646ba01d04be5aad9449ac00719c043fe36e
-KVMTOOL_SITE = $(BR2_KERNEL_MIRROR)/scm/linux/kernel/git/will/kvmtool.git
+KVMTOOL_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git
 KVMTOOL_SITE_METHOD = git
 KVMTOOL_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
-- 
2.20.1
