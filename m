Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4994606A329
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pfVB1mec
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92BAD81112;
	Mon, 16 Nov 2026 17:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a1j5VjGT5tyf; Mon, 16 Nov 2026 17:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7025981161
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794850982;
	b=RVPJB9AuPLBFbgkrafkzlc3GAk7Kll2+H0lnEpfTJnQw0ptF9Qtu1JECcjAEjb6Pk3Sb
	 aa11NzbuD6nuhtOQzRwwu3BK+23ni4YAvY+3/bl27ok5pNe+90WXJEogyJEPKoDDb3b0h
	 t+rfd5uipBERssnvNj+xfsjrSa5wU8KrSnsG7Bh3RtgSzCei1pzGDmm1tADMeqhq5gE6v
	 mK3WzKlO65DwC8RPgXGiJlxvgHr+cQfJEyJrrYIIqL4gRPmi4XoCOgf9Y9RgiAKDn4KEt
	 IwlROP3MxdzHG2I4Vh6Smt0CC5IlCFo1+mp/Qt0n79S/lv33pc1NJXMjT4+0lNH4D2w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794850982;
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
	bh=B5VztoKxLOwcQdtYbzo5f7+nOBaSRMWBU69kSEVg3Ek=;
	b=DoOCtCwWyfdPfYjBNhx53fbbvAY8D3fO0SOdoIvTl7vz3p8hQffd/d7B0v1zgM6ZCEWb
	 4P6bhbthDryJOHUhgZLYmkoz6pFo5s2YJSugaITcJ19AevPE7jwU1RTcNJhXXisk+3TzS
	 U9wR2me+o7P01ocGjBz3xFseQjdQcAQHZjs31RTsODKEkcSrjuvj39CpNNqUZy+UhZm9Z
	 HjW1oU0lPOwmxLMe8GbJOffVmo2NYjKRNWB9ZCPB8QYBZzAP+npfmQZwMjqiEduoaf6Ny
	 rc0Sou8SziC2RFgXAvZupR+0/XyeVxz2Dcrmv4fdpf8XV+9uRydL6XR/djDW09s0OEg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794850982;
	bh=B5VztoKxLOwcQdtYbzo5f7+nOBaSRMWBU69kSEVg3Ek=;
	h=Date:References:In-Reply-To:To:CC:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pfVB1mecvtDpEiRcC8MI6/27qWA38uiqdJLZczC3TkNeCMQIDYYhEeHWOs134OmfH
	 tC9ZUOPIPDkccMUPvkEBSFWLDRsb723KRblutUFHPl1Y9GnEvfD3VHGGWw3/cno5X2
	 jwLUBmMNHSidDgjnCLcmKIHq9kQccmFhehu00eKq7CVcMU+Ah3x09kUzfs3Z7WyoQs
	 st3tFAPWtW1YlDZ5I2goyX6QUCiiPU8ZN2J6xJ32rOg9i5ba14Fsm79+3SZ8qhGocu
	 G7SL9Q2ZeZ7O2CL5wwSXGRJP1QtfN6shVLCjQnbcRZsNIB1yeZZkdH5iqUs9NqNwej
	 IgjmLKs9n9bdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7025981161;
	Mon, 16 Nov 2026 17:43:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B970169
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 113D540830
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbskCeI-zh5N for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 17:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 325E04081C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.154.28;
 helo=mx0b-0002e601.pphosted.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com
 [148.163.154.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 325E04081C
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 17:42:58 +0000 (UTC)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
 by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AGGIZCL2118908; Mon, 16 Nov 2026 11:42:57 -0600
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013014.outbound.protection.outlook.com
 [40.93.201.14])
 by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hys3uct7p-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2026 11:42:57 -0600 (CST)
Received: from MW4PR03CA0068.namprd03.prod.outlook.com (2603:10b6:303:b6::13)
 by CH3PR10MB7778.namprd10.prod.outlook.com (2603:10b6:610:1b8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 16 Nov
 2026 17:41:42 +0000
Received: from MWH0EPF000C6191.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::61) by MW4PR03CA0068.outlook.office365.com
 (2603:10b6:303:b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 17:41:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6191.mail.protection.outlook.com (10.167.249.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 17:41:40 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:40:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 11:40:46 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.75.137])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AGHekBu1219702;
 Mon, 16 Nov 2026 11:40:46 -0600
Date: Mon, 16 Nov 2026 11:40:45 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <20261116-beagle-uboot-fixes-v1-2-834206d9b47a@ti.com>
References: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
In-Reply-To: <20261116-beagle-uboot-fixes-v1-0-834206d9b47a@ti.com>
To: <buildroot@buildroot.org>
CC: Romain Naour <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.15.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6191:EE_|CH3PR10MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 038e8ae6-a44b-460f-c3a7-08df4408df8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261022105027099003|56012099006|261021135927099003|261026140227099003|261009223027099003|261009221227099003|261021123027099003|261022115727099003|261021121427099003|261022075727099003|261028144727099003|22082099003|18002099003|6133799003|10067099003|13003099007;
X-Microsoft-Antispam-Message-Info: RlBH0Z9few2mXKsGcql6SDhAozrbUgzXPNsxKQFIbna1NwaKglHcvpgPEly59S6p9F07JX2/cQ5UKFQnjh49whlNyDFRFvOQnJJecbz/plUvC8hbUbFAfgkOi0B4tD+ocgcl9+U++vTXZN2YnhOUp0RtMxgYL5bfw3PYAMhg7fKjebZeRvGEN77aw7qeyEDkuxLi2HfCj1kkgtZsGCQkSEiPPCdve8u0/9x7CpuH2T/09hFG6jLo8Qlevw4ha1mOpZtPOxzul6kp93qOyre33BlmPaVlsnhNqDumq9CN8T0QUUMQxSniDAuwlI0x5D4o/SJCA2mEXyCA/aQ5egaRgCq8Pt9fOlq38H4xWZrQ+PsxCryvNKPo+O5iIPzVoCZJpWCRzB6bNpUNo4b3OKNNkxbhdZOA3vtwG3BUyn8E8bWxpb22vC9LNEC38vD9Wg1urqd6QYUQo6tOY5ks019RP3difj2IMX2Ue8VLw52FLYLEfWL7BY2AtYFbSr7o+/vFnG/CaFjG2Ll+uBfGLPVKu4dAytPkxNvSBNf2lRuAaprhHpGwmpmukcN89xdCIVCncbqnqEGci1SiUtWYmeBpFrOpIy3u4gEvkY92yDSxTl/6BUwBChz/CQ2YSXw/3dCqw0y1QrKM+UYBRTzTY9Qi6A==
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261022105027099003)(56012099006)(261021135927099003)(261026140227099003)(261009223027099003)(261009221227099003)(261021123027099003)(261022115727099003)(261021121427099003)(261022075727099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(10067099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +nt9gF4+4mS3Oa0WFEozRmN8+ciZH8KUJ4fFLOnDiq7vhStgdcy8D5aamX4SYyeTQN0+IxHtmT0S33elWul5rjWiN4nJ+oFH5wV8v3R3B7civR+XPw2hBwr0zQhNy3qL1DdN/CvAc0AelKErXGDzUdouIllKHao8UxZt76GKFAAut3/atELoP0F6MFqg5YhPI2UVpgl9+guH9/PX8cvgpOUKJTONKavjB+ydbr3XYJ0CA14Yx+Mneg2n2sSGriVPv9eOOOrjk/oUxt+HyCzvgDmttELlJfjIip94+O73/iH+LEwxBIOOjF2RuCyIITlL9lOEAqgdVNc3IWqljskjeRz/JkjBLOZGIlSEZVnsYFauGE/GC3wEyQzMTymCaXHUm3l5pb8PTppEAg0ekzeqJW2cf1OgqB6VAvaObpdWpccBz8qpZroLEyWZNy86EPmf
X-Exchange-RoutingPolicyChecked: H+mm0CBZ4WA85VwG9pdIW6RdhR4Mjgj4/YkJwJsXIDYFir80J9NLWEYdMfGeX4QVurZLqetYbj7QQ5+Hm9TntqHTn4L1ldQdwz9lWNL0YGEkIrfZCZu3vXSE4NqrTOwQvs7G45SFz8uP8Po6nfwXo60j11DdvR/+Rr7PB4ro6QNjfFYGjdkiEi6NgyL0upp6ABzIlcuHZw2E1OMp5SVuUkYofJIVuV/khoO2lqMNRAjAYR2DUonnaY3bsBnsvTduK7fbI0Mjp/TNUaW+jbPw2fSUYP9Sz62teYb+q4rJ1Lw/QXJZ+9+VzyUGggdrnQvnAp4SQrO8FHuOC3fz628RSw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:41:40.9665 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 038e8ae6-a44b-460f-c3a7-08df4408df8d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6191.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7778
X-Authority-Analysis: v=2.4 cv=etZKXYpX c=1 sm=1 tr=0 ts=6afb40a1 cx=c_pps
 a=U8Tqu/vdlUTsaY0Seu/jpg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=1VxDqnHFAAAA:8 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8
 a=pGLkceISAAAA:8 a=hJ0Dl-Dv0KfEKoe4cDQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=aZ5uHUMKh6B-zo3GvD48:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfXyzxrRa70RgvU
 vGdXzSktYl9PLXwx/vXohTKjEyUgk2ECE72nlUQbVfI3TnzFt5XuTg1DW6upp6EqvUhwmwtVVkO
 spx+v3WfuRnHthwqJiAmDnIBlyR5rprczl+ZOWb8ytPoY+qZMGRtoe9Laj9UMsazXRxU8IAsHqm
 hML2pd6w+iBORqUcYBidd9qm0AgOg7LkAVVnKkzRyXQzBmHDoY81/oNPVquLGvy/hd1oTz+bDjs
 yPUAnxdWdHePs7DIuN3whU3BH2bsChEziU70lHkUZT9F39i7IcFzzeGPbLHkRyprNpBdGDnfOrI
 Z9VlDhOpomN1kSQDxSYu2F08uJtNUN9Sq8dmglfxXssD2ksjsBcxV/mMvnHTGop4Wg7aohJJJd1
 ATNuRPf+ttpjnyNWWR5Dsr17soqkRZvEEzdKyTnY45NNLATxG7vLJyCoUKfTJ9Xiwz374/gtLG6
 LOhwwjEUEatMpibLx0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MCBTYWx0ZWRfXzwBIBiR2EkIu
 0tg01kR7ODlUOoqeIvp5O1mua5Ht4WcvaLI/kFZQzJbVmMx9gSFpxICFFZuiHSQxKaAVFseI7U7
 HTJsR9s4Dw5DJpyBMnUOYVi9iLvcz+s=
X-Proofpoint-ORIG-GUID: kO1_pSfqjKHcADrWkBP8DxDL7BKfcb8m
X-Proofpoint-GUID: kO1_pSfqjKHcADrWkBP8DxDL7BKfcb8m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160070
Subject: [Buildroot] [PATCH 2/2] board/beagleboard/beagleboneai64: backport
 swig compatibility fix
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
Z2xlYm9uZWFpNjQvcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvMDAwMS1weWxpYmZkdC1SZXBsYWNl
LXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoIGIvYm9hcmQvYmVhZ2xl
Ym9hcmQvYmVhZ2xlYm9uZWFpNjQvcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvMDAwMS1weWxpYmZk
dC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1jb21wYXRpYmlsaXR5LnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZWExOWQ1Yzg1MTUxCi0tLSAvZGV2
L251bGwKKysrIGIvYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvcGF0Y2hlcy90aS1r
My1yNS1sb2FkZXIvMDAwMS1weWxpYmZkdC1SZXBsYWNlLXJlbW92ZWQtU1dJRy1QeXRob24tMi1j
b21wYXRpYmlsaXR5LnBhdGNoCkBAIC0wLDAgKzEsNjcgQEAKK0Zyb20gNTI3MTE1ZWY2NzgzY2Vj
NDllNTYxMGM1MjNjMTI0YjM5OTAxMTM2MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206
IEphaXBhdWwgQ2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+CitEYXRlOiBUdWUs
IDExIEF1ZyAyMDI2IDE1OjM0OjMzICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIHB5bGliZmR0OiBS
ZXBsYWNlIHJlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5IG1hY3JvcworTUlNRS1W
ZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitTV0lHIDQuNS4wIHJlbW92ZWQgUHl0aG9u
IDIgY29tcGF0aWJpbGl0eSBtYWNyb3MgKFB5SW50XyosIFB5U3RyaW5nXyopCitmcm9tIGl0cyBy
dW50aW1lIGhlYWRlciBweWhlYWQuc3dnIChzZWUgY29tbWl0IDc5ZjdhMmI3Y2I3ZCkuIFJlcGxh
Y2UKK3RoZW0gd2l0aCB0aGVpciBQeXRob24gMyBDIEFQSSBlcXVpdmFsZW50czoKKworLSBQeVN0
cmluZ19Gcm9tU3RyaW5nIC0+IFB5VW5pY29kZV9Gcm9tU3RyaW5nCistIFB5U3RyaW5nX0FzU3Ry
aW5nIC0+IFB5Qnl0ZXNfQXNTdHJpbmcKKy0gUHlJbnRfQXNMb25nIC0+IFB5TG9uZ19Bc0xvbmcK
KworVGhlIHJlcGxhY2VtZW50cyBhcmUgc2FmZSBzaW5jZSB0aGUgbWFjcm9zIHdlcmUgYWxyZWFk
eSBhbGlhc2VkIHRvCit0aGVzZSBleGFjdCBmdW5jdGlvbnMgaW4gU1dJRydzIFB5dGhvbiAzIGNv
ZGUgcGF0aC4KKworVGhpcyBpcyBhIGJhY2twb3J0IG9mIGR0YyBjb21taXQgNTAwOGQxZDZhMzU2
ICgicHlsaWJmZHQ6IFJlcGxhY2UKK3JlbW92ZWQgU1dJRyBQeXRob24gMiBjb21wYXRpYmlsaXR5
IG1hY3JvcyIpLgorCitTaWduZWQtb2ZmLWJ5OiBKYWlwYXVsIENoZWVybmFtIDxqYWlwYXVsLmNo
ZWVybmFtQGVzdC50ZWNoPgorUmV2aWV3ZWQtYnk6IErDqXLDqW1pZSBEYXV0aGVyaWJlcyA8amVy
ZW1pZS5kYXV0aGVyaWJlc0Bib290bGluLmNvbT4KK1Rlc3RlZC1ieTogSsOpcsOpbWllIERhdXRo
ZXJpYmVzIDxqZXJlbWllLmRhdXRoZXJpYmVzQGJvb3RsaW4uY29tPgorU2lnbmVkLW9mZi1ieTog
UGV0ZXIgUm9iaW5zb24gPHBicm9iaW5zb25AZ21haWwuY29tPgorUmV2aWV3ZWQtYnk6IFBldGVy
IFJvYmluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdC51
LWJvb3QtcHJvamVjdC5vcmcvdS1ib290L3UtYm9vdC8tL2NvbW1pdC81MjcxMTVlZjY3ODNjZWM0
OWU1NjEwYzUyM2MxMjRiMzk5MDExMzYxCitTaWduZWQtb2ZmLWJ5OiBCcnlhbiBCcmF0dGxvZiA8
YmJAdGkuY29tPgorLS0tCisgc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBlZCB8
IDYgKysrLS0tCisgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKKworZGlmZiAtLWdpdCBhL3NjcmlwdHMvZHRjL3B5bGliZmR0L2xpYmZkdC5pX3NoaXBwZWQg
Yi9zY3JpcHRzL2R0Yy9weWxpYmZkdC9saWJmZHQuaV9zaGlwcGVkCitpbmRleCBlNDY1OTQ4OWE5
NmFiLi4zMjZhMTVjNzk0MWUzIDEwMDY0NAorLS0tIGEvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGli
ZmR0Lmlfc2hpcHBlZAorKysrIGIvc2NyaXB0cy9kdGMvcHlsaWJmZHQvbGliZmR0Lmlfc2hpcHBl
ZAorQEAgLTEwMzMsNyArMTAzMyw3IEBAIHR5cGVkZWYgdWludDMyX3QgZmR0MzJfdDsKKyAJUHlP
YmplY3QgKmJ1ZmY7CisgCisgCWlmICgkMSkgeworLQkJcmVzdWx0b2JqID0gUHlTdHJpbmdfRnJv
bVN0cmluZygKKysJCXJlc3VsdG9iaiA9IFB5VW5pY29kZV9Gcm9tU3RyaW5nKAorIAkJCWZkdF9z
dHJpbmcoZmR0MSwgZmR0MzJfdG9fY3B1KCQxLT5uYW1lb2ZmKSkpOworIAkJYnVmZiA9IFB5Qnl0
ZUFycmF5X0Zyb21TdHJpbmdBbmRTaXplKAorIAkJCShjb25zdCBjaGFyICopKCQxICsgMSksIGZk
dDMyX3RvX2NwdSgkMS0+bGVuKSk7CitAQCAtMTA2NCwxMyArMTA2NCwxMyBAQCB0eXBlZGVmIHVp
bnQzMl90IGZkdDMyX3Q7CisgICAgICAgICB9CisgICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJp
bmcoJGlucHV0KTsKKyAgICAgJSNlbHNlCistICAgICAgICAkMSA9IFB5U3RyaW5nX0FzU3RyaW5n
KCRpbnB1dCk7ICAgLyogY2hhciAqc3RyICovCisrICAgICAgICAkMSA9IFB5Qnl0ZXNfQXNTdHJp
bmcoJGlucHV0KTsgICAvKiBjaGFyICpzdHIgKi8KKyAgICAgJSNlbmRpZgorIH0KKyAKKyAvKiB0
eXBlbWFwcyB1c2VkIGZvciBmZHRfbmV4dF9ub2RlKCkgKi8KKyAldHlwZW1hcChpbiwgbnVtaW5w
dXRzPTEpIGludCAqZGVwdGggKGludCBkZXB0aCkgeworLSAgIGRlcHRoID0gKGludCkgUHlJbnRf
QXNMb25nKCRpbnB1dCk7CisrICAgZGVwdGggPSAoaW50KSBQeUxvbmdfQXNMb25nKCRpbnB1dCk7
CisgICAgJDEgPSAmZGVwdGg7CisgfQorIAorCitiYXNlLWNvbW1pdDogMTI2MmU1MGEzNGEwZTAx
Zjk3NGU4ZDkwOWM1YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1LjAKKwpkaWZmIC0tZ2l0IGEvYm9h
cmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvcGF0Y2hlcy91Ym9vdC8wMDAxLXB5bGliZmR0
LVJlcGxhY2UtcmVtb3ZlZC1TV0lHLVB5dGhvbi0yLWNvbXBhdGliaWxpdHkucGF0Y2ggYi9ib2Fy
ZC9iZWFnbGVib2FyZC9iZWFnbGVib25lYWk2NC9wYXRjaGVzL3Vib290LzAwMDEtcHlsaWJmZHQt
UmVwbGFjZS1yZW1vdmVkLVNXSUctUHl0aG9uLTItY29tcGF0aWJpbGl0eS5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmVhMTlkNWM4NTE1MQotLS0gL2Rldi9u
dWxsCisrKyBiL2JvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3BhdGNoZXMvdWJvb3Qv
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
YjI1NWY4ZmE3MTk5ZQorLS0gCisyLjU1LjAKKwoKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
