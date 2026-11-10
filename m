Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03360A2600
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FjdnXaWK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=qfV24Dos
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138FD408CA;
	Tue, 10 Nov 2026 16:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkboJ1AeV04s; Tue, 10 Nov 2026 16:13:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 47E2C409ED
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327185;
	b=FjcpVUoA9w+FFuYwbt4MpqZBsqWrdifhjGAxCtEs0dpV7PihLUGz2t7/yRRp/F/upikL
	 1WP312ErebcvbvPZQjg4W99Ft1s07ouN3raYyap6KZq3BCLbFndp1GVJoY0LPKZfep3rF
	 mvOVascnykZO42ZDMeUtbXHyqE2vuycC1U8p29dk3JADU0/Ggp9SWE5MO7zWLaV2oCg+9
	 d8ua+rFAMCZZ8KYq83ilekeAhTARqbV/Tv+1H0R50YLAesrFiIjYKQQR+jsLzaW9uUF1l
	 yq74m+JI7zX1suLi+NG584S1H5JVbS1xNqooAnFfM6QCD33xmPnBhdANGDBRWi4i7Gw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Received:
	 MIME-Version:From:To:CC:In-Reply-To:References:Date:Message-ID:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iAF9BMIvVv9mqZ0OKQ6NWVZmfzvXOboUFdyGh4GqlSg=;
	b=b2q6dMVoPFvLeldhcdioi2isuId3DdRz6GkVfGNW/e5QFLCWvHC2Xtb8pZpOQCpRPoJq
	 lGrejPYAIww9b32AphfRG8H/Mzc//LsE6+hzm49xIQdK++lTXEe5QBEz+qcDFVszl74OF
	 1SiSv0CjRB8Kk0SO/lPvy57GqnfAN/IyVZwHv/HAu4q6ZlFYXGQZe0fiu7qMmfYndiBDv
	 FpbWJJXbtk4W9rpHzwM692gqbqDcJMSzC9VJ+MNLeMHglr1pPpPcd6zeqciRWKB9zQMNJ
	 hGAVt1Aw20L9MJ5LidwNWeU4ebXg6WbhYcWY3PIzuGktHx5nQ/UNooTm+K+9lxfDCnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327185;
	bh=iAF9BMIvVv9mqZ0OKQ6NWVZmfzvXOboUFdyGh4GqlSg=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FjdnXaWK+JMv158Vp5REDTiUe2f734kZYPHM8qmm0b5aJb0U9ih5JlzawJ/qWR155
	 0CRHHrgWN3vXaWBRDMnecctFv3kKEYBJHrEAnyiFG/xiGMrNbV9ba0KHQf8Ha2Chi4
	 dIEnkxfqGeUm9FyaXWNxdimFzSt7HyDbB9/0KiZvogbNxnjZgEot2JWAZqiECoImYL
	 1bkqnpGaoQJd7bBT2DPeKUwqlDUzoM2E2XwnRZQxSOV2NldZQFLuKaFSpYLMzfCk40
	 zcns2M1dAqkAylHasJ+XAR/kg3uu25obp7H5B/2rLnEMUuzYLjH8BW76e4Xp0DH1iL
	 0Eh6bVJpQ9LWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E2C409ED;
	Tue, 10 Nov 2026 16:13:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE5A1731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90AA98112A
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yGJ540jek8GZ for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7C4A98112E
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c200::5"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=qfV24Dos
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C4A98112E
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oROc/bMZ+Njxgr4dMh1ottEQzwNl3PNkhYxHWdyxgA=;
 b=qfV24DosfnHyKm+GZC+C4HCPtWmUgnvkBJ0B0WvWsQ7ejZTwLLHsNiCYE7uE+PE8eTOwEmVHuA7pelR4x3tgqhpknG2F0l55D6tKAvHtwgjn8As/yBT87r7p4Xfk2z39eV7po1AOsSy92XJAjKjgmQzeByka4DllaJfMTuCBqCc=
Received: from DU2PR04CA0026.eurprd04.prod.outlook.com (2603:10a6:10:3b::31)
 by DU0PR02MB8315.eurprd02.prod.outlook.com (2603:10a6:10:3bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 16:12:48 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::65) by DU2PR04CA0026.outlook.office365.com
 (2603:10a6:10:3b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:12:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:48 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail02x.se.axis.com (Postfix) with ESMTP id 5F813149E;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3F58E305D285; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-6-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
 <20261102152258.1948796-6-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715368.3490013.11877111922731710024.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=371;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=W6ugRP/pUocFhVuFogqn8GA1nHZtnbW3jYrvjsqyONc=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FTr+UFgxwJmcQfLWVunLp/TmHnZZfGt1D9zL0265
 xSraNH2p6OUhUGMi0FWTJHlnNH26P3J/3TnSDtdgpnDygQyhIGLUwAmUpbPyLB1zacbD27MW1gv
 Z7EmUfzD62nGv39PXMm97t/1+8vvltwSZfjvHPrKaLFa+IR2H+PD12Yz1GjoOX5z1Et1XOv06wJ
 D3DEmAA==
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DU0PR02MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 44fc31aa-eaf4-466f-4c6d-08df3f4576a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|4143699003|261028144727099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: L5/+qq47biAXhdiNs9fbWC+QSn/FZIoHK0IaA4/xsysYm5vsuALiKbsj9T+wHXYB9mbhnjz+rXqUcxHhj3AHjm0seHffkZquxV2iUvoiBEfiiSkqFCWwxJkM8kWKh0P2Fmk01IZTmfFcKNfvRamVwIb12fD7qloSgFLsQvxOF6XVszySDGfRSI49QOVgM7sGnGvOldu0K3hhwr2L73tOcdlSWe28z9IGm+f+UoQVUjoU4Med+G5ihNlyVGCBYFiXAAAduCgDoI2iXeSRY18hqiK/eqSq6gAyU9LsuEn2T5AS7jVfKVJwoBGnBHeNBDkW7vY5NEt/z5j4H9G2l/dSqRndR7dVDmJW1eiMcKEayMwLruig5VB78uAGFP83G31G8trYLa/RxzIPCjbEOenQM1qbhWrlgacGOnq3jMSgi3IBYMbUaKXL7Ym83rRDF4SlNrece1oZsCGdJ53s0NdPSJI8rKrwMqVeldQcqpHvxvgzGu0KaCqRQuXjSSnZoSi8PAJBro3BoSm/AVqr4gIRscGXxnBG5HqDAwnfnx08FGfzQHKbI7tf4iri602LJzvp4jknUBapWAV3lzOflrbfoosXEpvdFyIaVyZXsDWG77C0cBhQhN3uSNzp6lCFwOK3S/wm84fpNni/CkkSNVE4t6kk7WuI48qEh7LKhxHO6L8rTXQx/7yheMwDbSGpm2h3VhsGwchGiA/OXZIO1flWSg==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(4143699003)(261028144727099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AQ1MSEDc+fFWUkZ8WC3523Dwlh7Hr/NL2YRuCIAV+mAr8XNisHi0or74WJi7/bRRwxptbCGQTUYsmbcUhD3xG7OZB15mKsR6MAbNI95G2BMvU0XWUQkXqzEom7m8eWCBxyY/SFcf7YelVI2l/bQgpkz5GXW7fdx7+xEd7oT1oCIYDNrWcJCHT33b/4peDRqB3XQylYHgic9hNYbh6yfizs5yL5/clyCP6pGTSt609Xbkl+JCbBQvbctVU+ggD/4GT8WLuz3AFMDOw1mUHyMJAdPHldxFPfaG27XmgjuCf4j2X+KYRAOLxWgMAa/v7NmEzHBVqRL1BOfXXMGKu9OFV52BShwoGT9tZZaEw0USHbthOKQJdaFMU6UJRvUFLEQ7af9SXBpoZ2ldV/VcKEKU3D5YGoFkkpHXuvT8W1vaJ/d0Xz22VNSsnMte53EEgIez
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:48.5281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44fc31aa-eaf4-466f-4c6d-08df3f4576a6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8315
Subject: Re: [Buildroot] [PATCH v2 6/6] configs/sipeed_lichee_rv*: add
 hashes for Linux/opensbi/u-boot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 16:22:58 +0100, Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
> And enable BR2_DOWNLOAD_FORCE_CHECK_HASHES.
> 
> The hashes are shared by both defconfigs, as the overlay.

Reviewed-by: Kanak Shilledar <kanak.shilledar@axis.com>
Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>

-- 
Kanak Shilledar <kanak.shilledar@axis.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
