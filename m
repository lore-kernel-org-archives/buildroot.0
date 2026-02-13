Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74498EF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43213421EE;
	Fri, 13 Feb 2026 19:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R9oDvKk2YJgR; Fri, 13 Feb 2026 19:39:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60498421E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011568;
	bh=pDSLEho5Fk5e9Fp10rDiJdHWWZo2scj5vkgLBYS9TFw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FEcxWrocAjB2LyrEEQSs4rnH8lLeAeZYz1NNZB0ff/r+N2pxt83iU9t1aVoSsbxQg
	 aT1N9MRTe2Uef5Wuv5EBcLsyOvtodnBL03XYVlqTstNDyfgetnT/E6pu6J+olesO6I
	 EiDTj77slUotQ3of7iw7Fx0HkYLHoPhXY9F7QBOpR1RZCIJFc4xrMlITIDnbnGMck+
	 1vl88BSQ0AndHvkCDPv1uZTKMhJ9PIsHmzoYnECtjJZQWvawK22uEuwVxwl7BHBI4T
	 tlkxNlLB+1kAE/offepWGEG6nuln0wQpw9N5q+xaO2SNlI3SSGrnN+aVne1gInxbNA
	 8sgmokOCrk/dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60498421E7;
	Fri, 13 Feb 2026 19:39:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F277269
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77E3041307
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfYBclEn9oZZ for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A390413DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A390413DE
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F7E083DBC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 40f4ef8d4974b3ce25926668409921e0d430d680
X-Git-Newrev: 7f44219be530b1021e54c54d428b0d78085f7520
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.2F7E083DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/kvm-unit-tests:
 assume AArch64 supports KVM
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5375455327466133959=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5375455327466133959==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7f44219be530b1021e54c54d428b0d78085f7520
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Although it is possible to configure an AArch64 CPU without support
for EL2 in practice all the common AArch64 have supported
virtualisation from the start.

If we really wanted to be strict we could blacklist known non-EL2 CPUs
but AFAICT all the current ones in the config have EL2.

I should also note KVM on Arm is deprecated and was removed from the
kernel in v6.10.

Reviewed-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 137d6e249d9625ed9b58d6c8fea011901b413438)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kvm-unit-tests/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
index 0d66a08dd7..817d3c4a8f 100644
--- a/package/kvm-unit-tests/Config.in
+++ b/package/kvm-unit-tests/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
 	bool
 	# On ARM, it needs virtualization extensions and little endian CPUs
-	default y if (BR2_arm || BR2_aarch64) && \
+	default y if BR2_arm && \
 		(BR2_cortex_a7 || BR2_cortex_a12 || \
 		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
 		BR2_cortex_a17 || BR2_cortex_a17_a7 || \
-		BR2_cortex_a55 || BR2_cortex_a75 || \
-		BR2_cortex_a75_a55 || BR2_cortex_a76 || \
-		BR2_cortex_a76_a55)
+		BR2_cortex_a76 || BR2_cortex_a76_a55)
+	# For AArch64 we can assume all v8.0+ support virtualization
+	default y if BR2_aarch64
 	default y if BR2_riscv
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc64le

--===============5375455327466133959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5375455327466133959==--
