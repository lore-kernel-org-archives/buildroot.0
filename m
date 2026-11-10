Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA5606A33B
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JTyx5KGW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256 header.s=selector1 header.b=inDYGFL6
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94909810FE;
	Tue, 10 Nov 2026 16:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6eE9VZsismi; Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 86A2481106
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794327175;
	b=WZjuj+TBlp4LMpV0j/LG7ap+HpCIjC+523mzzCx7sJaDtx149iR30tnTnncZzz301SBL
	 Fc0+eaWO5UEX5EVppEJOKg07inMTcGNvWjw6BQeLfc17Ldd/yZyUJoFb86MioDPij2dy0
	 5un6evFLDZ5hkpByai/hmmmQTk60qeb2sQcKFZogUnDIPGhLTxX5uZv4fSiougx0W/1dJ
	 7/c+ChqYpC8uoIuiE62kB5iXqIJTev9BSQv/cU5/vrjTceXhqU5Q5mPg101vbTQE8vj7E
	 brBopvvk0WN9xnzPkx4I0dHTMSbGd3aGTPS/ZRthjHLrNCFkzjV24gZcmdebDRxmHfA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794327175;
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
	bh=rpedbqRwOYFvBrr4opAL7akx07VkB7RBVPOH7ttWN60=;
	b=U9VFP3oYPCqnZ2ioYhb37e6ke064kqZYF57p7JEyxR7W8u5g8e1Sa3kUEURrDudVJfE5
	 18pghx4OMq1F4GF1WkMfnbWPp/mahbDsUHHJHbBFL4BS6Wmnq+pcucBsDbRPCqseGOFbd
	 hQqR9k4RYwWhZWFvECE7fQLCLHcqyU3Hjax6zpbApsrlkehvIYqmo4BCdAMKgEiYP6v8Z
	 q3E5hGfVRVsxwQq+SQEmtwaQ8VKAYpr8nJ875SKD2H//8NBlMsJZI/0gF7GC6Ft8fld5b
	 uaj+weZkYkXBHYkirmYjOWTUaSvBlUSRHS4CAmWgusgu2EvJAvAY0OrJiG9NiNUMKoQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794327175;
	bh=rpedbqRwOYFvBrr4opAL7akx07VkB7RBVPOH7ttWN60=;
	h=From:To:CC:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTyx5KGW/HDpSC5vh2nS4UA4QmeJ3B9nyf86JEdclSKcVcn4He62SD6EGoRNGj6r/
	 ls76GkCOG4RY++nwidQv1aQME1ALyuouy3cUBVdG15gRW7lmUK7NdVqHzkUJvg09/c
	 4qz6TDcn90kq4txQqFFV0ujtAP4whix6EjMj4Xg1pNkZb/qvUTgjg8xgU8H1J69eBy
	 FJOKSP9ZU5rmEwbAhrf6HJhCxmpn97BTlCgMQq8pQW4qV1TfUba0LlFqFKgJqicJGa
	 1Q0N9HmLHenRLNjhqbiPcwNreBwfK1dVXLywc9nArABQntbjhJe+ThzT6ldX5jkauc
	 70dHznwLrKhDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A2481106;
	Tue, 10 Nov 2026 16:12:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7990A731
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B49401B9
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ymtz0GDPKZo for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:12:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5063240188
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c200::5"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::5;
 helo=duzpr83cu001.outbound.protection.outlook.com;
 envelope-from=kanak.shilledar@axis.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=selector1 header.b=inDYGFL6
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5063240188
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkKoTZ+uxXMzfzSoCCXPOMXSegtiLMKsq4K3i+J+W4g=;
 b=inDYGFL6p8tPcIX6uu1RpZmcaHQtgIkY4YBPa8tbmz2zCQ8Oy/rl5ThpCtptQdb/VU0al0sqra/phG1UT0zxmOtI2wbEVYjCzGtz7ZD6uvh2G4TJ2lRI5bRhOoh+5SBvy/IepVIEFWJ+UW/hLk04vhoGyWOxVTwEPFfNuejy6fQ=
Received: from DU2PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:3b::29)
 by DU4PR02MB12028.eurprd02.prod.outlook.com (2603:10a6:10:62b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 16:12:48 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::12) by DU2PR04CA0024.outlook.office365.com
 (2603:10a6:10:3b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 16:12:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 16:12:47 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-mail11w.axis.com (10.20.40.11) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 10 Nov
 2026 17:12:46 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 10 Nov 2026 17:12:46 +0100
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com
 [10.133.4.42])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 5F6F021ED;
 Tue, 10 Nov 2026 17:12:46 +0100 (CET)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
 id 3F34B305D284; Tue, 10 Nov 2026 17:12:46 +0100 (CET)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Kanak Shilledar <kanak.shilledar@axis.com>
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
CC: <buildroot@buildroot.org>
In-Reply-To: <20261102152258.1948796-5-angelo.compagnucci@gmail.com>
References: <20261102152258.1948796-1-angelo.compagnucci@gmail.com>
 <20261102152258.1948796-5-angelo.compagnucci@gmail.com>
Date: Tue, 10 Nov 2026 17:12:33 +0100
Message-ID: <179432715368.3490013.6945803769517202417.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=512;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=2a5JQ6Wo7JT0CpQznNS73/WCg8CgYO1VocvTW9pR8Ps=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsj67FT7fPvM1XoF2b9f/OoR3G88wfzK6Uren/xLV6owB
 ffUOlqu7ihlYRDjYpAVU2Q5Z7Q9en/yP9050k6XYOawMoEMYeDiFICJ3HzByHAta7E9z/KZDwPv
 S5xX2F7IuS3cc96Gh+0rLt5vMw8UyGVm+O9wcQKjwUmetbY1FcX6zcc1YuVURWxmeGs6HbzcwGd
 jwwcA
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DU4PR02MB12028:EE_
X-MS-Office365-Filtering-Correlation-Id: 49379799-b12d-4279-b0b1-08df3f45764f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|4143699003|11063799006|261022075727099003|261021121427099003|261022105027099003|261026140227099003|261028144727099003|261026121527099003|56012099006|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: B7rxNU6CU9ID6LN5QBW40BXdKgy1CHBLBaZi7H1TqQuaSKU7DZSrXUVqbBq1LpR5bzAPVuIsJJCVT0iYnQ6IHRQZh87l+C16qG8X1qFO61b9J/DAmDv3/QwARLp2wW1k0saxRMCzyG5i1aLfoKzxPWjtp765THB4SxJ+auIIQyxAONwPoke8mYtqtpGYdlkXWPOFgKWFeiV6a24l4cbVF5+I642EDnrWfmR9Jd8zIEoonJ6APz/oUpyymY70LOocpDOx9ZBUkdfbpzNphoxqyFWEC14OrMGXFJsFLNXJNqr7pp6+aEdDdBeB1Vio8flIlQ5Yo7Cu9yaGHpujXyF2hHjOvfL14R72CBCMB0eaJ4VYItbWkt1VeSyHn7N15Z3iqpbFPuKz7/gpQQLL2jE8Ihrudg4nU4Jk2yodHLpC5sOzHHoUYUYXllvgFhhOz9qL22ZFJvZ+ZDx+qTNJkzoUsKE7sPLdH1lhUoBCV71kw1jrDTpFF7DERIAeCfRakX3SAqcmkTRc77lzw75xc/aZhPiV5PE+R9agxT+O1iOgXWH6kArr7Jo9d3Ia3IJdoF+UZr+VUwV0BwSNbG0f3eK31M0tDE0JMzizzn0/RIwhbYMIgs/EdcZlIWdwDioBI3j+O4T85mK3fgt5b5v7yEyHkDVuI4ZUeBdu/kfVRSkcj8Gj1fhMpdaWlA7vkGx+SJVedV/1/6bZHYibL5reImF44g==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(4143699003)(11063799006)(261022075727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261028144727099003)(261026121527099003)(56012099006)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3uLEqJTOgNDB87T7kb3vMglZz0TuKU6+4jHcX6Sv8nG+qO0/IDY11+Kq4lQp4yyHKCq2oWMnOFokI5DNsaN+gSbkcdpm7Us1LnZ0+37P1oZ75S6NEtIR8CO7w4gesw27wOGylsBlX6DxcF0VNySanmGJLanogDd9804mK/WrbcxjrkyDyagH4Uv1Aurz8GBnlHsj/BFOpoyaPSsK4XzYeDmXFRAKoGHDmyM1YQUa1swo+81Yps8ILQ7aTmsl098KolGH5afUY4E8JyMeux+kDRwgiYIdzSIhTAzuGOzjNHQTFrWiMFFsddZXTGtBwZYVF7AlfwOrV6MDUK+0ZLHh8JXIbdhYFZl2Ml4m6w9yzqUy6ocjx1Xuz+Ddr395qYOlUrSHCIiHwuTkEH/3EfT/OxyXW4jixspvmkFvWeQX7plbp8JxcLBhBruzy2xxollX
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:12:47.9642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49379799-b12d-4279-b0b1-08df3f45764f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB12028
Subject: Re: [Buildroot] [PATCH v2 5/6] configs/sipeed_lichee_rv*: use
 mainline Linux 6.18.60
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 02 Nov 2026 16:22:57 +0100, Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:
> The D1 support is now in mainline, so use that instead, as done in the
> nezha defconfig.
> 
> The linux configuration, shared by both boards, is based on the riscv
> defconfig, reduced to the smallest one supporting the boards.
> 
> 
> [...]

Reviewed-by: Kanak Shilledar <kanak.shilledar@axis.com>
Tested-by: Kanak Shilledar <kanak.shilledar@axis.com>

-- 
Kanak Shilledar <kanak.shilledar@axis.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
