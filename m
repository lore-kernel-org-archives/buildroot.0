Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB63C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A31840B3;
	Mon, 20 Feb 2023 23:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38A31840B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ddw8bcaWhJom; Mon, 20 Feb 2023 23:47:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E17384101;
	Mon, 20 Feb 2023 23:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E17384101
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66CC41BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6C5541779
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6C5541779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M9cfjdFVDkCY for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E744176D
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1E744176D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B11FF86495; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:56:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d33a8417bf1bc5d7276e19da5c37da210d4de31a
X-Git-Newrev: e43a3c785b9666f3144e7905b27af920fff913e9
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.B11FF86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kvm-unit-tests: bump
 to version 2023-01-05
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

commit: https://git.buildroot.net/buildroot/commit/?id=e43a3c785b9666f3144e7905b27af920fff913e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A new kvm-unit-tests version has recently been tagged, so let's
update to that version now.
This new version now features a --disable-werror parameter for
the configure script, so we can drop the patch for disabling
this manually now.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ile-remove-Werror-to-avoid-build-failures.patch | 30 ----------------------
 package/kvm-unit-tests/kvm-unit-tests.hash         |  2 +-
 package/kvm-unit-tests/kvm-unit-tests.mk           |  3 ++-
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch b/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
deleted file mode 100644
index d07b9b6912..0000000000
--- a/package/kvm-unit-tests/0001-Makefile-remove-Werror-to-avoid-build-failures.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 08e14a662b9e75daec29722e49150869952ba1b6 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 20 Nov 2017 22:09:39 +0100
-Subject: [PATCH] Makefile: remove -Werror to avoid build failures
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Matthew: Refactoring of Thomas Petazzoni's original.]
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-[Fabrice: updated for 2022-03-08]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7231334..d9ad42b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -53,7 +53,7 @@ cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
- 
- COMMON_CFLAGS += -g $(autodepend-flags) -fno-strict-aliasing -fno-common
- COMMON_CFLAGS += -Wall -Wwrite-strings -Wempty-body -Wuninitialized
--COMMON_CFLAGS += -Wignored-qualifiers -Werror -Wno-missing-braces
-+COMMON_CFLAGS += -Wignored-qualifiers -Wno-missing-braces
-
- frame-pointer-flag=-f$(if $(KEEP_FRAME_POINTER),no-,)omit-frame-pointer
- fomit_frame_pointer := $(call cc-option, $(frame-pointer-flag), "")
-- 
-2.14.2
-
diff --git a/package/kvm-unit-tests/kvm-unit-tests.hash b/package/kvm-unit-tests/kvm-unit-tests.hash
index 42c3b4a241..3b6d02dd8e 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.hash
+++ b/package/kvm-unit-tests/kvm-unit-tests.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2edf2b188033a5d634150ecc797c797a85e5af8e3ef4ac3e583f60b2ee7bcf3  kvm-unit-tests-v2022-03-08.tar.bz2
+sha256  9c9b093ffe3fa33145a53102de9c3e2d55cd0cdc8a20cf172b726296ffe22f4f  kvm-unit-tests-v2023-01-05.tar.bz2
 sha256  d9bbb60891710d248f01c8bdac50ef7ad39188de512610437872e83112b38a1b  COPYRIGHT
diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index dd8f153710..956f07b304 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KVM_UNIT_TESTS_VERSION = 2022-03-08
+KVM_UNIT_TESTS_VERSION = 2023-01-05
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
 KVM_UNIT_TESTS_LICENSE = GPL-2.0, LGPL-2.0
@@ -31,6 +31,7 @@ KVM_UNIT_TESTS_ENDIAN = big
 endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
+	--disable-werror \
 	--arch="$(KVM_UNIT_TESTS_ARCH)" \
 	--processor="$(GCC_TARGET_CPU)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
