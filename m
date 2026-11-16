Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA9606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Kcgzbi6a
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C08B581110;
	Mon, 16 Nov 2026 17:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BQDRvlAMmpB; Mon, 16 Nov 2026 17:41:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A9C1581016
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794850867;
	b=p6kBOVE+oiEWcmjxt/74hdFuP4xMwRvje5CH312fLU8XvDQjJH+8mzOkLQYwHl1JINcl
	 3T7tL7/X/vNMmbXKH3vn7Vnb+4F8NcEFbRNMMjuYyJ3KDazfzKaemL44RsG9efcYSsfPE
	 qBFKTwOCVkGjwKXHZVwJ1jcY6r3eqkMF3v5foe8oFLV3uxdnPvRmnZI/6UtsTQnCitUmi
	 ahO7zWNiriyG97QQDeKedxxYgWJA5QoM7SujFUATzgqbVRRIoD+PpVA5YgW4xgCZYUB6k
	 ibItYcxXKjelVZLDuflHRZu1QgsShhn3szbxr9xoBST1+XeluIsq8kzJTduEOCTxfag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794850867;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Received:Received:Received:Date:
	 MIME-Version:Message-ID:References:In-Reply-To:To:CC:X-Mailer:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CpToEtAbmHm+WueVR6rSMeoJGwkG3L0xrDG4bAeRkps=;
	b=ivyaoLeM2SLksgMQQRnvG5cfvhn6dBx/AO8D0ZWkvkNnlleRTjyAVU3+8PboLROQFMzL
	 KHDuvdcHCGrJBGDnL/i9yLtKcHqO50f8vaBcnWbXJUq5/kDT74JgjHfNhnreufk/oSKqj
	 3PtwQo4NXinV1Q+5JXm7hTS0lHujVc0W/KQb88t3lYhA5IuXiqrazoMh0+p++MmqYqPt2
	 G+9+LZ+mP14tlW+KE45rmFA+URKE/gGTKTNOlcdhXnJUZFviA+wlgLUnNWpcHlhPrk5AW
	 73xBLIAS32STveGXQLQ4WUW+NS0LwRSEHEdXUBuAaZ8GrCzHS6cHRDIUT0IUz6wq7jQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794850867;
	bh=CpToEtAbmHm+WueVR6rSMeoJGwkG3L0xrDG4bAeRkps=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Kcgzbi6a/J/7VNX6HHQtAuz0MPHg1WKwmYlU+zzSaTlCGayFSkNngsdnuL2NHYc7B
	 zO2ouLd76rKBns8AU32YJ0gdaw/uptW43z/Aj6qoAuKPTWfQsk5H6GpdlT5DhbCHNe
	 gRV+17Uq1B2NucnnAyY0YIq5UxVS/It24IYUOmv6wG1c9I3Wk1eXL+fG53OWVVTN/K
	 QrpmgXxhPhbMjdjrQW5f7VYf5hQa3NezPQiumjs4hPqI3NuIs13c9zgcFmStU2DxXs
	 8QQlrJ55x2y9Gie/DcHuca3L4XC+YvLlE9a+YI/NMwvC69fG66FUW8pNW7nJl4sDC1
	 zobyuY9WOn2AA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9C1581016;
	Mon, 16 Nov 2026 17:41:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E3912FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E898A60793
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BB6dEzy3PrGS for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 17:41:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1AF276075D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AF276075D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:41:02 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGGIYIv2118898; Mon, 16 Nov 2026 11:41:02 -0600
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010054.outbound.protection.outlook.com
 [40.93.198.54])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hys3ucsvb-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2026 11:41:01 -0600 (CST)
Received: from PH8PR20CA0002.namprd20.prod.outlook.com (2603:10b6:510:23c::6)
 by CYYPR10MB7649.namprd10.prod.outlook.com (2603:10b6:930:c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:40:59 +0000
Received: from PH3PEPF0005961B.namprd05.prod.outlook.com
 (2603:10b6:510:23c:cafe::5e) by PH8PR20CA0002.outlook.office365.com
 (2603:10b6:510:23c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 17:40:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 PH3PEPF0005961B.mail.protection.outlook.com (10.167.243.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 17:40:58 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 11:40:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AGHekDF1219699;
 Mon, 16 Nov 2026 11:40:46 -0600
Date: Mon, 16 Nov 2026 11:40:44 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261116-beagle-uboot-fixes-v1-1-834206d9b47a@ti.com>
References: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
In-Reply-To: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
To: <buildroot@buildroot.org>
CC: Romain Naour <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961B:EE_|CYYPR10MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a59cec8-abf7-4660-4be4-08df4408c64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|261026140227099003|261028144727099003|261021135927099003|261022115727099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261102123227099003|261009221227099003|261009223027099003|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: WqKRXeKluWzZ4wmAgJRtKRczjjlAOdDWHmQc9VfgQGqSJO9caS0mf56Xqwid2Fo1HimVKi3oPWMYqKKVL6kMAfuSyvn6HwnXg31G1DI8AdhWDtgXQjvbuvFaB+nv0WQIZaMAp2Cgs6PfL1phrIQND1fqsmDKzeQxgotaJ59BcM1+FNINRBmnVdJbv9TnDlGW6Jk9+NyL7p0WFxZIms+q/t2sXQhBaAn2IEq38vTNXC7lRp3U27NPN5Bw6jg28J3XPRkrSXQPwgxBLv1D/asSpK7uL5PtuMIgOV6vhDK/beqqYkNUreRbh8QSKwOY5wW+3H/mnBdpfg/2BO3Ovt//ji6Odu5obpFKxTsHELa1CiyfOI37MM4XJPx/2ziJB9lGMhmrUPY+Izu5aF/2ftvTom70XNrRO6JSZIXSxfMjR4+M1WpkD4UG0ZNR+Sa64RWpAfc5P3ToYmlzybCCY7FJ+2x0HQHgGi2BZK9JNIfFoIi4M+GEpsrDoNpsQy1ymjpuRtZOubxet2a7Y0pgNAh19IvPmvrbmqnxNAzuR7shEKY0wTsf0vRHq4E1sWI628QY6N+PS71AwD5nqST2s54jPhJqMxgJiHYM2pTvfY7u61XMf4SXUgobqorIVvyQy+P7+YQhuzGN8VvC1Rlm2qYvjw==
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021135927099003)(261022115727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009221227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SD/frxuv1Wcns24yEoPSpm9ZA2qih53nwRuSXmx8PQlXe+6IRmR0sdRK2LwGzfcKnSJNHLM+8y4xRG1tFUU8RtLBuzxVeHuEiQ0VcfdEzd8UJMoOguZbJSQ3oaUgEWE39JRLkZmTmag7MCBtq3MlzMbvZSPQFrBc/tzsKpzp9wJofHuMi0vM04XhGioVpidvJHIFBeWZ+y7QCRK+Yr7p1vRgGKooHgDcdu/6TKG2Qjg4ED6HWuvnA7mkC9Qg5hKQi8yzdTgk5QbXE4ZVsgRr39Jx0gFtBFtY7Mio1XVr2CZNNzCJ8htvB5GGzUKDHC9xWFCWLfKRcYOF1VzxiW158ZK/LIacjMV7TL0L3a0lOvoXnMdk8+vXpEmxfH6XVhE1XtDnIzBZQlIcZE2dGWyEcD7vl6GjZwEIjbc0uVrrk7eEJiJOhx3p9ySoZc3cfI2A
X-Exchange-RoutingPolicyChecked: zbbIxSnbopxHQPHBws35CUtlqmGlMmaXT8GNsqE9DrI57frIQHRMxnXRQVc6YxhxD+1w9EfoSsgi17qR3Q0lLlRCaylrOBr2JeC3rkd/hR03dTm4tyXGrIlRq9Ernmbc6NkhJQtp8Vxm3L76w4tf+Go+uHDfkHyF1YUpDgvbnEoS/VTIWia47i99niWmPdQyise1iX5cnkD7qa9ud3MEZ9G0jRI1Q7VHIQ6+e4wstJKTQzATZS9BpbIZzM9LIAd6P3snn8NypROGyf9k1i1n0WbzLdAMiQzURveJYjb7NTbZRkr1zebYWbDwYTt1t9BeGczkDx2nskLpebhzM9lNcw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:40:58.6081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a59cec8-abf7-4660-4be4-08df4408c64a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF0005961B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7649
X-Authority-Analysis: v=2.4 cv=etZKXYpX c=1 sm=1 tr=0 ts=6afb402d cx=c_pps
 a=ZPdQqRLVVCQ1wmWelBHSvg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=1VxDqnHFAAAA:8
 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8 a=pGLkceISAAAA:8 a=Ftk-Gdln9yy6TGOSzjUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aZ5uHUMKh6B-zo3GvD48:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfX44zYMNgbFl1N
 7YnUGVeCw/INeF5DmXEraM5XFZNNTqE+VwxfHnUwFLjjfmJIAcXDdEBXDN+VDzYxLabcIsgh3by
 jA2TOWPvY5+HMqNuVkSBQ2o/6SVIf0q+GfB5qVuz78yFcr1y9/lwkGJyY31BlaqSwb8rdEi0Mic
 HBt2b6U+z6bcJnWJ54xWY655ZIkLKAUbMnMdapTIyaJnUnSpDj+XxeMYXitHBRxR9TjTXTdukTU
 xlzFIgfN9WN5W+3Sq6HRmhJ6QR2FocuvF7lPkUxpDrgOOwfzF/biwbfv1uBSK9x0404pfXiFuE4
 Z+dxvaGK+owTpf0vLjPnOPUct+42Zv7UmBGkfJaXB2W7Xis5uSszAm4s7AOiuL5WlDeaY08HrGM
 ko8UkIypDJ3dQx88si1N1gpLIcTh1zIuWfjIVSXKdCuMmga+631tOS8gO59D7iTI339DFhdjEg2
 YGB4KV68oGacgDZmcdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfX2gY7ZQuGhcbK
 DQpPHa2A3ves31HWweSDpGGN+sy/FFrOK9XebMSi1hcMKqv/k7iDyEgUJnzrg2TkGSakxYGcbwS
 CpTWCpa16kUWvRV2BhVapRoDJii4rzI=
X-Proofpoint-ORIG-GUID: H94bNX-bP2LpskWbwEDJD_WsMuBTsf0e
X-Proofpoint-GUID: H94bNX-bP2LpskWbwEDJD_WsMuBTsf0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160070
Subject: [Buildroot] [PATCH 1/2] board/beagleboard/beagley-ai: backport swig
 python2 compatibility fix
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QmVjYXVzZSBzd2lnIDQuNS4wIHJlbW92ZXMgc3VwcG9ydCBmb3IgUHl0aG9uIDIgY29tcGF0aWJp
bGl0eSB3ZSBuZWVkIHRvCmJhY2twb3J0IGEgcGF0Y2ggZm9yIFUtQm9vdCB0byByZW1vdmUgdGhl
IFB5dGhvbiAyIG1hY3JvcyBpdCB1c2VzIHRvCmdlbmVyYXRlIHRoZSBmaW5hbCBmaW1yd2FyZSBp
bWFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgotLS0KIC4u
LnBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoIHwgNjcgKysr
KysrKysrKysrKysrKysrKysrKwogLi4ucGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBh
dGliaWxpdHkucGF0Y2ggfCA2NyArKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDEzNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9hcmQvYmVh
Z2xleS1haS9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVt
b3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2FyZC9iZWFnbGVib2Fy
ZC9iZWFnbGV5LWFpL3BhdGNoZXMvdGktazMtcjUtbG9hZGVyLzAwMDEtcHlsaWJmZHQtUmVwbGFj
ZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmVhMTlkNWM4NTE1MQotLS0gL2Rldi9udWxsCisr
KyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZXktYWkvcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIv
MDAwMS1weWxpYmZkdC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5
LnBhdGNoCkBAIC0wLDAgKzEsNjcgQEAKK0Zyb20gNTI3MTE1ZWY2NzgzY2VjNDllNTYxMGM1MjNj
MTI0YjM5OTAxMTM2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEphaXBhdWwgQ2hl
ZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+CitEYXRlOiBUdWUsIDExIEF1ZyAyMDI2
IDE1OjM0OjMzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIHB5bGliZmR0OiBSZXBsYWNlIHJlbW92
ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcworTUlNRS1WZXJzaW9uOiAxLjAK
K0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zl
ci1FbmNvZGluZzogOGJpdAorCitTV0lHIDQuNS4wIHJlbW92ZWQgUHl0aG9uIDIgY29tcGF0aWJp
bGl0eSBtYWNyb3MgKFB5SW50XyosIFB5U3RyaW5nXyopCitmcm9tIGl0cyBydW50aW1lIGhlYWRl
ciBweWhlYWQuc3dnIChzZWUgY29tbWl0IDc5ZjdhMmI3Y2I3ZCkuIFJlcGxhY2UKK3RoZW0gd2l0
aCB0aGVpciBQeXRob24gMyBDIEFQSSBlcXVpdmFsZW50czoKKworLSBQeVN0cmluZ19Gcm9tU3Ry
aW5nIC0+IFB5VW5pY29kZV9Gcm9tU3RyaW5nCistIFB5U3RyaW5nX0FzU3RyaW5nIC0+IFB5Qnl0
ZXNfQXNTdHJpbmcKKy0gUHlJbnRfQXNMb25nIC0+IFB5TG9uZ19Bc0xvbmcKKworVGhlIHJlcGxh
Y2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0aGUgbWFjcm9zIHdlcmUgYWxyZWFkeSBhbGlhc2VkIHRv
Cit0aGVzZSBleGFjdCBmdW5jdGlvbnMgaW4gU1dJRydzIFB5dGhvbiAzIGNvZGUgcGF0aC4KKwor
VGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0YyBjb21taXQgNTAwOGQxZDZhMzU2ICgicHlsaWJmZHQ6
IFJlcGxhY2UKK3JlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyIpLgor
CitTaWduZWQtb2ZmLWJ5OiBKYWlwYXVsIENoZWVybmFtIDxqYWlwYXVsLmNoZWVybmFtQGVzdC50
ZWNoPgorUmV2aWV3ZWQtYnk6IErDqXLDqW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVy
aWJlc0Bib290bGluLmNvbT4KK1Rlc3RlZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxqZXJl
bWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9iaW5z
b24gPHBicm9iaW5zb25AZ21haWwuY29tPgorUmV2aWV3ZWQtYnk6IFBldGVyIFJvYmluc29uIDxw
YnJvYmluc29uQGdtYWlsLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdC51LWJvb3QtcHJvamVj
dC5vcmcvdS1ib290L3UtYm9vdC8tL2NvbW1pdC81MjcxMTVlZjY3ODNjZWM0OWU1NjEwYzUyM2Mx
MjRiMzk5MDExMzYxCitTaWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgor
LS0tCisgc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrLS0tCisg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAt
LWdpdCBhL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQgYi9zY3JpcHRzL2R0
Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkCitpbmRleCBlNDY1OTQ4OWE5NmFiLi4zMjZhMTVj
Nzk0MWUzIDEwMDY0NAorLS0tIGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBl
ZAorKysrIGIvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorQEAgLTEwMzMs
NyArMTAzMyw3IEBAIHR5cGVkZWYgdWludDMyX3QgZmR0MzJfdDsKKyAJUHlPYmplY3QgKmJ1ZmY7
CisgCisgCWlmICgkMSkgeworLQkJcmVzdWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKKysJ
CXJlc3VsdG9iaiA9IFB5VW5pY29kZV9Gcm9tU3RyaW5nKAorIAkJCWZkdF9zdHJpbmcoZmR0MSwg
ZmR0MzJfdG9fY3B1KCQxLT5uYW1lb2ZmKSkpOworIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21T
dHJpbmdBbmRTaXplKAorIAkJCShjb25zdCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgk
MS0+bGVuKSk7CitAQCAtMTA2NCwxMyArMTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMy
X3Q7CisgICAgICAgICB9CisgICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsK
KyAgICAgJSNlbHNlCistICAgICAgICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAg
LyogY2hhciAqc3RyICovCisrICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsg
ICAvKiBjaGFyICpzdHIgKi8KKyAgICAgJSNlbmRpZgorIH0KKyAKKyAvKiB0eXBlbWFwcyB1c2Vk
IGZvciBmZHRfbmV4dF9ub2RlKCkgKi8KKyAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAq
ZGVwdGggKGludCBkZXB0aCkgeworLSAgIGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1
dCk7CisrICAgZGVwdGggPSAoaW50KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7CisgICAgJDEgPSAm
ZGVwdGg7CisgfQorIAorCitiYXNlLWNvbW1pdDogMTI2MmU1MGEzNGEwZTAxZjk3NGU4ZDkwOWM1
YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9hcmQvYmVhZ2xlYm9h
cmQvYmVhZ2xleS1haS9wYXRjaGVzL3Vib290LzAwMDEtcHlsaWJmZHQtUmVwbGFjZS1yZW1vdmVk
LVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaCBiL2JvYXJkL2JlYWdsZWJvYXJkL2Jl
YWdsZXktYWkvcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0LVJlcGxhY2UtcmVtb3ZlZC1TV0lH
LVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwLi5lYTE5ZDVjODUxNTEKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC9iZWFn
bGVib2FyZC9iZWFnbGV5LWFpL3BhdGNoZXMvdWJvb3QvMDAwMS1weWxpYmZkdC1SZXBsYWNlLXJl
bW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoCkBAIC0wLDAgKzEsNjcgQEAK
K0Zyb20gNTI3MTE1ZWY2NzgzY2VjNDllNTYxMGM1MjNjMTI0YjM5OTAxMTM2MSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb206IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1A
ZXN0LnRlY2g+CitEYXRlOiBUdWUsIDExIEF1ZyAyMDI2IDE1OjM0OjMzICswMjAwCitTdWJqZWN0
OiBbUEFUQ0hdIHB5bGliZmR0OiBSZXBsYWNlIHJlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRp
YmlsaXR5IG1hY3JvcworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFp
bjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitTV0lH
IDQuNS4wIHJlbW92ZWQgUHl0aG9uIDIgY29tcGF0aWJpbGl0eSBtYWNyb3MgKFB5SW50XyosIFB5
U3RyaW5nXyopCitmcm9tIGl0cyBydW50aW1lIGhlYWRlciBweWhlYWQuc3dnIChzZWUgY29tbWl0
IDc5ZjdhMmI3Y2I3ZCkuIFJlcGxhY2UKK3RoZW0gd2l0aCB0aGVpciBQeXRob24gMyBDIEFQSSBl
cXVpdmFsZW50czoKKworLSBQeVN0cmluZ19Gcm9tU3RyaW5nIC0+IFB5VW5pY29kZV9Gcm9tU3Ry
aW5nCistIFB5U3RyaW5nX0FzU3RyaW5nIC0+IFB5Qnl0ZXNfQXNTdHJpbmcKKy0gUHlJbnRfQXNM
b25nIC0+IFB5TG9uZ19Bc0xvbmcKKworVGhlIHJlcGxhY2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0
aGUgbWFjcm9zIHdlcmUgYWxyZWFkeSBhbGlhc2VkIHRvCit0aGVzZSBleGFjdCBmdW5jdGlvbnMg
aW4gU1dJRydzIFB5dGhvbiAzIGNvZGUgcGF0aC4KKworVGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0
YyBjb21taXQgNTAwOGQxZDZhMzU2ICgicHlsaWJmZHQ6IFJlcGxhY2UKK3JlbW92ZWQgU1dJRyBQ
eXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcyIpLgorCitTaWduZWQtb2ZmLWJ5OiBKYWlwYXVs
IENoZWVybmFtIDxqYWlwYXVsLmNoZWVybmFtQGVzdC50ZWNoPgorUmV2aWV3ZWQtYnk6IErDqXLD
qW1pZSBEYXV0aGVyaWJlcyA8amVyZW1pZS5kYXV0aGVyaWJlc0Bib290bGluLmNvbT4KK1Rlc3Rl
ZC1ieTogSsOpcsOpbWllIERhdXRoZXJpYmVzIDxqZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4u
Y29tPgorU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29t
PgorUmV2aWV3ZWQtYnk6IFBldGVyIFJvYmluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT4KK1Vw
c3RyZWFtOiBodHRwczovL2dpdC51LWJvb3QtcHJvamVjdC5vcmcvdS1ib290L3UtYm9vdC8tL2Nv
bW1pdC81MjcxMTVlZjY3ODNjZWM0OWU1NjEwYzUyM2MxMjRiMzk5MDExMzYxCitTaWduZWQtb2Zm
LWJ5OiBCcnlhbiBCcmF0dGxvZiA8YmJAdGkuY29tPgorLS0tCisgc2NyaXB0cy9kdGMvcHlsaWJm
ZHQvbGliZmR0Lmlfc2hpcHBlZCB8IDYgKysrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKKworZGlmZiAtLWdpdCBhL3NjcmlwdHMvZHRjL3B5bGli
ZmR0L2xpYmZkdC5pX3NoaXBwZWQgYi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlw
cGVkCitpbmRleCBlNDY1OTQ4OWE5NmFiLi4zMjZhMTVjNzk0MWUzIDEwMDY0NAorLS0tIGEvc2Ny
aXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorKysrIGIvc2NyaXB0cy9kdGMvcHls
aWJmZHQvbGliZmR0Lmlfc2hpcHBlZAorQEAgLTEwMzMsNyArMTAzMyw3IEBAIHR5cGVkZWYgdWlu
dDMyX3QgZmR0MzJfdDsKKyAJUHlPYmplY3QgKmJ1ZmY7CisgCisgCWlmICgkMSkgeworLQkJcmVz
dWx0b2JqID0gUHlTdHJpbmdfRnJvbVN0cmluZygKKysJCXJlc3VsdG9iaiA9IFB5VW5pY29kZV9G
cm9tU3RyaW5nKAorIAkJCWZkdF9zdHJpbmcoZmR0MSwgZmR0MzJfdG9fY3B1KCQxLT5uYW1lb2Zm
KSkpOworIAkJYnVmZiA9IFB5Qnl0ZUFycmF5X0Zyb21TdHJpbmdBbmRTaXplKAorIAkJCShjb25z
dCBjaGFyICopKCQxICsgMSksIGZkdDMyX3RvX2NwdSgkMS0+bGVuKSk7CitAQCAtMTA2NCwxMyAr
MTA2NCwxMyBAQCB0eXBlZGVmIHVpbnQzMl90IGZkdDMyX3Q7CisgICAgICAgICB9CisgICAgICAg
ICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsKKyAgICAgJSNlbHNlCistICAgICAgICAk
MSA9IFB5U3RyaW5nX0FzU3RyaW5nKCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCisrICAgICAg
ICAkMSA9IFB5Qnl0ZXNfQXNTdHJpbmcoJGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKyAgICAg
JSNlbmRpZgorIH0KKyAKKyAvKiB0eXBlbWFwcyB1c2VkIGZvciBmZHRfbmV4dF9ub2RlKCkgKi8K
KyAldHlwZW1hcChpbiwgbnVtaW5wdXRzPTEpIGludCAqZGVwdGggKGludCBkZXB0aCkgeworLSAg
IGRlcHRoID0gKGludCkgUHlJbnRfQXNMb25nKCRpbnB1dCk7CisrICAgZGVwdGggPSAoaW50KSBQ
eUxvbmdfQXNMb25nKCRpbnB1dCk7CisgICAgJDEgPSAmZGVwdGg7CisgfQorIAorCitiYXNlLWNv
bW1pdDogMTI2MmU1MGEzNGEwZTAxZjk3NGU4ZDkwOWM1YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1
LjAKKwoKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
