From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:29:41 +0200
Subject: [Buildroot] [git commit] package/kvm-unit-test: available for
	big.LITTLE arm cores too
Message-ID: <20170722212548.1BAC78010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2577484da9859f25c3baa15a84bd0a60306931db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since it supports each variants individually, it should also supports
the big.LITTLE configurations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyril Bur <cyrilbur@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 5c1c04b..8b172c3 100644
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
 
