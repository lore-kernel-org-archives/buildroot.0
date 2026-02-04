Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95794E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 667C681518;
	Wed,  4 Feb 2026 15:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bGAfjemmEC_1; Wed,  4 Feb 2026 15:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670948175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217879;
	bh=OqdXyL1vMP62OVs0SC8qkvOHUa1pvyxlDt+dsJHXfHI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f4cWly+fxc9axih/3yXaN600mJ1yhpgSwwDDahjKCFwLjpO0IpIzctk8aqBjUcypt
	 JdHBd13CSAu8Erz7Bmp1EgqoTy9114hwGmgO9tNrnfnn7OxhnR3+Pdxq/VaOcBXCMp
	 n4ZrygqqpopF/aMigk3QgbOXMIvs1gYV8Xo1P7IraSKB8B4MRpcdcVQJKg75d8O/yj
	 IBFy5cu4waR7EvyQJ6nBKXKdaDqfYTveN1Usw6zXUTq+ox/WAuP7bT7CKO9/xGsCz1
	 6gaH8rqBAPAFesChJSIVyWKHtHp+88yWCxkbBgUnsWHu+1TGRnNqCkUlc7E+46kVQ7
	 SeiNSgXWWywmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670948175C;
	Wed,  4 Feb 2026 15:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 779FB173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64B9260D98
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id immDzZzi_jQB for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A9E60D92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A9E60D92
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:11:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9278B821C9; Wed,  4 Feb 2026 15:11:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 16:10:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4e71c6c83924716b826a4eb1096eefbfcaecd5f
X-Git-Newrev: 137d6e249d9625ed9b58d6c8fea011901b413438
X-Patchwork-Hint: ignore
Message-Id: <20260204151116.9278B821C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvm-unit-tests: assume AArch64
 supports KVM
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
Content-Type: multipart/mixed; boundary="===============1987670894022186461=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1987670894022186461==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/137d6e249d9625ed9b58d6c8fea011901b413438
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============1987670894022186461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1987670894022186461==--
