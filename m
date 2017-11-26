From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:31:03 +0100
Subject: [Buildroot] [git commit branch/2017.08.x] kvm-unit-test: x86-64
 variant only available on x86-64 hosts
Message-ID: <20171126213855.A373480304@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32ea3609e49868d213b1affd5f3973b3b67c94ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.08.x

We use the host compiler for x86-64 builds, so ensure it is only available
on x86-64 hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a13029996f25c1fb60ee68a67344b963dee374c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index d0d9e2e..8b7908e 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -15,6 +15,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS
 	# x86-64 we use the host gcc (see .mk file for details)
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
 	depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || !BR2_x86_64
 	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if BR2_x86_64=y
 	help
 	  kvm-unit-tests is a project as old as KVM. As its name
