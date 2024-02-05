Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2018EC48298
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 401AD41726;
	Mon,  5 Feb 2024 15:41:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 401AD41726
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bKQ_ZUY0gcLH; Mon,  5 Feb 2024 15:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92949408FC;
	Mon,  5 Feb 2024 15:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92949408FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B81F1BF2F6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:41:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3301C400D9
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3301C400D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKWBUEXPqteN for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:41:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E9CC40022
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:41:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E9CC40022
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9A2C86D4A; Mon,  5 Feb 2024 15:41:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 16:39:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26890624ef64d06982d952335603ee8a9cd3c73a
X-Git-Newrev: f4ac946347cc0792956aca4d3ab2252aa9fbe2e9
X-Patchwork-Hint: ignore
Message-Id: <20240205154129.E9A2C86D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: bump to version
 2024-01-08
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f4ac946347cc0792956aca4d3ab2252aa9fbe2e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new kvm-unit-tests version has recently been tagged, so we can use this
version now for buildroot. It ships now with a full version of the GPL v2
license in the LICENSE file, thus we add a hash for that file, too.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kvm-unit-tests/kvm-unit-tests.hash | 5 +++--
 package/kvm-unit-tests/kvm-unit-tests.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 3b6d02dd8e..d4db9f2b75 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  9c9b093ffe3fa33145a53102de9c3e2d55cd0cdc8a20cf172b726296ffe22f4f  kvm-unit-tests-v2023-01-05.tar.bz2
-sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
+sha256  8636994e10240705f10a9150ef688ae6832d0ea0dcc8860c826c645ecfc1169f  kvm-unit-tests-v2024-01-08.tar.bz2
+sha256  b3c9ca9e257f2eaae070cf0ccdf8770764f05a947a39a835e633413750a5777b  COPYRIGHT
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 956f07b304..73d20d6b2e 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2023-01-05
+KVM_UNIT_TESTS_VERSION = 2024-01-08
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
-KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
+KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT LICENSE
 
 ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
 KVM_UNIT_TESTS_ARCH = aarch64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
