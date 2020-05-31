From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2020 23:19:01 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package: don't use
 BR2_KERNEL_MIRROR for git downloads
Message-ID: <20200531211914.A396685F55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d563a5fcef23f39b25119c2e3b499f3928b228e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The git repositories are not served on the kernel.org CDN:

    fatal: repository 'https://cdn.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/' not found

Switch to explicitly use the git.kernel.org server.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fb57a54cf8d56fb9a32a3d632346c58eb58177b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 package/kvmtool/kvmtool.mk               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 2637066701..19f8515cbb 100644
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
