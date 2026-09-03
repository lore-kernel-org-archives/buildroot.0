Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617DC624A4
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 13:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF9F540B01;
	Thu,  3 Sep 2026 13:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8o289blVXVV; Thu,  3 Sep 2026 13:38:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 62AE040AF5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788442689;
	b=swYUouA12+sKnHxfr6U5C8edJqe317bf3GMQYmmNWf8xvbVJXcC9mydIgNPS/2GosSYk
	 ZCxYxHMF+jhPrkxrHD5OGwIaZNlyPZ2uByqI90Fi9rzPKLKt93hblq6ROCDKOBdXnnEJI
	 91t0KKbOk17UhP0VQiKowTdhOxt/sM06a4DmZulHzTu45SxcXBBcHqzVSmZvJOboDb8JE
	 gLewy2GjW9nrTYN62mUFyew9TfedFC/wuuuQnmHr/3qZPi4v/1K0KQ40MdODpK/91yjJf
	 zhMJG0cUxkmcmRLEpiQ3S2bhluyKZ8J0NbzUdX707yU8wil+KjhiSu52wBxIAzDBm4A==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788442689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Authentication-Results-Original:
	 Received:Received:Message-ID:Date:User-Agent:Content-Language:To:CC:
	 From:X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
	 X-CodeTwoProcessed:X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=LEYxTTtKrZAPPr5SYj+UsI5mS3lgOm/TIbtZNkoHEDE=;
	b=EinYfcpT6rE8fIbpYNQJy2xov7MOM44FVppbuzxzf5dOlJFM/REwiE+QlPjBwy//hMhD
	 V6WhqBO8OB6SXFnRksMpyEBYGvuD59aGgxMBUcT5GFb2WK2IBM4fcxzpbCD7hu+taoUMs
	 KWePDtZ3w47OjyUCHKU1LRQg2uNDoERmR/WCYA9O7ixRQ+5nohXkhVJGb2af/r4NvVRVk
	 HPc1Qv4dDeP3qYJUmf4ulbqFNbdYxNGVNhymttu3pQtkbi9epGXiyKbJH4hF5QldwA4Um
	 Y+uU2bpFP5MgZ1rW2Y+lLsNz1G/U968w5MSajP+bzQeiM3YNmzCHsiCEfuJG+acGk0Q==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788442689;
	bh=LEYxTTtKrZAPPr5SYj+UsI5mS3lgOm/TIbtZNkoHEDE=;
	h=Date:To:CC:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nZaum4SL6sMVfBSIKXp41gSDnDxv+Lv0cT1d5uNaozqMGZlBZdWECPV/I6Ture/PH
	 FAMKiOMrq2qtgeEVBFgNXPW/LUQQl3hLjneElfRrCtLYdl8zmoB0r1Y65k+KY1aJ8l
	 lMo9hmqjWESKMkS6Q66czccKqtMaTf1aYDmG7EH01KWo+fJ01LDx216BVwKxq0wZjT
	 sz6EqweScKkbf1kDjzsCpyS2TwNgmdUFsJ9gEIAXb4KwkTS9Uvbw1ItN5bj0Y7sE4g
	 7tjsknSQH80uqU95TRh81IJFCZSRPbse0VFdxm5HenVvPhoto1AFFvCIsxQ9+IBxtL
	 o7FTqoIlmj1Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62AE040AF5;
	Thu,  3 Sep 2026 13:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CD5F722F
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 13:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC0880F79
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 13:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PNZTTbXdaz-r for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 13:38:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3E74F80F77
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:c207::3"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788442687;
 b=KB/2ipvXHWV6nRmWFuzax81HG2HDWzyqU4wOlzGzFP5Z+P3o7waRCLMdDXGB8QLSP+Hb
 6TFoGKp9LUHdDtjvCF+LSlTepSHE3lQGBSMj8Gd7tPHCula90ejKvXv3nAjWdXhWC7GV5
 Z8UtiZp2fllZidDDX/TtfE6yhqFlJXIbT23dm02gLrKIpgQvMtZbbKDCD30z7JN+sZP8g
 bdcWtDihsL7IzEIiGC+qcbMLAGxzx95SCobk9r/+MCzb2m9oIiSbNnuntboJzucC5c2cX
 mAw2n42+KLXoUK/hV1xAAAWg1jKPkdeZlaqUM6M1j3/0QUE6galShVdyL+UTTQaQnpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788442687;
 h=Received-SPF:DKIM-Signature:Received:Received:
 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
 Authentication-Results-Original:Received:Received:Message-ID:Date:
 User-Agent:Content-Language:To:CC:From:Subject:Content-Type:
 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
 X-Microsoft-Antispam-Untrusted:
 X-Microsoft-Antispam-Message-Info-Original:
 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-CodeTwo-MessageID:
 X-CodeTwoProcessed:X-EOPAttributedMessage:
 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-Id:
 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=ZcHnnUEygqiK1gSdN9IPK4MIlGUjpB2N9qD4EQ4ESgo=;
 b=X0eK8dAgMwpYcpbEKRju5fxx8VNoHm4NU98JDT+Ja2io8s7qnwdpCMmpoG41NO0dbDUg
 97wkmq8IxQ6hChyj7j3dBnHcKnVMIesl+XwHYPAG2de1sBgi/B+95dkNCYct1qYrAlYvw
 iESTHZhixkfCTYtanBF3a/noJss3d4gpJI9Z29SydQzzCfZ52ZJ+UIgx4KLhatBL4epsy
 m9XzotmNr2lnlR52SxyEzdhpVSKm+bGxnEdCJhA2Z5T+IVDR/167JPyDy5enJ5NmtP2rx
 PduGTBjYssJHgTZGpKAyjHpFUJdOxh1FTtirm5mkye9FY9akElx1a64BwBerwiiUtmg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=ginzinger.com; 
 dkim=pass header.d=ginzinger.com header.i=@ginzinger.com header.a=rsa-sha256
 header.s=selector1 header.b="1PIt/3pt"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a01:111:f403:c207::3"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c207::3;
 helo=mrwpr03cu001.outbound.protection.outlook.com;
 envelope-from=andreas.vida@ginzinger.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=ginzinger.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=ginzinger.com header.i=@ginzinger.com
 header.a=rsa-sha256 header.s=selector1 header.b=1PIt/3pt
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c207::3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E74F80F77
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 13:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTeqG1+RPKn8QkENbgp1Bb8muBQnLiYsizyKpno6kLtQw+uB88+vwLtl1z50PiTkrMsEkmc06ptGXz2ItB8hJH29ntrbp79mK99aqqrEAdOGNN43tQwz3SYQ41q82CTvENqtD/4vRPnHfoqrEudY7ZqjPXYjxlgTdgrxz5FZTnKvPlouL9qaNRlO66xyYSr6sgS767gWqKiFZQ7ZEu2BaS0+2meVHZYTRzLmCK/xWfg940WN6Y4GM78ovT7IDarvdosaYbWm+h8ty2Jcdj1adS9Pw6Sbg/KBKT8X6BcyASQBDNmYT+QYfoZGGZt2NM1e+HPkMMRYx1vvbry4QwtD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcHnnUEygqiK1gSdN9IPK4MIlGUjpB2N9qD4EQ4ESgo=;
 b=cnByHe8iIt8FPZ50Ru+tzQy973e2JicOfTI2gyQY3hAGv5BdrxLTWuSMggLk5pKMnJJtC3Is9TKIurLoGQ+jdT4BgY2ChsMVynxy2uUyS6MwF+E+23l6d8wYetEoWxcxAHMxY6tbisgLgQbvuCGH3k9Xvs5LDJojfEp1MX9eJF/v13klcUHhHWp+2ZGotZjPeVKtknJqJbWdLlf/UQkvfxkaVNf66Ar63rtiksZcrmY8xp81CR/XZbAnO43rXshlLvajJDA6dqMPYchlwefF3KaBPXz1eXkYxyjGq3nUK/hQTqdgfhO2SQYljs5alvBo5cPKQzMo1Z/h9IJ+kieh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=buildroot.org smtp.mailfrom=ginzinger.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ginzinger.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginzinger.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcHnnUEygqiK1gSdN9IPK4MIlGUjpB2N9qD4EQ4ESgo=;
 b=1PIt/3ptr1G3PY5wTJrOoqagZNAiWrZVa4rZw+le7xo28pUIRap2P4gRCF06ytBkM6P9lAyxEd45a0v9RvsFHVprh1SjPSxGPz/HI8WC+Gv9oElAhafFcC2SJsVcaV4AGkSi4erbqqUlKgNIUtnCDBzGIUVabccTADyHpwtvNQrecZxdUq0NNH4ZUMVgBFTmhhBSbK/qTIBxGvQd15B08xWNceeryJ++61graU6sy/jxgcbKP30TYfKXj/vqLO9sVt3ZhRS5KvJQwzjRhG5vKcslJcXTy+gMAHJoIecjXpjwdVPjoGbksfXYX1rv+oSgbA0INfIuw4bgOR8aiVWA+w==
Received: from DU7P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::24)
 by PAWPR06MB8786.eurprd06.prod.outlook.com (2603:10a6:102:387::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 13:37:59 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::d) by DU7P190CA0017.outlook.office365.com
 (2603:10a6:10:550::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 13:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 13:37:58 +0000
Received: from AS8PR07CU003.outbound.protection.outlook.com (40.93.65.48) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 03 Sep 2026 13:37:57 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from GV2PR06MB10206.eurprd06.prod.outlook.com
 (2603:10a6:150:2d4::14) by AS8PR06MB7894.eurprd06.prod.outlook.com
 (2603:10a6:20b:3c4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 13:37:56 +0000
Received: from GV2PR06MB10206.eurprd06.prod.outlook.com
 ([fe80::c3c5:3dcf:45ab:bd74]) by GV2PR06MB10206.eurprd06.prod.outlook.com
 ([fe80::c3c5:3dcf:45ab:bd74%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 13:37:55 +0000
Message-ID: <219210df-977f-44b1-9db3-55c783935a95@ginzinger.com>
Date: Thu, 3 Sep 2026 15:37:54 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
CC: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
From: Andreas Vida <andreas.vida@ginzinger.com>
X-ClientProxiedBy: VIVP296CA0020.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::15) To GV2PR06MB10206.eurprd06.prod.outlook.com
 (2603:10a6:150:2d4::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV2PR06MB10206:EE_|AS8PR06MB7894:EE_|DU2PEPF00028D0B:EE_|PAWPR06MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe33598-52c0-42fa-6ff9-08df09c09169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original: qcd5NjkDgmMKjxbXi29ipGANvZHQzSdp899UVnCTC+gRdHYGQgaaAvFi8vvOas8tvRlNUP827xuTXriqz1j/5XxsrT2ihJF3SNIgnp4dG3QAETx8nSmjcrJRfArMYm9Vlq8niO5sDVqhDeo8CXojf00R22LNBQs/dSwy7tRhtj1OvTLo04Cem7MMxtKXwvhRw4iQtBJ9wXac3MwtFsN1Vt0bs57r8y45gnoT9W2S++65YjersGXO/mADFMa/8zJlZkDL4i5fXugyx8/qzoWKwauUjMEn28Cr+U3zaUupY069AWU50TFSRHOSxqS8HGy4/Z3TaKO0GasqxrkjA4TPcWiNRtNS5cMz7u75plwPGelxrf2kMSYjTbeJQCgUM5Yiada+V1mz/4hACafXEyIAgKQ//hj/SsnKIMFcTR5qj+5YeEaIh78ImYGlFsHEZxceI1UIhfSof2ocrkGFp8cxPM1fNCTdzuElzs4hjXTgYYhEsnTRcdSkdnPF2ie5t41Cf1NSH5SDv+YE05QZw+Q0UlaeIYp99rCe3A/rN6V5xZUmkHgCJlaRiPVJi8mkf7KLfbKI7fv7dUsyiWlUNM0FXA07XXSQ9H4r6Lpo3wTskbgsoy0GmHXVouRGoPQ6SBnIj6gZ7nZ0xAcK63Zdcg+LAnmXvbU4gEZQfMd6zQRHGAw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GV2PR06MB10206.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1102; 
X-Exchange-RoutingPolicyChecked: IgWQUuNi0yfGA+O6YUI/i8y9gN7cD71RUlNnXkR7XZ74b/DCNOzc1SExfG4HryNJ/sKnCIVCYtENWy/AdxAnPWS3t/z8FbEf07pOKy1NUEgeKR0k7CJ0UKuRNGpk8HSggHia6C+kwlihegKzrJ3KNZmu7ofMVWtAgSlaCtJW8UnhkW+diK8SSnvMSBKupmGi7fFHi+KdyYCWY6CXUa+friFsaQ1SiDlOOart/TqIoDsRibAaaiaU0Gl0uZ84R9M+OuEGEwCyN9RZ+OmNJuEu8GdIH0NCweF6AL1WBdQbzGc+5NJf8LUVvvw1SQw9bTYLAYFn2tc/xjIifP2LfZOSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7894
X-CodeTwo-MessageID: 5b0553ea-e5f5-4eda-8411-ec92b78b1aa8.20260903133757@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7339f9fe-80f7-465b-ff62-08df09c08f4c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|23010399003|14060799003|82310400026|35042699022|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: KvVR9wLteA1vCkm3PHQmicwywidAHYEI68vKtSJgTcccJe5b9plCQ9GQF+ufMRUrCtW2RWlvVvP9bgZkEYtMBpAMZNUNfs1rJoKUSB8VlqhsLyAp+qrCgntnJRDbQEtGMHQ4XV/3EweZtP/ZjaI8uCV5iodJvNiCv0bVdST6DF51HpyD8Kyx3Zuj8TkZS9fyrTJsLmSoNM0G9xFHJc4BXz7QHJ2f0OoCrob25sBELPoXPwqeyVgNYMcbeA2CXt23toXH772uTAw6Op1QvsMr92BnfnZCmlf/ODkv01OMGVEOSfvH9TP+1ZjD8TLynCyr7gnfF6+co1WkCljRXKNJTr68bP8f3+gVfXXZ29Sm+FTrKgW0M5vcnX9Rb+tWSON8dM+gf4kxR7ktpbp4Ec9h/OKKsTcUXNneMCbG1CnB05XT7ZGYnIiP3YjSuT7/yNL25ocM7xmrkNF78pdRPQZL93E+y+q4ldizEe5GVu7WCbXcva0BNx76C62ncib4NXS2+W/xcIqywO03jdS7SobrUef49Uwr66aCNRtEMC9b+fvpfsfdEoMThWx8YrmVpE96OJj8hu0ZOCwry1awubEiONfqhej/ZY/Ohu7BB7A1ZIbUSeXhcmIlKuBpHROzY51mjbMO+1mgR7Y1OPcDKhsl/yGbbK9NtLZJiTEaOK78ga0VrIhOgj87GyRDRo7Kcmg3
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(14060799003)(82310400026)(35042699022)(10067099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Syke55N4QtHjA/wLBv875SIxuEJouJfHG3dr+BDvPdXyoUP6vJNLvuG+A6kJDIFK+JN4Y339D2STkyCQXHA/iSSi9+h++vkasHN+n1aOAf41jArHxZzGircQal5OkM9tBMS+1sZWhWbPvBfaLRevNilxwhe87j6axeVU9bT09O5ub1amRH2alVHBBOWtedfV4IrWBzKZiEVKPUPENPz1ylU+JLNEovqaWBGccKG1IAoABrwHroFPudeAFXkhGJc6CAeO8Y11mp3tiQiWNwQdZKhD3TVOLImL7o8uAdF2agoL6KB/fw1xGN77dB50KNQKoIhzPUqXkq66Ckj4hNBL7kItxaFZmOPYCXeab7bWqCk9+4jirbQV9pKJtBLI3yodVUb38pnwF/7dLx6247/fshw+zvtVI5Uz0ZUGsgfNZV2y5el0I9S02G1QG2uW7Hrm
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:37:58.7208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe33598-52c0-42fa-6ff9-08df09c09169
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8786
Subject: [Buildroot] [PATCH] package/cups: install D-Bus config file
 cups.conf
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When CUPS is built with D-Bus enabled,
install cups.conf under /usr/share/dbus-1/system.d
as it already happens in other packages that have D-Bus configs
e.g. dnsmasq, wpa_supplicant etc.

Signed-off-by: Andreas Vida <andreas.vida@ginzinger.com>
---
  package/cups/cups.mk | 5 +++++
  1 file changed, 5 insertions(+)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 0df4f411bb..096a1be21d 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -45,6 +45,11 @@ endif
  ifeq ($(BR2_PACKAGE_DBUS),y)
  CUPS_CONF_OPTS += --enable-dbus
  CUPS_DEPENDENCIES += dbus
+define CUPS_INSTALL_DBUS
+	$(INSTALL) -m 0644 -D $(@D)/desktop/cups.conf \
+	$(TARGET_DIR)/usr/share/dbus-1/system.d/cups.conf
+endef
+CUPS_POST_INSTALL_TARGET_HOOKS += CUPS_INSTALL_DBUS
  else
  CUPS_CONF_OPTS += --disable-dbus
  endif
-- 
2.47.3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
