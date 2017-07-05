From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  5 Jul 2017 12:25:37 +0200
Subject: [Buildroot] [PATCH 5/5] package/kvm-unit-test: available for
	big.LITTLE arm cores too
In-Reply-To: <cover.1499250321.git.yann.morin.1998@free.fr>
References: <cover.1499250321.git.yann.morin.1998@free.fr>
Message-ID: <cdc5ada0fd19765aff9779fc109a26284c9320b6.1499250321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since it supports each variants individually, it should also supports
the big.LITTLE configurations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyril Bur <cyrilbur@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 0283e97dfc..ec1826b2da 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
-		BR2_cortex_a15 || BR2_cortex_a17
+		BR2_cortex_a15 || BR2_cortex_a17 || \
+		BR2_cortex_a15_a7 || BR2_cortex_a17_a7
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	# on i386 and x86-64, __builtin_reachable is used, so we need
 	# gcc 4.5 at least. on i386, we use the target gcc, while on
-- 
2.11.0
