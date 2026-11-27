Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89169606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PBO4+gFh
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53831409C4;
	Fri, 27 Nov 2026 16:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58Tc-P0vlGoA; Fri, 27 Nov 2026 16:35:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BB074085A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795797353;
	b=Nzq0HXE8x2x5xXHHpQaaZEPXWJaF3gM28buGbwpnppG0VNChf1FO1Pysxmoie0KpOMoF
	 WA1uvB2HjiXDZ3u3/Q1JNvABcU9ClIYKdrGGcU1MNtg1/DkmlZkBboEghHKmd/mfUxRaH
	 LsulmuJ9p6soMti6Y9vlsJuIA35LV7XZok8DtaCMYV4N1aVVs3H7GKcn+ZXbezYoBwB34
	 3/khgwvsqQ+hVfPlSYY8Iu2CgTaBt9SS+ZuHO7YIAdTcTPtZt1aKcoT9begH/kbRPJlKM
	 /TP1GoP9XHhi1IC6QIV5WTlB4FB0xY/SYy2wTfva4b0tZE/fo6JURJzcx5usDzbd7mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795797353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FB1kBcLcAeXrTTQQlwCMa5gedvGnvKiqXud1+Y3QzJQ=;
	b=GwBjQZl3TrO7tQv6c38Hw8jIofmLkyLonQgjIYeglYOVNhQhABWyPD8ubIhlH4Uq0ZKl
	 LH56jnbjNVjnMirfEv6T7ie5OP+FcuqUjaTF6VJCW/7RNRgirg+qxxpN87m70XqsJ2RpW
	 dnglLhDenyaXHGom1pGjE8WnTuNAoU9NIg6Pm3mCXRGmzorShsI0SQBCZkhmsO5CJKjmb
	 +bQsueCMu4gASpdXZNecKWy+Ms23xXvg9YpxZVYPbNXGaOBi1mkg0HDHORXb7NUMtAKmh
	 +Bsv0MyhMxfNRObvT+rBivixCGz7MJcfxDY1MVR3m/ztBXCqwx17zco8y4Rj8W4Gqyw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795797353;
	bh=FB1kBcLcAeXrTTQQlwCMa5gedvGnvKiqXud1+Y3QzJQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PBO4+gFhMIIMR+BWiqIkXHW9oGFBb261gJ+KeMgL8H2D6EWPGzoaheW6CigKJHQtP
	 MCTjaQeQG5KJ7ujNGHVl1swVTHjpDWUYUUUS6bvTe6V4cotSkvTkggU0H088Jxl8U9
	 JvWJKkj8mNQvl4NYxvUs9oYSa5AVEk8UfsknscwtkLczECw6KY9BH90Y1pA08u9Qw3
	 oBi9fURqBMpG0QLE7gw7wx1Vfq7uP/4fdRLnR/JGUvaz0+o1+U4Ulg3ybjjDQxpC34
	 eguUjBNyKRN4kTTfb8Q2DHuB4GiZD7UZvBrbIlYtzGEXIQCgZmxcmmgL0Umy2sUbn7
	 IXe1u3gAmrPBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB074085A;
	Fri, 27 Nov 2026 16:35:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB7B12BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A3960755
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:35:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Go9WSL84YMdV for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 16:35:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7EB7960621
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.135.77;
 helo=mx0a-00128a01.pphosted.com; envelope-from=philip.molloy@analog.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EB7960621
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:35:49 +0000 (UTC)
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARE001A3916563; Fri, 27 Nov 2026 10:12:01 -0500
Received: from ch1pr05cu001.outbound.protection.outlook.com
 (mail-northcentralusazon11010065.outbound.protection.outlook.com
 [52.101.193.65])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j5uq951aw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2026 10:12:00 -0500 (EST)
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7) by DS2PR03MB960700.namprd03.prod.outlook.com
 (2603:10b6:8:3c2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:11:59 +0000
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906]) by PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:11:59 +0000
To: buildroot@buildroot.org
Cc: Massimo Pegorer <massimo.pegorer+oss@gmail.com>,
 Greg Malysa <malysagreg@gmail.com>, linux@analog.com,
 Philip Molloy <philip.molloy@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Date: Fri, 27 Nov 2026 16:11:40 +0100
Message-ID: <20261127151142.2983596-2-philip.molloy@analog.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127151142.2983596-1-philip.molloy@analog.com>
References: <20261127151142.2983596-1-philip.molloy@analog.com>
X-ClientProxiedBy: FR4P281CA0354.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::11) To PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB989121:EE_|DS2PR03MB960700:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1a12a9-01f4-486c-adc9-08df4c98c858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|23010399003|10067099003|56012099006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: Z5rZf+kZK95ze620bzniTXkRlDxnXawPGMA0KHvXn8peO70ZbSMD3DRnkZ9BbaaYCCc7DYuObmBB7cdyXkhtI3VenrfvC15xRQ3Ln6ajRpIw1o5m8o7se0WOnhcr+Fv+LzLZlPiL1XdYyzm6GI1OC+57Z47zX47URDZC5bgFLflO+0gjgV+TQgP2W7oWDPWhZDQ5Rxac4reVzAykAW3XuYWn8OhWrBZ2lj+mFyA6UsgfRZZuIr0bT1DNsV/tGBWDjvjCjJWB+qgxf60cy7ENxy4NIfPnaCzww97hVVzJAF+9vE633c5fpglNqke5ZQwZomTbwigJyBnDcgflreWO6zpSWC8uMHGvSSNQQP/vylybjfPF1GnjTupwOhlkYQ4LXjxmoTLAzvC6qfK9rP/CRTcSILUDtyTsoCTmifjYBSsf4X8N+CBOs3GaAmmFSS6qgmfYpBPShMhWyueUEJtXKJiL1Gw9IIWu4laGc79mVsPfO3SY7VU+PErqyvUiHwlEgnpwu367QcSQ1l/LGFjLWXJKTTpZqyqQKgnTRpwwD8zf6yiqq0CJ+5z+yXEn9FVlgepq9oo78tFRK8xffa3T573X6WQQkDg1jh615n2eQPGE1LyAzhh2D/eXdJI6fl6Tqfm4yF0sW7wX9rGQ6gPRS6Wn5xYoj2BuKaNVQV/7/KU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB989121.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(23010399003)(10067099003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MScvuOTqK9XtTYhaUeLe216P/rw4lA8GWZf7VBS4fwLYHEXDizIUWAsiIrSE?=
 =?us-ascii?Q?7RHCgZ2NHC3K8vXFSUFrWD7eYvkJUTR91CRcpihJNf7IE7OnS1RCSo6wE0l+?=
 =?us-ascii?Q?j/5/Xg+kdMv9/x73xJRBDpCmZFdHBe+yi2bL8mT1AHFupHfefO1H+9uScZpV?=
 =?us-ascii?Q?SJR8QT6c/SXE6sD5csSrizfz+0EeqpXY5PInx2W7dD44m6UKYMSdN1JL4tEV?=
 =?us-ascii?Q?4YzOdWDgc6vu0rXYQHNgcZP+sqSyDv6KKmhFnRQfdsXbTeZkV25efeQrPXvV?=
 =?us-ascii?Q?AmavCE3ML0s+12ESKvHa0GpPpKcBwbCkyNcLyZEsq+1HFr/lHf7plzg1L8sp?=
 =?us-ascii?Q?Ja54H0DKznDK4QocC8LrVZ1sCysfJw8Mln+y1+WJb4EwnKwRcbu/liZcYtgb?=
 =?us-ascii?Q?Q52VqHdHOlMlyw2Eh9+DNJqNReVNdVhZHrdVceHW6bfTDkcR7gQJYn+0O+3W?=
 =?us-ascii?Q?/34yDXoLz3ZrUTYrdfirHB+fFlvTIIpB9UbSkfIOQ6XZu0IwPeOAlMJ4Fmy0?=
 =?us-ascii?Q?22DuewbxAGJc9JQVcWBL53pGHTZ+g7rLFuXGtiYO5tUwqEMDm81iZ4IN6GdQ?=
 =?us-ascii?Q?WY+xfeb4Qhlym+CyL3O7iTYcaHFPk11yDYCmnfgkHrglYnKatUSc0D9Vchjk?=
 =?us-ascii?Q?b1YWUmj3BnxcGJGr0yu7fxyrbQ7HK0TRHioou2zODU+tmSypvqBlTvCmRNmp?=
 =?us-ascii?Q?hV/q6AkeEXlCiX9Ohgn/Tyllr7Py/y0z5lqxkEAFspMY0vXBKGvogCswtWFA?=
 =?us-ascii?Q?momzFMbneEfX66C+2IaMdxTGXvVUD8XIJxm+RgJ/0TDjCauOKlsod19eWbQ1?=
 =?us-ascii?Q?sooqdegjVRjO/vo6Xn1jnHTZWo96gAFLMLIrFMJymk4Yu1u6u0sqKpU7106l?=
 =?us-ascii?Q?o1CdCitPp7E7BHVLqHoRkpACa2zyMnVIP/qOK5K8pGFscluqasTlv1bflAMR?=
 =?us-ascii?Q?As+XrCNwyuyzeJIGzBCA8nTJ4L9taxqgnCqxRxAT+QoMWqPyycUd6ZbMDZuN?=
 =?us-ascii?Q?+r0wSXsbx7Fm6mtDqD8HnnSDpil7V861ILJDJSeDzuZ2YFjDq/iBmt+sdaJ2?=
 =?us-ascii?Q?D0lx0VyB4WJ5MBCRf9IY/wV4KlgzKtO/qOQ7fsUPNa2r7oNDihUpRmU09R/a?=
 =?us-ascii?Q?g5VwFV/GbCDycs4RCNQbx1jP4a2pXt/jOO7XKFL+7/b/dVqgKiTwV57IeE8z?=
 =?us-ascii?Q?r7uJMF428ibh3Dw5njNVRj/HElp6nXjYqQaZClKfRmg+OTaT8S8T468rRj05?=
 =?us-ascii?Q?cxdEvIV+m8IkdDxKt2MF56xaBm4YlGTBWi8Yt03IWmf/OXjckoqIx2cTof4F?=
 =?us-ascii?Q?xLmeFOkkMYZN2KmZVfigZkN2q13iBzFP3KvQEzvctdVe7C0FBtGLJ8ByavvM?=
 =?us-ascii?Q?0ZO8lvRdPVHaRCFRey61JqH+uvmuHXJzkf1MKQwbhocs6wPuiw6BqMIHSI/K?=
 =?us-ascii?Q?IEVDFOVVYcpB0vVd4BUBegmwWPytSJGSdXi7NtSpjVNq3kgvIytPmVHFU8s5?=
 =?us-ascii?Q?IX0apPXoypnP3fCYRcuVeqU2SIF6YTfhebqZOHU9uVVi9WFj2XZSErcqohoE?=
 =?us-ascii?Q?O07M1ThWG2YmHkRAnnf1Am0WsoVrplq8NBW5UawO0M3ysKFmMU4JmT9ImTP7?=
 =?us-ascii?Q?Do3ebDzq1HInFeOPCxJkZljhJHBNNJCsM+P6Zl/MFXdxBMHfdRnh738KGs52?=
 =?us-ascii?Q?yiv5FmuiU0fi3pZKJm9HhrvLv8O9bppmq+o09+um7A0Kf+egjKO8q32+jkiv?=
 =?us-ascii?Q?XF8ptpWJj3JPI5u2ypgXB8WYOe7fTJEev8Mc97ZWaRSYICKgzRXQXoX6oEeu?=
X-MS-Exchange-AntiSpam-MessageData-1: 3BDrt658i/jfEA==
X-Exchange-RoutingPolicyChecked: fxh3t0gOC+SPy3eblxRqa+0tDuLk+hD0UYNDZKUzkgZRRsdOZxYqyiFHeHtKgFFbt+YFX1rq8qxvdnpVHGae4V/6FPYEymL8RKFWWuEvUvu4WDlDCBFvLfe9kIgBgX6q5IsyaG2ryKteQO28/QKEXiveJ6wuWrQ3FLcNp3bk9wS8BB+qN77t18oI/Mmef/mf6Lr9pZz0Imj46qHPQ73cYL7X2VOomqS5yHfWwgzYiqcr7jVTY/mRV66UvUWB8KuBkRGRUadVhW4KItpOiN/R5bzOxa8R4IEeRnTwie7yAlwDBnnm3H/dzOG1c6lBDOQPR7bcxmVDxq4sTfGBFKnQJQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1a12a9-01f4-486c-adc9-08df4c98c858
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB989121.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:11:59.0562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyhHKy1jDvPXKyN2nZijrCb6TipPF2XStsiFzmNseYDcA+BCAGGEZq8ofmGECId0x6UhxQMPprXl2XjLhDvj4TIgmk80BxNgXKxZ+EFjI8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB960700
X-Proofpoint-ORIG-GUID: H3j6rYiRrpeqygxtdk_S2M1HTsTi69wT
X-Proofpoint-GUID: H3j6rYiRrpeqygxtdk_S2M1HTsTi69wT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX1XB71S6OkumT
 0Dyd2s1USt9beesB4mfixbPl58/c4pj8Eg7ITCCeZJXWAwrRjOV3bAQKZC0K4ZlSSCXT45VDxR7
 D7kp5jyBQLFWeeSTIETKg76kLQCA1r2IPn3VT+Xb7CWFB6VpVcYZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX9jk5vV2Pq2vy
 +qI8Tm/MCPKjtAcncx8BDvTMcM6PT9ct9J0EHT+fUeDL2YKdjB+CA4Mp3dhLYXro0aIW/5hmPGi
 EeR82d+mH1aWpHvdCt8HWcLwXpXUEaWB+g8wziOQn6F80QHFedIa6InxzDNsjH2rI6hDCGMB0G3
 gFOGR3IzUROk8+wEayQPoAIvsch+tfTfHEdzKf74jjruDWQ73Ah3C+UlS3m6K/IHy9DqjnLFXc9
 +F47oP8n3fRDIYYD2KuE0JK1Ay6oazbEEkr3HPWVa/ffVJ0Ts1EpQNwd4N/MqNP5c4CZumugdkZ
 dv6Lmnua8DLj9Aw7kBOSx1BdWm4ooV27gOlYiMfsl7EPeu5zznFQv3UG12hAElDDHMHAiPidCL/
 DAVw0nURP9wajRXYLRu37ynHElvi67Rez9OTAGfwQEqC4OEfTCazyfjtxVCXReLcLp4Iedygb/Z
 /SU2GPd4SS+DQqKnW2w==
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6b099dc1 cx=c_pps
 a=wAiiizkMq93U2JYT/wsFEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8
 a=eDKwIjLYKN89NEMnvVAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270060
Subject: [Buildroot] [PATCH 2/2] package/adsp-ldr: install ldr without prefix
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
Message-ID: <20261127151140.AlBdHdcK84ekEPkTJsrCttYl6Kn_nWXDgDBkmtQKNOk@z>

In the U-Boot next branch, commit 4b0ee21c408d ("Makefile: Drop
$(CROSS_COMPILE) prefix from LDR variable definition") changed the
U-Boot Makefile to call ldr without the $(CROSS_COMPILE) prefix. Since
commit 943998e33366 ("mach-sc5xx: Generate LDR artifacts only if ldr is
available"), the LDR artifacts are silently skipped if ldr cannot be
found.

Drop the custom install commands, so the default meson install step
installs ldr as $(HOST_DIR)/bin/ldr, which newer U-Boot versions find in
PATH. Pass LDR explicitly to U-Boot, as is already done for DTC, so that
older U-Boot versions, which call $(CROSS_COMPILE)ldr, also use it.

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 boot/uboot/uboot.mk          | 1 +
 package/adsp-ldr/adsp-ldr.mk | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ba6f608751..1386a678af 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -268,6 +268,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
 UBOOT_BINS += u-boot.ldr
 UBOOT_DEPENDENCIES += host-adsp-ldr
+UBOOT_MAKE_OPTS += LDR=$(HOST_DIR)/bin/ldr
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
index d46beb7ad5..b3299de38e 100644
--- a/package/adsp-ldr/adsp-ldr.mk
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -11,11 +11,4 @@ ADSP_LDR_LICENSE = BSD-3-Clause
 ADSP_LDR_LICENSE_FILES = LICENSE
 HOST_ADSP_LDR_DEPENDENCIES = host-libusb
 
-define HOST_ADSP_LDR_INSTALL_CMDS
-	# The U-Boot Makefile expects ldr to be prefixed by $(CROSS_COMPILE),
-	# hence the rename to $(TARGET_CROSS)ldr
-	$(INSTALL) -m 755 -D $(@D)/buildroot-build/ldr \
-		$(TARGET_CROSS)ldr
-endef
-
 $(eval $(host-meson-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
