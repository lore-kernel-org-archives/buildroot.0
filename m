From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  2 Nov 2017 11:45:17 +0100
Subject: [Buildroot] [PATCH 1/4] kvm-unit-test: x86-64 variant only
 available on x86-64 hosts
In-Reply-To: <20171102104520.29257-1-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
Message-ID: <20171102104520.29257-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We use the host compiler for x86-64 builds, so ensure it is only available
on x86-64 hosts.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index d0d9e2ef96..8b7908eee9 100644
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
-- 
2.11.0
