Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77ECC88E5C
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 12:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 964F060817;
	Wed, 16 Sep 2026 12:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFsMnes6vw_x; Wed, 16 Sep 2026 12:46:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF0AF607FC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789562800;
	b=e3TZj2KRpIsU+AxfXN32NXBCzJiGbB1qCV8bQ+BwagLTdYpgVFaqN9kEBAEY87/VS70l
	 SN6ppTDN+DY7bWQDfQDIN6NUywCpqHE8htg/tDRe02iBRmMq8M/o7XxLy8ClGFM5COBXE
	 8obfVrv2j9PVJCeciryA2xwgLKPkyQR6kOhHKnm/n9r58X6F8IRA626SF6JMuGArb2CSX
	 7R4eSn4kpunzkTZlHzoslPjGYSI+5bCdMC5+tl891ZdLlMaoILG2nwsDe5tinR1II6yOV
	 minHd7jWqhj7er+exl7zs+RoVhjKvq4+bUXwlBC95px1frNpZ572ZFFv+qRR2jnpe5Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789562800;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	b=FEaOBMXRTKSKcDBUOx5BfHVB7vIxA9U027cUeTHhqEynjD39VXaiIJXx2BPkwCa+nWIi
	 CbKbyRSseKyEspiFTRW7bIZsWz9KE53dahk6bgnt9GiENFAu6Sj7Qeprb5Ouyz65M2Af1
	 +ogW94sm3kW8k24ynWrpteD3DrCB5TLZDm629choZiwHhY+XRdPcr8bC6+4c3bRUvUtCy
	 IC8OUJp2JQ8Ux1i1Njcsp/DNVXZSWVgH0fMjk9SfZ5a83MxTo8etvsAxbaIuK/+JT1XPV
	 ST4Caxlz8pjgnwLn3EhTDBdRggOWzsc3c3rsfFkGIwl4J0ApEWrPZl1CCO9ZuzxtFeQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789562800;
	bh=QSgvpbgMdsGp7T0rHazj2Dyf0lJXCI3VsP2FiUrQi60=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s5j+F0iRT+j0U3Stix3Q9R+CrlmBcNt8vW8wSKkqG1TLLx2edy1NP2Qk3H4g11gw5
	 8fmKULnFcRZxzN/AyQOXorBaTV88a4zN3GpU0I0zRCGbZTrH/4qdrmfhjKu1DeKDJS
	 xga5b6Cz6rNymiD/PrAnlzyVGVPA9Udl9ANUSpaSvivqZW57EKhnHrAYHLYJt/KBIJ
	 Lb72Fq7SyPsuU/+zFziiFpFlm4GEZ/aoXRoTmG8o74Lx5zoVxgIALtooNaNbUV09mQ
	 HDgF1wUU2AiwDjEY6YDIPy8/0S6w7totFcL5k2zYobUk2oHozrtDewse3hjQDMmYjV
	 8dtbinz84qL7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0AF607FC;
	Wed, 16 Sep 2026 12:46:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F7A29B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7250380E8B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p923yBu858Nu for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 12:46:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 32BF380E85
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789562798;
 b=l73vzXyK0KCTfb3kJmV6pz8lvCRwcJ98FDcPvmTRSnV+fj48clp29dV6gu1mdpra75hw
 xOBDy3aA9MxljVER7r9crLBEWHlkEdAWXWfaxjYSqX8dCTedU2eQrGclzAnZBrwFMv/dy
 +CP5p/OM2f+oklE0khdcXyIinO/D7QPQOjnmPrPG8yR/9GlXhLhVpu+aHZ+ol2aIyI65F
 IlwUxOa3pM1lc4skjMkCRBf8b76+MtjNm24bhuqTMHYLiYaKACLZ8r+GsuqSpbysLcgEZ
 RwtSTRpVQaE9TuJ3/mbNn4DhO9toQPoRtoOip0zyIf+AEyTeqYR6w7lHmarhv5BJgDg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789562798;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=dXBNFT/ilN9NrDPQ/xDau5WtRo9qlBDWUOzq9oFWC3U=;
 b=kWp+EJ1l27vAYavMpLQmOkeOb4TzCk9WnW01pJ23Rya621CwnFQ4qymw9BZ8u/YjEKoq
 +1g9F9R+B1jteKmLADdSKa984qIHMG3KmvU19AxriQ2bKgDOlm3vS2BNwYlgsvtsPPbqg
 cXrlKcDPW4NrbTIIm0zdnW4rRgyKisvoIYN9mMJORKwxIqW69frTI/3bG9jtQc2d2Ej/k
 Bw/9hMI39N4j/Ab6utu8vadI+/JVfVlP7EmUR6TfuPf7DQaK/iin6ahKjPOF6zOYd5Ggl
 wOrWQVN92+AZVgXkZD8k/gLMtyRu9Gpur+1JsthRjxq79GVVHqHG7wMXskFJmvdnAFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=XVdt2SG0; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 32BF380E85
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 12:46:37 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1xMpDO3Gfu-00Kiwl; Wed, 16
 Sep 2026 14:46:28 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Wed, 16 Sep 2026 14:46:07 +0200
Message-ID: <20260916124608.2644663-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916124608.2644663-1-fiona.klute@gmx.de>
References: <20260916124608.2644663-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZmKlbR5Yduwjr660EHK5mplHmdYuf7pZPqfOjAY6gArRfS6Crb2
 I/sEF7ZudBHtr7jPr+xNMk1kIIpEV4xSm+vaDE2+7e888Bz9Sn1HcsmbNZhrl4lgqv9fnA5
 C56IhyHbJvwlANEQqdZ0+1GQ2iZOeXl5+hvnz2BTydsZQcLqNDKRYkgAqT0+aO1hbCU2+rF
 +q3id4ooX3ix7eVJ0PbhQ==
UI-OutboundReport: notjunk:1;M01:P0:ZU91HLHaS3w=;HNPG8eiGLWy4I/dBhfhY+mbHuhm
 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
 Zxzb6hgOOUQuFjj/F6cIyjTXcjexqF6574g==
Subject: [Buildroot] [PATCH 2/3] package/systemd: select
 BR2_PACKAGE_HOST_UTIL_LINUX for host build
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

HOST_SYSTEMD_DEPENDENCIES already contains host-util-linux, select its
config option to avoid confusion.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 package/systemd/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index fdbebaee7a..eff71d0d1c 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -2,3 +2,4 @@
 config BR2_PACKAGE_HOST_SYSTEMD
 	bool
 	depends on BR2_HOST_GCC_AT_LEAST_8
+	select BR2_PACKAGE_HOST_UTIL_LINUX
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
