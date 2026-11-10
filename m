Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078D606A321
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eJyFoOlH;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=Qlbi/xsG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33ACF81345;
	Tue, 10 Nov 2026 16:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lBmaGOp4CN2u; Tue, 10 Nov 2026 16:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 29E0781376
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327183;
	b=i/EXtnVInUVWaFUrwq1a9xSyzweyIwyNUrFcFKppHwNdWp2nKo/Ya/cAhBnLitUhNZG7
	 pGcknSHZC5G24pj2MW9rY5FHSfqgybCzAlIFC4oIWxI/Q5si4QM6zfdoROXThftkZ9W7O
	 QCDhH9BPDxVsGLJOUEiXzDpfKGhvLpXgGC4JO1fcxELQg8oIstvb77omm/QZhdxNw/5HP
	 D1YjfkOFGK5/fqpQBe18Av4RMAH0wKvdxswkaPQxYdJjqHGVaJfbYk6/mfNLiEdLwhROA
	 2jzZhKEWs44gbfZ/I+ZI5uXC6GkgJQbfPAosf3/ZvjGk0QahF8MqaulYNGt0iuDq4og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:
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
	bh=KBRj9evPCt0tHdBrLzSJwwT8qP3sdDdufex4qV8H014=;
	b=gwTTQX8sJErDmTXcoqhkpXTfN6w/Cd0pgoSfQrp6WzQFoSFAI89m3GJVsJRCL+gIFWZ7
	 hPRtQNTSIqg+OvLX63904YUyvFRNr2N+XuCGjD1vmsekc1G6oXi1Gn6fma25p+VvuoWKJ
	 UqIaFHB/v+1KsRXrTA7+ZIS71BHZsF5f3OUJEuEHj/z8iv29FloYPH25t7xD4Vl/uzaRu
	 xIfm2tz9ZJuHEiK7Insd+lPvhO3lbCXR0/PS6VVT3+p8zZ/K0c/iOVLqVpoXmKPngz8SS
	 GIo4eF2cPhvR2sjDVR9Z2Tat/NVvzlhgvvH+ys/b7j6gUC3E2RCdmZVIBLN1fTSirRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327183;
	bh=KBRj9evPCt0tHdBrLzSJwwT8qP3sdDdufex4qV8H014=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eJyFoOlHeeUnIQrVMOPnmBwcb9Ukr+YvsLjHlKUjWWHVR+116Txg52xp/m83Dv9Fg
	 7nFNF8q1+tPui02Jk8ddkOxXQSRMMu34NiS3oHsWEkm92buSuSljyw1s8LwZry562H
	 i8RTfg+kSZOgFmv/Cd9WY+PqnPaMQ/tLbytJLrVew649YO1By45BeEaBYjVEn8/8fD
	 ge9ZWk3GslFv074mKKCO1ISHUOTiukvy+Hyr4yMswEdg16SWltL7FvWekwfQdmrHLq
	 zYzho3d372IAVamSToWQhy30t1Zl3X1IHiOxV47uIs3bWBmig++l1aMJBYjVUjWgfY
	 MRObC58JFdRtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E0781376;
	Tue, 10 Nov 2026 16:13:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65662CC4
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5555260778
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w3fsXpZ3z8kE for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 814916080C
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c201::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c201::1;
 helo=am0pr83cu005.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=Qlbi/xsG
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c201::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 814916080C
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gj9o2J2rgpXMpGmRprcsKtpMrY/n0MzZ3riisQ2mxUc=;
 b=Qlbi/xsGKZXfGnCYBZQrH9ILHMVrTqCm00iOVp1f/MqrqJ+Ut4g9YlxVvY17h/Ygc3zZnTerDs63KauP3V+kJKCTgv0YZA91NNkJ2+Ln/ax3BW1C0sSkwdHZ05v7BSaKXiSbBvy1LltNlKjgrZJoJZ1x8bbGP4hbyeuAOMiqApI=
Received: from DU2PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:3b::16)
 by GV1PR02MB10744.eurprd02.prod.outlook.com (2603:10a6:150:16d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 16:12:47 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::a6) by DU2PR04CA0011.outlook.office365.com
 (2603:10a6:10:3b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 16:12:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:46 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5596B21C1;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3EF52305D282; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-3-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
 <20261102152258.1948796-3-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715367.3490013.2290653465627602680.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=139;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=N/moU5XHvG2ZDJ5zKfoNIKw7fGxro4F/2y0bb9vrgIk=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FQre3cS+7X9vz2YupnSL86NqGy51H/g5c344Etuy
 0zYWRKnd5SyMIhxMciKKbKcM9oevT/5n+4caadLMHNYmUCGMHBxCsBE2PMZGd4uO7to+12GmYG3
 3zw9O3nl/LXGHNyZxp+NNjOG8ab2s09l+F/lk337Dt+mf38e2R75d/rbPa2aiyaTD8mfbd2vu3Z
 i9hNeAA==
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|GV1PR02MB10744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0900a9dd-cb16-4ec7-964f-08df3f457594
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|10067099003|4143699003|11063799006|261102123227099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info: HejEmL7kzavyhxcfTs9c45q7S+QVvLuN5a/Yo7cBtx17pgzeuHgbwbhLmsNaAwHTALKcKMHe429SC1Dwt//Qy0v6oAoIbhUgQHjW0RA2V1XLuGFom8lCi7QxX/FSGOfIpkMxEhvJsf919TiNJH4bNhfS51B/LSX6DBO8HtUX0WSuqD1hLRkgwcO8Vtlehk1wN8bHO4YF5ch0WxHvdubCr8MsHlnqhWYFOFSOMLE72ACjAYPyJRe6NoXymswBiPqbFwxKpYzNlWb3HzXQZ3OtiXZuyBwCYWrmp50gfYguOA+yiooYGdo/1llkiHDze/ac1meh23upqzBOzpd0qSgSZWSSljLQIfx9w2Tj8037yaIUrMtSzdFBjJFuL7xfw8MlBwsADxfJsZ869fiQhJaxqoSHlGSRk9LGPptUqjAtoFckOpA4LVyFmGtEK/AVcxj3gn+rEgOFDW3ln6M177OMaaMMkUCELhEdzX5Cuviqe1/BIIUoy82UG0hZcqI164El+VFKi6/sfptXoSpsgb8TsXFbBDvear15qmXCAvdj6lCojoWSUOm/mF92wRAfwT+qcjbDO92wqHynaA4kXFA0Ogem93MibGISD+YsJmO7ukbY0Js7eOVCTa/+tflewDSYfk9pmKwiwaAIRAFdzbVMkAuU39hn+jmALn2F04V3AKm6NOLF5CcsJu9UlqSVQJe+kOeyugxLa8IHmf1BED/YiQ==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(261102123227099003)(56012099006)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Vfi18ZrnATWO2vgHsqbiwfNss4FUbVptfbSIbJOhtfLxxpmD83flGI6rE4fbCLYyqWST/PKO3of3QaiUKdeEzNSPGjTWSDanl8PMJv8tbIjiKMtPZUHlEOBKD7B59S8WSssYF2QQV4c4lNfPVDrHVxt180Cv1AzH4grDRM7pRAg06Jm4VUZsUjeC8dOl/hB6k2MhU/JMFo4wQ5K4jDI38jfmP9osPllPPMWKNNu/+D41mlO7eqtmGzfTRA8Wi9tBEBXDXiSM0QRGttoZh2O5cVF/HRIxLvxZtknTZCCjKBWl6OKE0I2EJGlOi6eX0ZEt/UJvvRjiqYau4m/QUIIjPuWBfSLd3gA2/EjsoSc49p8S/WBGnJAAAAfzywclByOj1+O3JrIDX0OKlU8DoFOON5IiQ3qNwgAIx56hnG1vX/qysOKpOI5MfeMMlnXDxcDa
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:46.7357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0900a9dd-cb16-4ec7-964f-08df3f457594
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10744
Subject: Re: [Buildroot] [PATCH v2 3/6] configs/sipeed_lichee_rv*: use
 OpenSBI 1.8.1
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

It is always a good idea to provide body to the commit message.

Thanks and Regards,

-- 
Kanak Shilledar <kanak.shilledar@axis.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
