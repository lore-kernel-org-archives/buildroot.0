Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B29606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H+M/IduQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7158840831;
	Mon, 16 Nov 2026 17:41:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD3g4WX-l-8L; Mon, 16 Nov 2026 17:41:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 84EDA407FA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794850878;
	b=IKM4zGmBR+EDrOP8o7XV/74n5vEcFW2cc8nRmScXhYEiYMSi4M/dtpFy/JJx7wE082xC
	 w9cE4rGMyfzxTOB8iMshNuipNRyV/yUAjLs8P+Hric8rIulOw8e+o+sIPHFqTSBJLLDwu
	 fa95CVvzoqocgLZVHfPeWZ8Ms9OIsVmTZNHpkDKLwGDlkNDvrlJgkTDH8Jma10CDHU54c
	 16FY88hYZimIMnnUBVWb77qBfYCtgNzgc0a0rYNMx+3NL8NKOLIo4kQwgeMjvIRLw4URL
	 lBxLLj3gLtp9/Y/kTztebWHImMK7x4r9LnlRpVQDVgGA2Qlt0ibE5dXt8e+2gvlSkIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794850878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 Message-ID:MIME-Version:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DkqH0w1sK8LHsy/nIVH3QYgHqYpPtboOwC/7UhltRSc=;
	b=Zbh7SdWVGaqL0Qvz4GcmW+0sN6xbhpVz5soP/iwly/5nUHffhfYep3HsxCuEwYdw+YAV
	 Ubj48V39Dkme07wAA0ugKRrzgaTifEBQLwUOZLLSIzJAo6JtgW6blCtOdlR4zgh5aBWZf
	 inAW6y49g2DbGytcOfg7vMAvGHAZgVJ7cXowJflmNkDckevv8a6189omgGsKhoxvg/8i8
	 B5TqFytcYqOMuGDjiJh6fjOy1gaMOd51yGQdHGkIXGPRIOrWPxicGpoSMA9rPYLl73Iqc
	 Uy0NzDBcBSDc2tORD8Wf2YTD93gNYoXpInd3kCZScQH6sF0LsdDP+sG//dRfc77tZEw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794850878;
	bh=DkqH0w1sK8LHsy/nIVH3QYgHqYpPtboOwC/7UhltRSc=;
	h=Date:To:CC:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=H+M/IduQv3ZmYX17Q/sqtASSxJ9D9avO8+/Vy2mbcBv65nLEM4F2XFflqXMICB/YS
	 Q0pA8zokhEYbqkGcT3peU2Y93rcmWcingfXPIsp/TvROjh8teZW+V1niFfPZbh+y0c
	 2GQXTj6UMFYDjjtMPQlv349dYZxTVQNl+4U56u2b49L5YPvjEpJCEfeRanz2Dc9nUm
	 fxxLsooft586uDy8bvcIbbCAAiz0+ZuUqcMRpCfx5jr3+NV1wlszC/u8XgQLTn2cY2
	 D9LeujKZW2U4APehAwjAVSrhbcWVumwNfKOLVGvjPWP0a5o1xSVXLTgeMNCLQr/tVt
	 1JKgi5DXO0ESg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84EDA407FA;
	Mon, 16 Nov 2026 17:41:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8800F4DD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79D0A60793
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5luJATjraAzH for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 17:41:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C924F6075D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.150.75;
 helo=mx0a-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com
 [148.163.150.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C924F6075D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:15 +0000 (UTC)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
 by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AGGI8w41725055;
 Mon, 16 Nov 2026 11:41:14 -0600
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
 by m0380145.ppops.net (PPS) with ESMTPS id 4hy9j5qnd1-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2026 11:41:14 -0600 (CST)
Received: from PH7P220CA0160.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::18)
 by FT1PR10MB649758.namprd10.prod.outlook.com (2603:10b6:170:2c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 17:41:11 +0000
Received: from MW2PEPF00014673.namprd04.prod.outlook.com
 (2603:10b6:510:33b:cafe::88) by PH7P220CA0160.outlook.office365.com
 (2603:10b6:510:33b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 17:41:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014673.mail.protection.outlook.com (10.167.249.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 17:41:10 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 11:40:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AGHekdA2236197;
 Mon, 16 Nov 2026 11:40:46 -0600
Date: Mon, 16 Nov 2026 11:40:43 -0600
Message-ID: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABtA+2oC/yXM2wqDMBCE4VeRvXbBeIS+iniRxFG3FCNZLQXx3
 ZvWy4/hn5MUUaD0yE6KeItKWBNMnpFf7DqDZUymsihbY0zLDnZ+gQ8Xws6TfKDc2aar4Ot6bCp
 K4RbxH1LXD7f1cE/4/fdE1/UFJjtb9nYAAAA=
X-Change-ID: 20261116-beagle-uboot-fixes-7a573ec44d53
To: <buildroot@buildroot.org>
CC: Romain Naour <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014673:EE_|FT1PR10MB649758:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e52da6c-93cf-465f-3870-08df4408cd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|261009221227099003|261009223027099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: xMVctnrjE9ixZlO6gw9jyzbUKmIMMcUOgVbx7RhLzOvharYWrRKu4uxuc+2744d/IfIelYubOaUF4rj6AcaRL+TZoM6QuEHMlHhmXkPnspd/hx3Qoks7bU3zUUB74PXRH2MxxqCSFhRpdCcqNzOPc5CVDDvBpeZXZxA7enoAjjVJS0+eysudakBACV3pT736Gu2APfh2ioGXY3zx6hdwdsCVKmbujJr4oTYz7sLBQhP4r50TM7aSDTgi68DuAxM8hEPZpxvwDfZ6qQWCP3wHLKUtDuzAKhl8uaRh8TUwmreTNwlcSerDZK/HksD2/VgaL5AXmt603ucajAHOLkqAwp3TdHg9c6MVj0BjCNgbugNZzcirdq8A7XdQwx6D2cfBQY9OOG/livHn01/hQzoplFK/AdLG2hx2f8OnMcyPu4xr5kePhwZuzuJ9sEQssnsD8RkTtnTEhFQb+WMdSFM6s595URessH5WzejlQCnEpUQkaGwQlMhUgKmECVBy32X4ZuUgA3srTR9TIJyxzGH0a0qm7RGjklyqcxo2kXt//GnHDyxtLC0nzxeXVopMjz/rIUgckussAicYyDtz85Kn4agxAMHsioQmKO+4u0bd4Rzs066zrTQzHS7sjjJWLVQ8ntYU/KjslGowhySEVKJcASG0h0ByKALv588nOT+6qjdNQg2skQgi8ZXUR6gGJwjQ
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(261009221227099003)(261009223027099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0bp32eWnXVrxRm7V9bIx4AAka2qbpqYzrlrlZh9XC659HU/1fZvypI60a5ecyfHmeGsgYSwW/pOrCL2UoCxHoE7ZnO3C86r+2wgkWT7NNuYu/kitFL2AN/bHMJypR8SzvHIyJz5WMZPM14K8Ajrywo1Y6RrDv1d0ozaRn3FpHI8qlU/9dVd4zp2JdnWuUz2s9SYlCQpQ+mqVn70ACtI6KBcGjIKKiAhFOhAE7HdFOWkw/vgHwAoYBl6vlkBsfNpjpszSa8heZwUHTPQy1LxBn6Ccto156jOiTpRSdwdIFmfwDEHSerAzBxVqRPS2Q/6walVe99d1DHNW84gPtC5QN5Oqc4D7gCSa7XIkRs3Q6jr5RVN6LjxeMYtYh2yQvrhp7EaOQkl3JvmBMVdG3F3OXq723q9q0wx9uYfu+I1L1V149VFJdNQfUDiFRGsdS+OJ
X-Exchange-RoutingPolicyChecked: lk1GmDzc+kmx9TD9WCQfJtvHf33Achg0llGwaNPpnE8DonIJ/oYK9MV3wy8/GUwM0KgYxzlFzWe5XW2gMFZpc7LuU6S/HxrsFqurk49c8adWnV7Xs3R5RBLnZtTi9x+WRV9zyglYyoGkkVsrSUSVnUo0YYX2h1lEzZmfMuVtyz9l3FQbG/nQxw7ijHTJrn+d4oZ6uSzr8s1U1QVFQsuHB1XtppdPBfHLaPzKRx83Va+zSe2MnbeC3z0w4bRoXOIcQcZZJ6a6lYKw8iMjtC9Eg4apulOPLTD0YkzYRBLqAKN9bj3tEEnvHJHGbAcuJ+y/6LOvIA0FKdrSjKCd3+Ka+A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:41:10.7031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e52da6c-93cf-465f-3870-08df4408cd84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2PEPF00014673.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR10MB649758
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfXyUDKxBPvyegs
 8jNYxRPtNhfJZBk/OaVOLyZEVg2paZv60gK2cuYE0FnCQcAsOwmP5ESiEouasSsNJYlqE+kx7WN
 KOzxVpmeGhHvPNZYFC9b609v+z9c4jQ=
X-Proofpoint-ORIG-GUID: sdu2vrMbZYyVpvV4ObMaQNj-T_3e67Pw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfX2m8DRjevAsSt
 3Yt6IHa1FHAOuo1yPOXqwQvdzG38Co2cb2aCVRPxqBQV5dCsKhoAng3ALHZtyCmgUFkhZcu8NI2
 oknLIhzkM4WlY91jyS//HuaOubHdYmibBLv2EGff/McZO10vl8E6cc6yrL4cg8qbnM8Y4/7lTsi
 FUCM35KtfZyYxYAg799HcCKNg/PyE7KJ8GT0ZeeXeklcCPs2KKnYOxiIRD95r1BP3KvSYNHUplf
 kfrsz/Qd+0yqCYdAmZNwMbWrBlADT+tXix0DQHlVP1tr5pfr2TG1689zLblaiIQwS7uya6fcgDy
 o+vEPdsLz4fYa2A+FYt4WFq/GyeSSkhwi/Fyg3LUZ1RSViG9MJ7Y5gYZSRcH/gIFEOtntJOnkTX
 B6Zv/f79vYHU1bv6aqT9jLMqYV1PLe2sKT+leFbsG3fXZuLecjHJQckqtb5KYuNSCzLL8iQ9yQs
 jvIhh7irAegROGCkREw==
X-Authority-Analysis: v=2.4 cv=TplzFzXh c=1 sm=1 tr=0 ts=6afb403a cx=c_pps
 a=bYEXqv4PBJnnT5HxTb2zpg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=2Z-9jba5QLlRjYCj_cQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: sdu2vrMbZYyVpvV4ObMaQNj-T_3e67Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160070
Subject: [Buildroot] [PATCH 0/2] board/beaglebone: backport swig python2
 compatibility fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hey everyone!

I noticed a few other BeagleBoard boards based on TI's K3 SoCs also had
trouble building with the same error signature as the SK boards had a
few weeks ago. So this small series backports the U-Boot patch needed
for them to get them building again.

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      board/beagleboard/beagley-ai: backport swig python2 compatibility fix
      board/beagleboard/beagleboneai64: backport swig compatibility fix

 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 ...place-removed-SWIG-Python-2-compatibility.patch | 67 ++++++++++++++++++++++
 4 files changed, 268 insertions(+)
---
base-commit: 5edb8d6a0c3db587f5dbfa30ae377e4fa408d8f3
change-id: 20261116-beagle-uboot-fixes-7a573ec44d53

Best regards,
--  
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
