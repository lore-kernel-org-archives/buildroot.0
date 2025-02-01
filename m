Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4B9C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 13:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 417134B014;
	Sat,  1 Feb 2025 13:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQNbvUNKUywl; Sat,  1 Feb 2025 13:34:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 171844B058
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 171844B058;
	Sat,  1 Feb 2025 13:34:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11818185
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9A1E49B86
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FGLcf6V7tX2H for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 13:34:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AFE42B4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2AFE42B4A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:34:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D9386270; Sat,  1 Feb 2025 13:34:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 14:22:38 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9f057b8aa550e6445b64eae2ecfcfe5d11468cfe
X-Git-Newrev: 63b400f8f3366b19c1da757011bfdb933fcdec48
X-Patchwork-Hint: ignore
Message-Id: <20250201133409.C9D9386270@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/uclibc:
 deactivate time64 support for older kernel's
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=63b400f8f3366b19c1da757011bfdb933fcdec48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

For Linux systems older then 5.1.0 we need to disable time64 support
in uClibc-ng to avoid compilation failure.

Fixes Buildroot's arcturus_ucp1020_defconfig:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8925840027

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Julien:
 - fix check-package errors
 - add link to a build failure
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6a630519312f39faceb0039e7cf3ef2635a00101)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 600d72ce7b..16b693bdb5 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -72,6 +72,15 @@ define UCLIBC_BINFMT_CONFIG
 endef
 endif
 
+#
+# 64-bit time_t is enabled by default but needs headers >= 5.1.0
+#
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),)
+define UCLIBC_DISABLE_TIME64
+	$(call KCONFIG_DISABLE_OPT,UCLIBC_USE_TIME64)
+endef
+endif
+
 #
 # AArch64 definitions
 #
@@ -398,6 +407,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(call KCONFIG_DISABLE_OPT,DOSTRIP)
 	$(UCLIBC_MMU_CONFIG)
 	$(UCLIBC_BINFMT_CONFIG)
+	$(UCLIBC_DISABLE_TIME64)
 	$(UCLIBC_AARCH64_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_PAGE_SIZE_CONFIG)
 	$(UCLIBC_ARC_ATOMICS_CONFIG)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
