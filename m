Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196D5606A337
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=R9NhcoSH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E25C48128B;
	Sat, 21 Nov 2026 13:34:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSLkqawbjaUp; Sat, 21 Nov 2026 13:34:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C213C812B9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795268097;
	b=rk1f/8k8wf0q0yItDAgKfbfFVd8s6EKdT48+qOcwBlT7cNlltuDDSqeS+fDDGCl69bFT
	 wMtyfHTuuIHyvCNuA5UrRMai2fRnTdUR/CginXMAs0lhTaIAp59617AafTmbjC+Wggnfx
	 Par6J99/r83bn6Y3Kv84DZXUbJM+MJ7HRd+MyhDJFXWimYcP8MbYpsNMnbeBzfiVQrb19
	 lrbdhHw6qIRcn745UBqE5QPqqH9+f1lHijK600hUKXzu03dUB2fI34BhX28sYj6EdeJYz
	 F5JhzvhAoi7rgq46yybgo6VP6JRQOwEXYJcMC93UsyvkPyywQbqiduzS8cYZjEyjB4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795268097;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1qJ9XnyrP9z8WsfU8qBUb9SecXMMoCfr/xGIg/Dca6s=;
	b=bVsiNRhueLtfU+mbB0BgBDgTt6Sd+rs6hQHO1XYJyxaOgqRxSE9vvbqKijHhNDJ4o7Pz
	 UWxp5ks/9/z+jw4n3BX4Fpc25WFsPtu08ufVO0ayiIi0E10EmLRtpeVNsucgFHt2RQIK/
	 4DoloV8brCoIUUF1DRpDjcGjBrJOfZZTkap521dniQlyzWjwxpPpLZ6Oo2m3MmXvOp1y7
	 caNkEv2UCZZCjaSF6zzr9JM8E82EM28RuS4QSbPqz08Tv3R0HNjT7ditbo8LaG+srQNsT
	 e7duUp9gH3BjaQQ3nzBu0uAo5vPysF6Zzz92LsqfyjPN869miXHu8E+a8/3O8GKmRgg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795268097;
	bh=1qJ9XnyrP9z8WsfU8qBUb9SecXMMoCfr/xGIg/Dca6s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=R9NhcoSHTws9Ut7rBexJlqaURzlPqmV3GQSvhTwBdoxk9vPp1LYUgGAugm9yZEPPa
	 MXgIIO/1THPPupqZxn0kKzk0yMVACxP+5iFW4cfVTU3r98YWqzEACANHcn+to8vxSz
	 KIs3Rej9z1VeAIqA8Q4zGEvjFyVZr9pTaGB9OrgfKxFOy+CQg9gkQZ46ymQA2486jX
	 94cEpDrmqL5QBQmBZIUPhyNkqm/Gy/O/tGteZ+Wz8Ve5G7hvYSmbKFroKenmF3i19g
	 GeCiGMhasAvv5YeM9/ngyVtHM0H242zfTjtvWKUFB91hliGikzuGLtf8yCo9B5yR3W
	 gqe6eYapdbtvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C213C812B9;
	Sat, 21 Nov 2026 13:34:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10BAD15D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA6994076C
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nureRW2Xopu for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 13:34:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E2374076A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E2374076A
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 13:34:53 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795268091; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:BFNy/SDqMBznwOLHo+apigtLsn7o
 Eg8ZM0CkbTwL/x1TX54UPx9OoXkdrhCkspAiB/VpRACKN19MgT/Pxoea5cTl0X3OpS/1gmgLo0u
 CsxJihAPx/j7ORGPxnE4gS6ZarWy8ODGyXWDph0zocif7FiueXyh5jqh7kiHHk/CR8mPN0ObeYs
 ANd9y8CIZ8i5y3ZNEGoVQ1YxZZFmtBkgxewB45kV+Hf5EwhV58yf2VxAMDrKlTYCOug++IFi1Xv
 A2NC/ShB2eCQ3/QVBR1EvJQ256S4c1EblqG7qTY8uxnA2Rzk1HxVWnSzWsg4kSyCPxxQm41diva
 D/4X29QVRz1N8A==;
Message-Instance: m=1; h=sha256: kQ7TOAf7vdobO/7bjdVUXVwQNq2rCUnaKLtEfKHLV7g=:
 g7j1l+AK4oE1vxPYLdHJa1eWEFry40iqbtH6NnEfh4E=, sha512:
 +To0Ntana5Wv5iBRhpEN9CFLEoBwSFqWjWvLV9b0INpVJJddwvqplfVaqOYs+iSDJP6l3dnZkGSLLzPVmGc6ZQ==:
 7ocEluAWWHkyPdRracHW982uxTygbP/64lXCivItpQp2SUeq5S0unuFxNJJIWUiEP3w75jybv3J7lEKv3wJmvg==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UV8-1xVJTF1u0g-00HOsG; Sat, 21
 Nov 2026 14:34:51 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 21 Nov 2026 14:34:37 +0100
Message-ID: <20261121133437.915224-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6QJ2MpV7qEIh/60mrqQE23jdTWhlR2k6+NbeEJ1gw1ML2HsStpV
 q6zL0rTIzAqqK9qqJBPscZOjuDpnn/LT12HSxj36xUo1JPW9jQd3m9Rcl8gdWZpsiCRS6bL
 SqpbChjqwWrFFw0p8cfMGqt/H4Gb9rBp+6ncAGIuxsPNymuhCk/kY8ewVfVfFpJI47s9+Ag
 qleq0G0iu2cUXOEvSoO5Q==
UI-OutboundReport: notjunk:1;M01:P0:htRWR+dRIxI=;f2MrNF9iDYhLDcEBhbk//W9l2+X
 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
 85XXzhGejQVrnEh
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix download URL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U-Boot downloads moved to git.u-boot-project.org a while ago (see
747aa911f6a471558a5fb2a9e1b133d13104cae8 "boot/uboot: bump to version
2026.10"), and since early November ftp.denx.de is no longer
responding. Update the site URL for package/uboot-tools to match
boot/uboot.

Fixes: https://autobuild.buildroot.org/results/813/81326375b92b75936e02b5dadea5729811ecda98/
Fixes: https://autobuild.buildroot.org/results/db1/db198283e319a4cb997c1567180290a79663e3ad/
(and many more)

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/uboot-tools/uboot-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 87b708ac5c..72b387c41c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -6,7 +6,7 @@
 
 UBOOT_TOOLS_VERSION = 2026.07
 UBOOT_TOOLS_SOURCE = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
-UBOOT_TOOLS_SITE = https://ftp.denx.de/pub/u-boot
+UBOOT_TOOLS_SITE = https://git.u-boot-project.org/u-boot/u-boot/-/releases/v$(UBOOT_TOOLS_VERSION)/downloads
 UBOOT_TOOLS_LICENSE = GPL-2.0+
 UBOOT_TOOLS_LICENSE_FILES = Licenses/gpl-2.0.txt
 UBOOT_TOOLS_CPE_ID_VENDOR = denx
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
