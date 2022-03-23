Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11603C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 11:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69B5241A51;
	Wed, 23 Mar 2022 11:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjeajalgeOw1; Wed, 23 Mar 2022 11:12:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DEE04160F;
	Wed, 23 Mar 2022 11:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A95B1BF5A2
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 559778496B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 11:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yfti2__lWVPR for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 11:12:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49893849AA
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 11:12:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 58F65851C9; Wed, 23 Mar 2022 11:03:09 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 12:07:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eaa8fcf546d84e38990566e49f4730c530d2577c
X-Git-Newrev: 4f9a011ab2c125b70c93e510812f00465a929142
X-Patchwork-Hint: ignore
Message-Id: <20220323110309.58F65851C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: add s390x support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4f9a011ab2c125b70c93e510812f00465a929142
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

s390x is supported since
https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/3934308046e5f113e19ed0ada002e2ec33335b8a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kvm-unit-tests/Config.in         | 1 +
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index e470dd6157..a3d6756fb9 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 		BR2_cortex_a17 || BR2_cortex_a17_a7
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 
 config BR2_PACKAGE_KVM_UNIT_TESTS
 	bool "kvm-unit-tests"
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index d610442e03..2d05d08067 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -16,6 +16,8 @@ else ifeq ($(BR2_i386),y)
 KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
+else ifeq ($(BR2_s390x),y)
+KVM_UNIT_TESTS_ARCH = s390x
 else ifeq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_ARCH = x86_64
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
