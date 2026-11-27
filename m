Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7FA606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n0dWr37f;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=N2UuqYSh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189A9607BC;
	Fri, 27 Nov 2026 15:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YewE-IqjtvWT; Fri, 27 Nov 2026 15:16:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2A78260619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792560;
	b=C8t5izcSK6A0qxp6NaSorA4JWrRHdE81qv3P/f6qMYZsEBj9aDRHtS4rssizo0+EK9R0
	 AGvjiGpOA6M0KRv8kyHHOFEvk0ws+7sUuXdVbbapeFPpLw+Gj7h+A+9fk9lafUqVZCeQI
	 HOuL0gwRX5ofF1towFFIYmD20oVfC2H234umw8Ixm8TgE1pZcu0VWX8KSqZZ2Wi8mjuJE
	 6SVi37cmfhJfk3cFehKyXSUns3HJUG+T/77aXlgt9/5pTc8yQ1ue/3kiFu9ogidCmnqec
	 2tgqgzTdyzKQzec9q1QsPLKcLLHmaSmVm2yAHOfyH/+uXs8NhqXols9kx15AC3c44mQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792560;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pRJKDqglQ4dDY1W9FXCWL38XNAQWjqGZhfQ1tMRVbAs=;
	b=cas8PghUXv/1DnJy7MMhEbIa1tjMA5HfAVcKbtK0HUdMCQLyCIYCud45hdLtGsr4p40D
	 oMGxYR9gjfGY1q9CmJhlmJlSe7SG9ERzuL42iVpcTdISLEiHxcZmoTQm5lfsCfajfvG07
	 O1je1KCQ57TjFh3BeZi+r9OGYwK9pU7X200qgvkMyezCmKtatCvrhkHtr3/U1/Fpimvc4
	 LsTsHOlJTvjCIfm+T6ijqypcTqERheg1gx6EQnEw/KWdtKDrlOsccPN2mY6PG2r1sAZgs
	 YVnYvsaDZW8eXNmu2OcGBw7SDQhHSyfvJHn69UHKmEqspezh5fTpG+xxZOFSt74kf2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792560;
	bh=pRJKDqglQ4dDY1W9FXCWL38XNAQWjqGZhfQ1tMRVbAs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0dWr37fncLfy3PcE9owjiC/MBENcuxjssF4XpKjAzQ0AhCjBgmiDF4OvWp2Vq7P0
	 WquSCVpf54WjAmZTx+JqNoMF0qSfbqre8F+tC6+5+QYsYwAuxWXT3m26z/0rfsPIH7
	 3B7s5Gt7fTxJ7WQ9Bc7kv6bp9vdxfONRuTrRPT4eZ72CFeMIRfLs+77mx0rIyoacMK
	 jaLY6nhlAumoYIldfjEN4TaYUM2ayzNO05J5sC3NPGSXbQjea7kaGz4N8Q4h+eZ0a4
	 Agn+h0uECcGm9GNDGbc2+hRYs4LyiWF7SGIMHN26om/eR5dfPdew2+UWQNArLg0YmQ
	 h9DNIbGkvg0Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A78260619;
	Fri, 27 Nov 2026 15:16:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EEF3373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 111C140012
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWA00Qy157sf for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:15:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F344A4056F
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=N2UuqYSh
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F344A4056F
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJ47BsxKfTv64PzJvzQVAizW+8ndhIkI0OD+CWDQhEg=;
 b=N2UuqYShS7hJiqX2wmwIazRAb03gCEAzagNHQt8O85ONR0oUTkqV51xpYBApzSEsXLNpWfVWIQgSFa74v3nqlZ9E/G91fhq7YSkpqr49pqjvx6b/DeSRRobmnqGn1AevTdT6EFwQpYJUvKd01HMOJJGI/BqZysOU19orGBbyOSXhz7LDCHrD0W3eZjVa/quVfUAeNcesT/zYBhk2xheyeC9AZrHVpvzfHkRBem2hJ1sLQWetfMvEKba3PCiF04PsCJ2fAJrdySDg0JX1/BejOm9QReeGh5QvtTaomX1aU+b4ymoRVjigok2eoTEjKcls0jSlSomF8NR3EJdMaURzyg==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:48 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:48 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:04 +0800
Message-ID: <MEUP300MB0045F8AA7EC71ADB1BAB11A3B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=tfx2001@outlook.com;
 h=from:subject; bh=gw0qxK95Sa62sksGJZfEXIAeXXeWVgMajftPgEHMCdQ=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ46nwSGO8nNiV2pbe8TVWTx+xIqPCln3X7sb
 FKvaafAWweJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeOgAKCRAcD62l0/wL
 2imMD/9U5xA64+hqUFzaRN/lJAtjFlrOXZwetWunR/RbyQDYzgJ5CvapU+JUq4h8KmUdE3iL6yG
 LlCuYcXhWs7UnwFLdSQMaYZdmhSSjkwJh7UyhH9591rky358vZgCJuiK/d1+RRMXxBwbexzd5dF
 OcRVQuawdb21O1blGICym5pkw6v4Kx/wn4YWrd6eDaRpwz8z8WKAntN8oePZEwPvt/4uNA4uMkl
 82M93TG+wNr0vMC+HQxTN7rKuChyiNaCb4sdR8m3y1BNoYlS9me6wreXVNxZDJvzYBJ7w6vmCDg
 J87J0lF17lQsttdZk6gEF86e7Le0bhqafsNmjJWxax38ZQAhhgpbplnSSEzjfV9/Oh8jopu61mC
 arfRBGEsxNpELyKND0zngLVYnfUL/9FKXOzNz9ybCFaIqKe9KNTTHhiRRUXTdJMAnTMc0BJoevx
 echFRf/f85WxWp7jRFklK4m5+KPslNauneprVGMI8ZquAAbKLSKqgvaVuEKnKDyO8bGNsrNw7O1
 yLmebPqHrRtJOLVaEdGE4apI1/9xmVaSbIzgw/pZupT+xbzsyuT7YNM+QlS8x+DD4If1i44gw3j
 JDOWoAZXsBjw97GgsmJ24OzysCfeCELIZYRiqsCLySl9YoikJbYUB3iUbt0rl60vYFwrTSMHtdK
 2YyMtDD/eW05WiA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-18-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd7afa8-5d7d-47b2-e445-08df4c995104
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzgxTlZNSnpObHBEWTRIck1SbG9KdzkxL3YxUzEwZXFuT1dZQk03b2hpYkx1?=
 =?utf-8?B?Lzk2N3Y3NlM2YVR1aG5JMDJwWTlMbEdHQUp4ZjYwMUovK0ZrbUxhbWZ2MmRH?=
 =?utf-8?B?bGtUL0RtS2VzTmR3VzMvZ1hnT3FQTVZxU25Od3V2N013ayswV0pBZk04V3h0?=
 =?utf-8?B?NjB2Ti9HcVpuVFIxNFh6b05OamdqOWJ1bVF5RUs0YytxdTdNOHl1NnpHS2tR?=
 =?utf-8?B?Tkd3NlpjY01ZQVNvZ1R2UmxIU1lLbStRRlRibkpHdCtXMUdiRDVsN1ZuREpP?=
 =?utf-8?B?TVdJZGh0d21oZ2krL2xBMUJ4bURGcktrWVhuV2hjUzRwMGVqai8zTDM2OU12?=
 =?utf-8?B?SDNvL0tKZ09ZczZrdWpHUXVGbU0wSWFHYWlBNW9zc0hYVUw4bFl1bFBNcmhr?=
 =?utf-8?B?eDcwc1lLK0VLS2l2N1lGRnNNKzBYNzhoWjBNcnpmbjRhMmdDSUpiUUdjMzNm?=
 =?utf-8?B?dkhXMW1Dekl0dUw4cTBPMlpGdEovSHJnUVZDT2k5NmVOZlh6NVZRS2JjZm0r?=
 =?utf-8?B?RGY1bEpLOWt0UmN5Q0JVdzlueGhQUDdnS3FERElFZk1kSFhFaFlQTnFuKzYv?=
 =?utf-8?B?MGs2UXZZZDFuTzc4QzQzSlRMTGI5WERGSWRxdXVrc2pYNm5WcWF5MmNaNjV0?=
 =?utf-8?B?UTJNbjNrRlNFS1Jyck9kQnZ2RnpVYWxybXpWSmtpbGM2cjI1a09RLzZmWC9L?=
 =?utf-8?B?QkZNUEI4Y29DWjloQ2M5SlJoL3ArUkpnNll3djdxRGI3UXNVMk1jU2ZzNVJ6?=
 =?utf-8?B?ejdNU1RjYkdvd1VLNnlCK0dYcm9PZkhuaUF1Rm5mSlpHMmdqZVNPUmNENmxZ?=
 =?utf-8?B?d00xWFE5NVF0cjd0Q29JU3F5aEhoK0pwYldta3VvemJxN3pIMW9kd1ZuWUpX?=
 =?utf-8?B?aUd5WWtzQVhnd3lSekJMUUV5WTFnYm13OGZ5VlNUeHJtTFJsTkhCVFkzb0l4?=
 =?utf-8?B?NTJJemlyc0FYMnY0amwzSVVMU3RDTFhENEx1dFFpaHlZN0drNUZxU3lBZERz?=
 =?utf-8?B?R0VHK055N1I1REY0RlkwVjZWN0w2eXNkbm1yZk93NE1XWWg1akFCR0xnaFVL?=
 =?utf-8?B?elFiOWJzdW5CSDBJajRCbElVSFZCUzYxdGhJa0FnUGdGYVNDaUpHKzFpUkk1?=
 =?utf-8?B?emtxL2VIN3Y3YWpZNzJrbGpWSUsvUmpuMHlXcmVCRWlWbUNERE5mV0o3bE9H?=
 =?utf-8?B?aEtEa3lkY1VNUHpFWEdEaUVQaFlVSzN3ZDRVeTdQMmZqNzIvc2J5dWtrRUc4?=
 =?utf-8?B?MUE4TWJxdzdoTHNOaXQ2cmU4V05VcUdDQWNTZ2RTdVFjNG1ZNVkxT2ZsZms0?=
 =?utf-8?B?cUFMaVh6Wi90NG95T1N0RzFhSno2VmNrOUt5Z3pST0ovWWpwb2pWZUJRQ3c4?=
 =?utf-8?B?c0t4V0NmRnRPaXFzcU04T3RoT2dDakVJSXRpS29mMmw5eHV1UWFRL2g2TVo5?=
 =?utf-8?Q?mF/ijutD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhDTFJPazllWG9SeVR4SmlxRGJVeXI2RTRlUmJmK2VXVG14MEoyMXE3cllG?=
 =?utf-8?B?dEVZcUJKK2Vsb1YzN0t4aXJBVlcyTjM4cmc1ZU4wdVZ2UzhFYWtRTnViMVdV?=
 =?utf-8?B?L2M3YlhGdG1UR1YzM2ZUUEkrTEE4NldFMWdsZDNDTHZncnlBMHBIL0tON0lZ?=
 =?utf-8?B?SU1JY0ozZHJ0dUdoK1hEaVUySGRNWXFYeDVBQ05pZWk1M3hrTWZpcjAzTjhQ?=
 =?utf-8?B?eEsyWlZZYkYwOVhHbDhmSk9Fb3p1M1dnR09aL2NCU3RZaFpQazFJb3BhWXBL?=
 =?utf-8?B?SER5a0toUDFRV2ppWDcwNDF4WTZHUGFRRnB0amJJcUlKZkdJTldKU09yWVdx?=
 =?utf-8?B?cVFVTEhCRExGVmZGZGE1TENQTlNpYUtRc1R6OWlJR0hjb2RSem9RbHdDS2tu?=
 =?utf-8?B?SitUS1lrMkFFb2puTUVmTU16ZFR5eXoyc1Vpb1liSDRyY2VzZjdPTDZXdGhM?=
 =?utf-8?B?eXhBbVUyRlZlYlMwa2xHekJkbjNnRWMrWE1UbzF5Z200VkcyVGJTQ3gxY1Yr?=
 =?utf-8?B?Y0s0OHJFTmhxOTJ0U0QvQldqUE5EK1dsMXJVRjc5MUhCNlNBMVJheGxwTWZp?=
 =?utf-8?B?ZkpsKytkTUZTRUtBSDRmTU9iK09zeDZwc0VEY1hNN1FWZ1JmTHoxMlZMMVUz?=
 =?utf-8?B?N0FwRVpXckpIeDdkVjRPK0tMd3dURHE2RFJBVTVQUEtRSkI0c3M5ZmlxUHJS?=
 =?utf-8?B?dkY3WUpWSUhxeExMVW1TYkFoaEQ2ekZRU0xBZGJwVzBwbDRuSmVWZ0JWbTVL?=
 =?utf-8?B?dDRkUnVxS2FCK3RnYktkSThRWk1DeXRTMGRpVzBkU3VCdTU0bEtxZU9UbElE?=
 =?utf-8?B?RC9iVDJFWnovUHpMQ0NhRStaTG56V1R5S3EyTkRWMGcyQXVhSTM1anBvL1lY?=
 =?utf-8?B?WVFWTFhhd1lWYXJMQzRWank5cjVKUTd0NktUTEs2d1dDazZ2TERvS05mT0Zr?=
 =?utf-8?B?aURLRE0wc2d5bWREOW5qMUdHYWxVTFZaZHJsMzJTb1NDMVkwOFZWYnhXTllp?=
 =?utf-8?B?NEtyR3FjRGlLMkR0SkJMY0d4dE9MVlE1dXJ3aFRtRENoaW92em9iZzVuT1Ux?=
 =?utf-8?B?dEJPeWt4U3EyVCthT2d4ZWkrQXlxVDdCWjlpSEVWaStVWHQza2NPZjBUWlYz?=
 =?utf-8?B?bldBQjJ4bFFSV05OcUxrRlFnZDB4WkF0MEdySWw2bDRZTTUxWWNtcFlNd0Uw?=
 =?utf-8?B?VzRnMlBla25PbFpGQUV0dnQ4Nk40TEdQQTFMcmhjRG5zN0Y0T0lwNEhJdTdG?=
 =?utf-8?B?ODBEdW50VXBmZGltY0g4STV5QkwvOGVMci9PQ2o0K25NUlpGc21zUUF2OHg0?=
 =?utf-8?B?MHVuQXAzVFFSKzJvekxrRzBvaElHMlZOYzNRVHZIZlhjbldmTk1MKzdENlFm?=
 =?utf-8?B?bk1oT2hvK08xVXhUOHdTZEpvQ1VXcDVrdEc3SnpaS0hvaklkMHQxdzY0MXR6?=
 =?utf-8?B?MUVGQ2xxTm9Dem5TSEd3bDFRbUxBMlh5SkZ1VXVwRkdXVXRmSmoyQ3dvdnJu?=
 =?utf-8?B?ZzZ2d0Z6cGNhaTh6eXFlRG94TVBRclRaWk1VQkMrdjlRMllvdWpncFVqUURi?=
 =?utf-8?B?ZE1MaTR5US9qQmxaYzBGa2VITHo1NngydzhvbFlzbFF5N3BHNWhpUGI5NFJ3?=
 =?utf-8?B?OCtTdnhUL0VZb2xneGp0VE1tZHJVQ0RyRXZDajdBVE1SbDBRSDFZZ0pLekxM?=
 =?utf-8?B?UXNwNU43ZjlQbGp1Ym9ZRkRPNHhXeFg4Y3lDbm1iUVk0cFAzTTdmdkRPWFJP?=
 =?utf-8?B?TStWSk1FUGxsSHVSN3NpbzcrelB5S2tlQmJDOVYzaE5QQTVKN293TXZMZllv?=
 =?utf-8?B?ekdGSkNsZytuaXNXdWZ4YWZZVCtUTWNUYjVGcDBneFFkWWxya2dpNmx6R0NZ?=
 =?utf-8?Q?4j8W9qQB4MTHf?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd7afa8-5d7d-47b2-e445-08df4c995104
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:48.5939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 02/14] package/jack2: depend on python3 for
 D-Bus support
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make the jack2 D-Bus option depend on python3 instead of selecting it to
avoid a recursive Kconfig dependency when gst1-python selects
gst1-plugins-bad:

gst1-python --depends on--> python3 <--select-- jack2[dbus]
  --depends on--> jack2 <--select-- fluidsynth[jack2]
  --depends on--> fluidsynth <--select-- gst1-plugins-bad[fluidsynth]
  --depends on--> gst1-plugins-bad <--select-- gst1-python

Existing defconfigs that relied on jack2 to select BR2_PACKAGE_PYTHON3
must now enable it explicitly to keep D-Bus support.

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/jack2/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index f5ac0399eb..ae8ea24f3b 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -32,16 +32,19 @@ config BR2_PACKAGE_JACK2_LEGACY
 
 config BR2_PACKAGE_JACK2_DBUS
 	bool "dbus jack2"
-	depends on BR2_USE_WCHAR # dbus-python, python
+	depends on BR2_USE_WCHAR # dbus-python
+	depends on BR2_PACKAGE_PYTHON3 # dbus-python, runtime
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_PYTHON
-	select BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Build and use jackdbus.
 
 	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
+comment "dbus jack2 needs python3 and a toolchain w/ wchar"
+	depends on !BR2_PACKAGE_PYTHON3 || !BR2_USE_WCHAR
+
 endif
 
 comment "jack2 needs a toolchain w/ threads, C++, dynamic library"

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
