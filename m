Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E012CC433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44DEA60E19;
	Sun,  1 May 2022 19:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNFMCNRK-N3y; Sun,  1 May 2022 19:35:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11CE560BF5;
	Sun,  1 May 2022 19:35:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF6E11BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA8B82F41
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4S9FHAyXhxhI for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:34:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C174682F2D
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:34:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 098D584C78; Sun,  1 May 2022 19:24:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 May 2022 21:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f33c1fc87f5923213c1629c9c3ca779db48c5878
X-Git-Newrev: 8c05e5a069cf037a9ff314effd6415a433ac40cc
X-Patchwork-Hint: ignore
Message-Id: <20220501192430.098D584C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: fix license
 information
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c05e5a069cf037a9ff314effd6415a433ac40cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some files in kvm-unit-tests are licensed under the GPL v2 nowadays:

 https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/b29b222beb424a00

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
[yann.morin.1998@free.fr: do not replace LGPLGv2, add to the list]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index e56436f802..fd07ca85c3 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -7,7 +7,7 @@
 KVM_UNIT_TESTS_VERSION = 2022-03-08
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
-KVM_UNIT_TESTS_LICENSE = LGPL-2.0
+KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_aarch64),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
