Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D023606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o2JZs9XV
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46D3C8116C;
	Fri, 27 Nov 2026 15:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzpPtLQNObUS; Fri, 27 Nov 2026 15:31:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4568B81136
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795793499;
	b=FmC9zSNVwzGS4/vL74V3SY4jC59I/Q4bN1nf51FsXc374fbaVOArrjX73eooRifiaa4G
	 YufUZfqiON1gLkiyBAtw67T7pcBaybbuxGqrcwk1/FTv2gaofCsUNJ2T3n7mWiUdUYXKz
	 iUd+GADCVYiP/neczSA7Ceix4J149Lp7xFLsJPa6uNR6HNj9n0HIADbUm93pqHKGCktJm
	 uWB7NJw/VMf9PWrOOpQP3y4bwLLDYqFOvaqTRAUVpSigjHNicxCqGrlzsmTF4Dx24+njT
	 EMr4ZBqP3apxgq3LlAtLn/maisUypH4rm5Foiu48SwSYCNtaSqnCga9ECChPdkeKXiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793499;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5hWmEt0VDY7kkUY6R40Xrohh7cBxKv1FrDE7PJA50Cc=;
	b=U92NtkaMLYrRJHr3cgPUTkE46pDJG759qc6IDwoz0H05cSNMjWVlfYJPoxpukqfzlEYr
	 WXVWJ5FtvyvLuRRAI+4K3mR7sIsEHITNaCWUKkxy60mo8uQvYvXcUuhFXvIhYZwmbNewv
	 7jdvNNPZLPGpSjQmQst3YjSzSgoTsZVhiFc9qkKpjwxhx9IYRY5MydCJmKOIuCMf5s8Qi
	 0bNfB76FlZbZiyBo/ay9tWhEHtkTbXQdRpkKFQ1PLI4fzZRnNnpbG4SqgJ5tOSCyDZXr8
	 YdKIe4Ucy2MTElfJYNk2k5i/gTTVgBTL0fYUurIMDmOU9Blma2iMJX8jZdL7oVd8CjA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795793499;
	bh=5hWmEt0VDY7kkUY6R40Xrohh7cBxKv1FrDE7PJA50Cc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o2JZs9XVAJmWbSdn4rj3yBZatnkswgXCCVfDf1eaKEyK/9qxK1yiDXs+VGLoAdgIZ
	 5eV/s0SNSZk3JCGQDTSdVcuTWAw7anKuawEJ5Kc+Xv6cFp6/SyWnVNQnYzXGscRAb3
	 PElTdYqfX/rRyQMtgzKmk5bLiwDj7tZobVsdJDMUpyJp82kMqxTn9EXCFaoMXlPsFO
	 nIMSr3Ut6ACvHA13EHZw96Ibh/SjAPGQExhDDb/xSYY2D5tHUM6yTACuJEA6+lSTJ0
	 aVdArWIWErO1PudUmYlj3MHmUgKy1HovDecnojUfpimuX7JtV+iuPsTDiCMCn/v2Wl
	 UJnKNTFMHZVzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4568B81136;
	Fri, 27 Nov 2026 15:31:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 656BE2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63020400FC
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oePHKWHd1u4 for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:31:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6BD82400D2
X-Greylist: delayed 1174 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 27 Nov 2026 15:31:36 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.135.77;
 helo=mx0a-00128a01.pphosted.com; envelope-from=philip.molloy@analog.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BD82400D2
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:35 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARDxqx53739170; Fri, 27 Nov 2026 10:31:35 -0500
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j6a88gvqs-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2026 10:31:35 -0500 (EST)
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7) by PH7PR03MB7063.namprd03.prod.outlook.com
 (2603:10b6:510:2a4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 15:31:31 +0000
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906]) by PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:31:30 +0000
To: buildroot@buildroot.org
Cc: Massimo Pegorer <massimo.pegorer+oss@gmail.com>,
 Greg Malysa <malysagreg@gmail.com>, linux@analog.com,
 Philip Molloy <philip.molloy@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Date: Fri, 27 Nov 2026 16:31:11 +0100
Message-ID: <20261127151142.2983596-1-philip.molloy@analog.com>
X-Mailer: git-send-email 2.56.1
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB989121:EE_|PH7PR03MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: be3c320f-cdb9-47b9-3066-08df4c9b82d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|1800799024|376014|366016|18002099003|56012099006|11063799006|261009223027099003|261021121427099003|261021123027099003|261102123227099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 4Kss7wjN5No8QEzjmaKHuZVEBVwm9L6cHVBPLV7mEMqNyjQGrP4W5YhEiMnpQnhF5K+MtOE/3H2K9qwXh+THwTaabjQzJTHzkFJwBLFyo128GQd8K1DbjvugMFu1hhIvm1M6yzpatSzpBnv2efH9zUtOlGx75rMqfHALjzu3sQcM1HBZS8GUwUHkt53d2o3YLSVjlNvhVchSFdxYXbGQdlw8llSI+qRuPFnlgG3221NrsczdenSEerUNz9C2GcQekWP1LwLUoZrcOJ0MnSEYKcdp1upoz4SB+ndJVD1hren8FSbTuysYoXAwojAIFoJVP1m5n7U0/UcB6NZiWKFg5fOCbQdfri8MSstyVxetfxiiMZvTsFtAE986zVAqzg2PggE8kQA98MOj6Iztu7iVeO6TTZ4dST7DNwIBUeR/vIuY0xzo+S7BzysAxXyv7t5QALn1a6aSDi4SBgBJ85cIwwNMtEe9k2ZkuI80mDrfmwixhG3fiC2YYe6AG5hqTNtNcYjIRok/bcCOzeuSRKWk4SU3SVtb/1ylGqKpm5NRMxjxMswc5qxO+DbBPG5/hyE8cdL+RLxE+MJeRDenNf+nY4NBp91By13Mpk7DiJnwFpLCC/wEYSzE1SVEI6fXUhJeCyJVEdFQJQ19ljthJMnRGWRyfScW2RyLlMoetml0kWM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB989121.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(18002099003)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FiXNCyBwbVLEDrobvg+5N3wyQkTxgHJUJkqKXpxl9lr1yQRadNOTEuD91YTW?=
 =?us-ascii?Q?hA2WegGpkTpDwzh5nLJm+hrhzYtSYckXZyA48Jp+KIPlTNM32LFfQvjSFfo+?=
 =?us-ascii?Q?zfkUMAsNpqL414BaZ/lxUESiUQKSaEqUywcYN4OwNCPF2eaDIRadjogZQXCg?=
 =?us-ascii?Q?cJq9Bdl56mN7QyHZqh9zOS11c4DG4+C5Hk3u5UBhIVD0ECaMXFfBZ9IVWOQL?=
 =?us-ascii?Q?/beU04DxsURb0IwTqoDnxoR2FKfIGK9fmrHtqb2xhuDSs0NZMnICiDz3iWrM?=
 =?us-ascii?Q?4BvmyLakmzV4io+ucLKxuPMHXPiKpHGZ1YHx1PKS08cnDH/zI9Hw3WHQ630P?=
 =?us-ascii?Q?3orJa/eNzfJblIxkH0Lx90zn7sH/k4FFGQ6B/x52taJptM0La4ZOA2HLVgPd?=
 =?us-ascii?Q?fGGaFM95rlZcWZeHE48A+5QUcxToAO2LLKamMIkdoUjzoJONlEgDtW+yLq9C?=
 =?us-ascii?Q?MDW3vPy8yFmYBP31o3xvHkHWBV1QWAUHC7vn8hOaZqmVgcreDvLuoJ8HDBZB?=
 =?us-ascii?Q?eCSsubQYNjWhiAaIpDZqUMqefe5czauOpBsrAtTfgraOSwnQQFxk/nYeItNJ?=
 =?us-ascii?Q?pmjia7Wpxiam0RZSDqrviql3Q6+k3T3XU1+MW09+QlKZMpSANSZFzrPt3nD9?=
 =?us-ascii?Q?QstcLi0VUY6kS9Z2x7Mof0yvzmUJNWTlDm3orxxdLAwy8mxX1uN72df6T2Pd?=
 =?us-ascii?Q?Y0IenysREgTY2DjBWLRJ8jiuU4bqctlxWlNqCyleQ9Ps8+yXBvxsWXslxLr3?=
 =?us-ascii?Q?MzKkF4EH8oKisWbGTmMClNppNeQHFHdSJiQ6Wgq0x+2qCCTwUaTHvgFGnQ2/?=
 =?us-ascii?Q?nXvQhlYaRvEZofWacjssbZj1E0WTH1rwx1BpAilobD0BEeckIJpGqMx3iaTy?=
 =?us-ascii?Q?UgolAy8QYzy8ZqHd5aYdmmNAgDz1EBylFInaWLrZrGGafZJJSdTbpPGH3c2q?=
 =?us-ascii?Q?pQwJQPXP/ejx3EQPN07nilppuQgF9HtveJkbw/+CV3x8YJhe3PLw7JLbTeTL?=
 =?us-ascii?Q?2/KtdSnCzMppOoHi0BN1geIHsEzG8yQqae9RQiYZHC9n6YXQOwN20gffJaOe?=
 =?us-ascii?Q?2hg3QRdo9Dbho6pVbEO1f5gBnBP7ZjEkk+zw3GuMU+7Na5csal4LycILo7ry?=
 =?us-ascii?Q?Kbzyy4ag8wRo/nl1Zikj49elNukFwfBwGlM8l6bJ2WH2ql9SGovr0avD5+N1?=
 =?us-ascii?Q?sMNEUmc1V6UrKJ2pB+6IOafRRtLEid2gH/DGQ9oQw7bcOh5sj0vWxIzOecRz?=
 =?us-ascii?Q?pRWe6ggCyOti4vy5wvbs+JDgUYvjoCmlgJeDYL1bogLII85VQNNbtgLMjM/r?=
 =?us-ascii?Q?/zxStM6SgVsm/7h6311dxgRqJMaWGP1mNBydxU/pD1oh2Lzjqb3IyYjEKPhA?=
 =?us-ascii?Q?ULSiv+jpQte8mCpXkiOuoRr5CNS7Dvbd5HLL8WdNBNKR3megWUECe8B77eW0?=
 =?us-ascii?Q?xp5bKPjGriHV4j571/halLppcRlQrcwfyEQ6v4q3ja87BD6wq+FCnUk0ojg0?=
 =?us-ascii?Q?MnSiLyMU33ltuW/3mF21XIJACrGAyKCDt4287NIFypfzTXPDw4/aGLKVGpNK?=
 =?us-ascii?Q?JOFj1ZSDI3N3239sf+a0yGbETNRMP5kKWgN1+4dZon2QRrr1iW2OldIyls6v?=
 =?us-ascii?Q?mE3bb+1/It8TdKIYi9WbPiCCQlYbdcHTRPtf9ByoertlPOjdIRNUXO9ybMqe?=
 =?us-ascii?Q?OPPjYk9KdMIk6O313ryPGWU9d1KUd9Jgaxlt/xISaBq7BzbNZwK+MgnfFq2H?=
 =?us-ascii?Q?TbYuDPEL378c72wGYSBq0ZG9+a8WKOGdDyViRRupM/tM9HXQBzbf0eFkepgA?=
X-MS-Exchange-AntiSpam-MessageData-1: MuUiJk9+PtUlKH5ZY5cVFavwpQz7uBDR+rk=
X-Exchange-RoutingPolicyChecked: owZS57quEsdBHqV+XBS+raD0aD7UEgG7nyJKCGtcszxljcmWoeotyesmiWb6P3KCGgWIuzVFE/QPKzt/GGTnQIF8qLRwWaMxt3RdqluDBcssuqscfnYBbU6N+7pPRtEtmjv/T8kBHIBtoeXF47SNgnB17vdb5o+MhiiP/za+lstaiBRLJlEaMQivNc754MzpT69Y9zFLZ2rTRfsk5mnSPesZD0OQg7i0knwBzcAM9mR46Ik+q+jcCDycxztpDlcuqh1ekI/BUrMr6MFbLBK9AJ3lJ+TojGzz6Up5PlXHEDMxfu3ZNbn4gvIygiVURq5K0IBvSetjIYdNkn5lMaB5ag==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be3c320f-cdb9-47b9-3066-08df4c9b82d5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB989121.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:31:30.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCj2eu1KE06yyhMZIoinaivBwtvMrxsKzyIs0tQhvn538RsNAPK3fk7WYz8Q3cl0feIzt6DhrFVtKT53drA0GgI0rl8WLqEbYri8MypBjyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7063
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX3UZp6lolCut7
 PJJAC+00hSg53DhwLueihNSO8kyyk6L1+bsedE+KolNpWtlEBHULyiWIv1Fs0ds0G3evSCWUPw8
 Ierp4UqtNxJ/bblNJ/WzztgYVv1j/B9Seck0KKVltxVQt/vL4Lq9vDML39rlwPra+XJ7QAv7NVu
 FgZ762wd07eBCNfoiCDQtXJTAWHN+Bybfi/H3ymtoxAHU23bjbii5kVp6iRcxgOoLMGr3tiFBce
 P23d5Z84KkAWIrZg4iEtxPl1GJDxYR/p/M5Msn4KcO8YkhIkBasIiUeOQGa2XTtTdWHevbm4ZEB
 yyLv7rvN6VdOqLtCQtB6M6IhgByWksVATTyxuoNkqUol6TCBZX1jMiAPrqTDWlcKKAQGyPrI4nr
 9Wy1RkT7R90h25d42/wT+60Dxmnkz2H1OvD90AJ1+NlxVCkG3pG41XwzC+/pLSH4KIZweKrORs2
 4gHsoHK9xG15cptcjFw==
X-Authority-Analysis: v=2.4 cv=Dp/Da2/+ c=1 sm=1 tr=0 ts=6b09a257 cx=c_pps
 a=3rvMy2ukNI5EHG76q/Bj7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=4tbZXvb0AAAA:20
 a=gAnH3GRIAAAA:8 a=bAlT6VxFnv79FshydPwA:9 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: _H2nDFcxoxRg5VSee7aHfBnVMOJFIerd
X-Proofpoint-GUID: _H2nDFcxoxRg5VSee7aHfBnVMOJFIerd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX23spdnNQQRxE
 GJyUJPQBf0IzdVYfp/av5T9doGtgcZuxu33GSweGxS0iABL8mGkTNe/SUKe+GS5tumQe6+vBvu+
 viMK/XUQeiAO0XNTQDhJBD6lMHyus/fbqTszmoDXvHeqN0wVHS0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270061
Subject: [Buildroot] [PATCH 1/2] package/adsp-ldr: bump to version 1.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Philip Molloy via buildroot <buildroot@buildroot.org>
Reply-To: Philip Molloy <philip.molloy@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Notable changes since 1.0.1:
- Add SC846 as an alias of the SC589 load method
- Require meson >= 1.5.0

For release notes, see:
https://github.com/analogdevicesinc/adsp-ldr/releases/tag/v1.0.2
https://github.com/analogdevicesinc/adsp-ldr/releases/tag/v1.0.3

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 package/adsp-ldr/adsp-ldr.hash | 2 +-
 package/adsp-ldr/adsp-ldr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/adsp-ldr/adsp-ldr.hash b/package/adsp-ldr/adsp-ldr.hash
index d708db3d38..519f613f15 100644
--- a/package/adsp-ldr/adsp-ldr.hash
+++ b/package/adsp-ldr/adsp-ldr.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0f240aa5aad9300d8f4bc7ffd9cc1c53e01dfd6120de4f20f60d4d4176d99c10  adsp-ldr-v1.0.1.tar.xz
+sha256  2be8bb08fecac1bebfd51e659f745deb270686fcd8e4e4f624f66d6810b4a643  adsp-ldr-v1.0.3.tar.xz
 sha256  c965604b194588b5799b75fcc11cc39be09220e580ae96e2a72848f042de56a7  LICENSE
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
index d269ddb093..d46beb7ad5 100644
--- a/package/adsp-ldr/adsp-ldr.mk
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ADSP_LDR_VERSION = 1.0.1
+ADSP_LDR_VERSION = 1.0.3
 ADSP_LDR_SOURCE = adsp-ldr-v$(ADSP_LDR_VERSION).tar.xz
 ADSP_LDR_SITE = https://github.com/analogdevicesinc/adsp-ldr/releases/download/v$(ADSP_LDR_VERSION)
 ADSP_LDR_LICENSE = BSD-3-Clause
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
