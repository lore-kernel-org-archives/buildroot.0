Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2114C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 14:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC5D1606A5;
	Sat,  8 Aug 2026 14:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1QlPulizCukJ; Sat,  8 Aug 2026 14:00:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E09DD6065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786197605;
	bh=BoHap9DlZpHoQt6lgh+0n06uj4Vwn6gr0M0JZ9k9EHc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UkU2QqOn84dR6FWQRPXgEVjIeGxtwXlC8tfg89B+YfJJy5Ra+CWTRrRxtroM6WDK9
	 8pbUu22GUNig30sHdSpuAlyrLPGCTvJ8bAcErfcQe1JMDdT2cCVga4XB4N/e2cJ/lH
	 zHrcuPAHrK72Sxj8K+WNsHI2nmYOe/uj0Ne3FDXssUSGCJETRRqPpf6fWsAm/2hCs1
	 1L+EynoCYjnSG7xhMlfpbu2NLnEjLlyJdGV+HpBaUb2IDYm91dp4fd4t3OaFa6X4u1
	 uRZ0P8zNYoAj7k49K5gewRzMjfHiIQqWGikvImXociiOqqTBO9usCym3+mVMuPkPwt
	 oOsGxWLIncO1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E09DD6065E;
	Sat,  8 Aug 2026 14:00:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF221296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C098880E5F
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VFz6Cwhee8z for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 14:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5A5A80E5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5A5A80E5B
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 14:00:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D26278CA06; Sat,  8 Aug 2026 13:59:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 15:58:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5f0ca434e3a5e2dc7eecbb01743cda88a67995d
X-Git-Newrev: a96a0a758fa6b0d0e1f645b21a4f1aa749225580
X-Patchwork-Hint: ignore
Message-Id: <20260808135914.D26278CA06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-tss: do not show comment when
 dependencies are not met
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a96a0a758fa6b0d0e1f645b21a4f1aa749225580
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit 5394df6400912efa7da4f97c7ea68a81a9f77c1d ("package/tpm2-tss:
add Mbed-TLS crypto backend support") added a dependency to
BR2_PACKAGE_TPM2_TSS_FAPI, and a comment about this
dependency. However, the comment is shown even if other
architecture-related dependencies are not met.

This commit fixes that by only displaying the comment when relevant,
i.e when BR2_TOOLCHAIN_HAS_SYNC_4.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tpm2-tss/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 91337ce48d..f4bd8c3cdb 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -56,6 +56,7 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 	  https://trustedcomputinggroup.org/wp-content/uploads/TSS_JSON_Policy_v0.7_r04_pubrev.pdf
 
 comment "FAPI not supported with Mbed TLS backend"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_MBEDTLS
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
