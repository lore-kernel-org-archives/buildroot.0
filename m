Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15995606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WN3PR6lz
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7136069D;
	Mon, 26 Oct 2026 19:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cMJjiPaJfCqx; Mon, 26 Oct 2026 19:10:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AC6C3605ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793041821;
	b=rGGJI/tJZBQxfiv1arT6tHuwju5AIUV9FfDx1toQqYe6o7bhRjeZA4dPa9W+s2+3iCzs
	 XYXFW4ZoFNFLzChj1Pg8IPMe0K+5oHPgqL92NiJ9QAtYhroX/dk7G9aBvHDAILxPZrj3H
	 m4Oqtc7/LgWTNdj12wHaarph06nkZw3o+MfpiGIsGP7ZJm3KcOVGUQdncaU6CzTmlF+uA
	 O/nPp1OJqCt9JuVseBGbZf3nf+oWyCasJbuhYAXwnUp2XdfecCLk11DRMiWwVrfFWI6Yo
	 o04iQ/rfEyGZg+QQyAuXNao1x8nQYRNSqYXCCED157FcV5K+rFLWWEUCeUyWTHKIe0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793041821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hatvAo4RJttXFnQ1zJDqYl8+FoE06XSVDL3CS9I+fQ4=;
	b=dDEFw86MXuQUbK1I4g9bjIFt2wBMreWCo7ZKubDpA/qznwPTOISLTsejMTbuQ5Njzc1y
	 GGtvr+PW2R+xHrVVsiwybEupjnXf9pFdbwnWdZoufqZGaiwEjLqONkjrageoMA23u15+R
	 H/pETFNf3LaDYR7RPaEWQcl+OLecwZ0NNm1DXnG88/Sjk3W9mo0emWa4SojfVHZaxeNrs
	 1undKoJRghbtEnIt3GWjGmnQ5tFHzSR9EPgKMYloYyYz9V47KnBAGqFbx+VuFWH1QTEyA
	 1rIAI4Ouc1heStuYqA0vhb5zkBjoK05qaeuYkHTbIdm7ZTW9sanzR3c4bVxjQAmdRrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793041821;
	bh=hatvAo4RJttXFnQ1zJDqYl8+FoE06XSVDL3CS9I+fQ4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WN3PR6lzuZGiyVQJTgis2sQbOaRiyMtF600NiPwVfNSiphvQB5AEjvWDw+yzWTiyx
	 DLd4B7upP/IY9BQqt1XURudTS7ZnAF0wXHIcDlz8VMXXiZRQ8fOlRlxuBLLLB2Dgo7
	 hvnyEHV1gF+SJsq89Ox3X6ZrZr7RfQboXbge2/cSE1OWIm+875GdNgX4sHvleUjB02
	 BHeIj80E/i2cA8WqhnhIvIvByZ9IQHOFmlcJImTpYClHgOvcUN/nHXZPNUQqP0xvqT
	 GYY/BfAOW5eWJtGjRdvnzfa6Fi2krRN0XopN9ppQe+y4cNaA/m+KoJQkbf871l/L8F
	 vNbdKbCmG7sig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6C3605ED;
	Mon, 26 Oct 2026 19:10:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D3B344BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B96FC80A95
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PA8jEVHHgoK8 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:10:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48CFD80A79
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793041817;
 b=Lcpa8d90z3i8sh+9D+f+SWt5y0Iwpkoo9IyO6L1zl3v2lZ14nBH2Kkkdq3qPySzUs+6A
 cl6X/pIKmnMukhimho10eUidfSI3JOehTCF1KSDTH+Vqyyjld875khr64QWCsf/mJVevA
 OLIiNychapCgaF6GxrXk1s0pN6t2Abzpl9xiKTyjf9b/pGp7rTImlMy7ulWb3oyDSwBtJ
 XxJmq9C3lHRd9BMjVOiFNh65xxyD+8mO0E0DZWAIu+TqpNpVIZYNifZb/6ZhggXmsGIOc
 XUCK55Z0ODCkHIkQWPrP/2aWPS8K0y2rL4bbDUWclJ1rkbIUJd7lAWI3vLAEn0fDtJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793041817;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=yvaV37Fz2r2bhfbx30/UO7TMCb6vJrPe4FhVUA5ryhU=;
 b=AVPtEc6rx4RnBpocAZhWl4t6zYr8txCrPXsNiCV9vsqObQ8vkGpAN5KOtgOwQ/I9x/33
 7MtqH5FLImbyL9O7s9AG0D4lYp8t0bfsfdA1J6Wgs56/HveOSFt8yjmDIhqUO+K4OlAfZ
 lXm2i9Hm5zTTkie43ztPDNHb46XXgMXT50ERXCa51/QCt0vO1/NvzlHr0jQjyAlfM+5df
 Cz5S7rTCZxRNqfJkCRa1i6L8ibQBVZj78EI2H65pAX7qurQCSny+GMEkk3iJOEkkzv5LY
 2M2fFWjFgtLWTu9D8dAiavExVdRGlZmm47yAMR8D7omKdK5kcW6DbRkL45Y7MNzPf9w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=W9cDJUvN; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48CFD80A79
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:10:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1wPtZs30OP-014NRr; Mon, 26
 Oct 2026 20:10:13 +0100
To: buildroot@buildroot.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 26 Oct 2026 20:09:56 +0100
Message-ID: <20261026190956.376568-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026190956.376568-1-fiona.klute@gmx.de>
References: <20261026190956.376568-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:d8ZXCpZenwxkvV1nWQ+iLLCpHt3iqgEqT3BVClf/tO7rKfCx8DS
 ifm6wek1kpp2rTJPhWzxejU8Ys7ntc2BDY7EHv9L7WL6nibmk/Nt1P4Ajx5nOB7qowBkj8i
 zzr4UUKKx1FNsiDo9+0nI8oKfsStGCsvg2PJQYvnQc6r9JV8FAw8C8w1Nj3FYd+bYxTbPKI
 tAX3FTAu8BXyjrsroZGaQ==
UI-OutboundReport: notjunk:1;M01:P0:fSMlBdoFnmE=;5An8uEZUoZLyyhWZ8cAA+GdVo6B
 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
 ==
Subject: [Buildroot] [PATCH 2/2] package/swtpm: fix license information
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The SPDX identifier matching the LICENSE file is BSD-3-Clause [1], not
BSD-4-Clause. The LICENSE file was last modified with upstream commit
5f1ef9565df074b918a39cb4885af4190c98edb7 in 2015, before release
0.1.0, so the fix applies to all Buildroot stable branches.

[1] https://spdx.org/licenses/BSD-3-Clause.html
[2] https://github.com/stefanberger/swtpm/commit/5f1ef9565df074b918a39cb4885af4190c98edb7

Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87 "package/swtpm: add host package"

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/swtpm/swtpm.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
index d6559c22d6..3357be9c39 100644
--- a/package/swtpm/swtpm.mk
+++ b/package/swtpm/swtpm.mk
@@ -6,7 +6,7 @@
 
 SWTPM_VERSION = 0.10.2
 SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
-SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE = BSD-3-Clause
 SWTPM_LICENSE_FILES = LICENSE
 
 HOST_SWTPM_DEPENDENCIES = \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
