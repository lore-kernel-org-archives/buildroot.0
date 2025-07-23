Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E7C83F1A
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 22:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F0DD80D9F;
	Wed, 23 Jul 2025 22:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-_rtC6Snnyk; Wed, 23 Jul 2025 22:29:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69D8D80F5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D8D80F5B;
	Wed, 23 Jul 2025 22:29:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 69532DA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E9DC80CEE
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZFB4HUTuOKj for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 22:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90CE880C4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90CE880C4E
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 22:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87B3186A99; Wed, 23 Jul 2025 22:29:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 00:24:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7b64eeeaff351bf1ddc810e3f70c03a23a93daa
X-Git-Newrev: 9809795c71c1d258ca08f37f4205d079e5286dd6
X-Patchwork-Hint: ignore
Message-Id: <20250723222933.87B3186A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: Add RISC-V,
 bump to version 2025-06-05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9809795c71c1d258ca08f37f4205d079e5286dd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new kvm-unit-tests version has recently been tagged, so let's
update to that version.
This version also add suport for RISC-V, add RISC-V to Config.in

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
[Julien: move riscv32 before riscv64 in .mk]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/kvm-unit-tests/Config.in           | 1 +
 package/kvm-unit-tests/kvm-unit-tests.hash | 2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk   | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 02ea8dd58c..0d66a08dd7 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 		BR2_cortex_a55 || BR2_cortex_a75 || \
 		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
 		BR2_cortex_a76_a55)
+	default y if BR2_riscv
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index d4db9f2b75..ad0922df59 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  8636994e10240705f10a9150ef688ae6832d0ea0dcc8860c826c645ecfc1169f  kvm-unit-tests-v2024-01-08.tar.bz2
+sha256  60015b023f34261c134d714f4670926ac81483e286a16475eb4a5cedab00eefa  kvm-unit-tests-v2025-06-05.tar.bz2
 sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 73d20d6b2e..1ed902b1a0 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2024-01-08
+KVM_UNIT_TESTS_VERSION = 2025-06-05
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
@@ -18,6 +18,10 @@ else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
+else ifeq ($(BR2_RISCV_32),y)
+KVM_UNIT_TESTS_ARCH = riscv32
+else ifeq ($(BR2_RISCV_64),y)
+KVM_UNIT_TESTS_ARCH = riscv64
 else ifeq ($(BR2_s390x),y)
 KVM_UNIT_TESTS_ARCH = s390x
 else ifeq ($(BR2_x86_64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
