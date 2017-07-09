From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  9 Jul 2017 11:30:01 +0200
Subject: [Buildroot] [PATCH 4/4 v3] package/kvm-unit-test: available for
	big.LITTLE arm cores too
In-Reply-To: <cover.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <e9a53f9e66ea0d124e8c4ab028f01b41d694910d.1499592591.git.yann.morin.1998@free.fr>
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
index 3db10fc820..21eb2d51ff 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
 	# On ARM, it uses virtualization extensions
 	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
-		BR2_cortex_a15 || BR2_cortex_a17
+		BR2_cortex_a15 || BR2_cortex_a15_a7 \
+		BR2_cortex_a17 || BR2_cortex_a17_a7
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 
-- 
2.11.0
