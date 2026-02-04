Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C1DE9539A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F51A40C8D;
	Wed,  4 Feb 2026 13:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYnHHgFlpuVo; Wed,  4 Feb 2026 13:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9495E40C96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211844;
	bh=TJaGdwmksAcGn6tHijlQLYFIKPd1IfVao8X4BrQxOtw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BUDei6nUSLEQb69x6yABMKSI5G1Xz3AJdMSlXuDIlPuo3TtfsCcEWGQgbBoMNYPyT
	 rf54rdXsNmbgrrhyeDMMSxLRbOt1skH8SJhk+f4Tsh6ElQ3kdU4NdqWug19cLGsNKy
	 DX1pY6jUxKLq75Z50kCV/NghHvuy+LrCOFhH6U8yqfa038LJkeoSKvqvA6UduT9OJw
	 1yrcHzZy75DdME4d+SMyz5HlIdSfXOyXQBsUusWoI/9QmBEvSSWFdpfN0PRzBdvKbP
	 0c4DOo6Ctu0lFOhigut8zwYaFvA2qDHdOmDtViMeiyMCuCxstNUYu0hilpFgQZbsR1
	 WUg4q46SLtgOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9495E40C96;
	Wed,  4 Feb 2026 13:30:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93356F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BF6F40C8D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5x6tEeMLLv2 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A893740C78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A893740C78
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 972D6868F8; Wed,  4 Feb 2026 13:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 14:25:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a63ee3c09e95bfd7afd7822a1a9254e361b940f
X-Git-Newrev: 302a325f1f15d80aa0675841f50b2f8964680cb6
X-Patchwork-Hint: ignore
Message-Id: <20260204133042.972D6868F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brotli: fix LoongArch64 build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/302a325f1f15d80aa0675841f50b2f8964680cb6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 473c9400a0c7be14e7eb8ba617697a76286915b3 bumped brotli
to version 1.2.0 causing build errors on loongarch64. The build error
does not occur with brotli 1.1.0.

Fixes:
https://autobuild.buildroot.net/results/57f/57f61a5fd17432bba05e4f1865f82cc2f4626d3c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sable-BROTLI_MODEL-macro-for-some-targets.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
new file mode 100644
index 0000000000..d35b4b3336
--- /dev/null
+++ b/package/brotli/0001-disable-BROTLI_MODEL-macro-for-some-targets.patch
@@ -0,0 +1,46 @@
+From e230f474b87134e8c6c85b630084c612057f253e Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas@google.com>
+Date: Mon, 3 Nov 2025 07:20:19 -0800
+Subject: [PATCH] disable BROTLI_MODEL macro for some targets
+
+PiperOrigin-RevId: 827486322
+
+Upstream: https://github.com/google/brotli/commit/e230f474b87134e8c6c85b630084c612057f253e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/common/platform.h | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/c/common/platform.h b/c/common/platform.h
+index b59f9b809..e1254d5ca 100644
+--- a/c/common/platform.h
++++ b/c/common/platform.h
+@@ -213,6 +213,10 @@ To apply compiler hint, enclose the branching condition into macros, like this:
+ #define BROTLI_TARGET_MIPS64
+ #endif
+ 
++#if defined(__ia64__) || defined(_M_IA64)
++#define BROTLI_TARGET_IA64
++#endif
++
+ #if defined(BROTLI_TARGET_X64) || defined(BROTLI_TARGET_ARMV8_64) || \
+     defined(BROTLI_TARGET_POWERPC64) || defined(BROTLI_TARGET_RISCV64) || \
+     defined(BROTLI_TARGET_LOONGARCH64) || defined(BROTLI_TARGET_MIPS64)
+@@ -665,13 +669,14 @@ BROTLI_UNUSED_FUNCTION void BrotliSuppressUnusedFunctions(void) {
+ #undef BROTLI_TEST
+ #endif
+ 
+-#if BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3)
++#if !defined(BROTLI_MODEL) && BROTLI_GNUC_HAS_ATTRIBUTE(model, 3, 0, 3) && \
++    !defined(BROTLI_TARGET_IA64) && !defined(BROTLI_TARGET_LOONGARCH64)
+ #define BROTLI_MODEL(M) __attribute__((model(M)))
+ #else
+ #define BROTLI_MODEL(M) /* M */
+ #endif
+ 
+-#if BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
++#if !defined(BROTLI_COLD) && BROTLI_GNUC_HAS_ATTRIBUTE(cold, 4, 3, 0)
+ #define BROTLI_COLD __attribute__((cold))
+ #else
+ #define BROTLI_COLD /* cold */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
