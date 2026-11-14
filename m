Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4889606A32D
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HJyr4gLK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=CUf5dhhb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 802F240E5A;
	Sat, 14 Nov 2026 10:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cutRw9lf38hE; Sat, 14 Nov 2026 10:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8432E40E0A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652991;
	b=ORgzKYHeyw6oTspERxngi1DpRVgSJpg0inqmZdIXAPiNpVZ5lKAr/eo3ad5zOPJeRI5w
	 /+ZPPw7cGS+LfVZxY2VqJCYdVGDPZBalwQbFvs9kuugv+WK7176s3Bo+X0KlkltlkFqJb
	 tgLhlPf6sMTj/c8LNPSi+tT+xGan9jLpZko3hy4OL+nYDjTrKGl5FntpBZkCrv1Zw2E1J
	 DTxAHLdUDrUl4bcdPFAKZClRY0BB9w5DF57G7LOQxE/Rdj0QLkYtwrc+wGK4EEBzgIy86
	 qCM1JRNUQcZm/1/lGPc3R+oTQnGBtU+LgpeoxfQg3g0MqCP9yoal7DZQZNEgyraQ9yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652991;
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
	bh=wgNJiKgZw56M8qE4ijBmH6ZaYZydX+gU4oG3f6MNGBA=;
	b=HlnM9/11QZPiRe/k2Nqftgejh49GGN3ptJY+NHPDxdFhx/D3UHfkOvY9wAolrAiO0WZW
	 JtD5J7rJHZ2v2v3HdWHPxAlJzHut3dQI6w2FaeRRDcPeKTZ2FLQq7rQo+XkJRyXYC8/nk
	 MaaP2y0VpZ1Y/RH5bSLOoKI60XQzGER7PbKSChYxwG9E1iERrr7PkH9EzY9XDbFgBqQIC
	 YL6b1d6D/iUB70RktVszdedpq+RwGrpJ/Sarn06Oeas8p5+I/bcf+16g4zmCigwOcsFoj
	 lpjCv+iBg/Rq/xHMfsrJ045e1fOqz1qTxB/nW/nnmIxvgr3/d0kM/1cdp3Bwy8evKbQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652991;
	bh=wgNJiKgZw56M8qE4ijBmH6ZaYZydX+gU4oG3f6MNGBA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HJyr4gLK4HSvjIJY3jkKsxzLD03IjkXtzGV9AAdbYk3qiJhEoWNuqk0HMw37AK/Ld
	 vQoR42Fakz2OK7l2KcFxmV4Bp07Yst4HYtxVkmoHY64ri4m6QMY/LY/kBdCTGQGnH6
	 B4fAqPPjWOqtFGvQfaxA5qGy6ZmTR0u6DZ0AlqAB3t/gqTEDD0L0nOs8wWgxDfCheO
	 HAXZX0JtjDTdNKYPhWTWX2sUkic1p1l4tqaPKFoA2J51+/bKkYKq6BGEG3nr6UoMW9
	 YilsxFM+MjVmuh5Z4/PPk+YHNXgNYHMiztWGX3XuoYArl5cMkUuoQ69hn9maKli3q/
	 xQOcdaj3BkbKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8432E40E0A;
	Sat, 14 Nov 2026 10:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86EE772D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D656401C8
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmd4O7Ma0M0H for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4465C40050
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=CUf5dhhb
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4465C40050
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raYz3p1YF0tyWiVkt8wPbzQ9IZ6/9XzaLqFsNwdF6uA=;
 b=CUf5dhhb3/kkureDPb7EpF/W688tYmFHpReMMD3R9kvkBeKgU9iJO3OsDyL3Eqt3em0IVanVoNEi7NJ1OAzQqpcRpx7gFg8jdR/NKKlFUksg7+5vfzIIbz70Mf4e1/6lFxo4gs1+HTDLtYpZk437Quf+zfd+krZLB+3X2fya4s0ry1sr+JhXniuHxL6WU8lYDPKfCYLAnYNchPu3W5ZLVFz52yP6Qt/TsbGli6Pai/c7Gy3fTwXQIFYTPwp30Kq0kumenJA/4ySXO4aUrTdN/vDBcDTup7EuxBODtG926GDamquDwRIqAuezqK2ixlL55u1RUWvsUy+XvDnXsgdNCQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0425.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:229::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:55 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:55 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:31 +0800
Message-ID: <SY8P300MB00412852E8648E70F9B7D484B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249; i=tfx2001@outlook.com;
 h=from:subject; bh=4FweEyOefe5F1A6rOvsIRaPWloVI+sEhqjj7LxFuFas=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+Dpfl9B39Is9aZWdTmTzVbmPfKU1O4uESXTVR
 P9folT6Z76JAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6XwAKCRAcD62l0/wL
 2r7sD/4j/4uWoPcl/kS+NIu3nYc/QYgZLcdp2nLKAVDEFR7si9H9+Rbh/e6SPgT1HDPGmkP2EJe
 8q7SXRD41z3RWo85tYPlAhAhhkzYwcUbdZ14Kx60dCsqsKNdceBpGN/eUkEhksaGfvmN5Ywi8zU
 6pphXCLsRDihR4XO48VtFlUArTK4f83T4uT+6WrUStRdsaQ/f9gI50MEjeEC6X/VStEnCPpgrw1
 imLBQ89w6puCdFzDHG/s6zZbXLqSY+lmmj63xSSafWiVryD3t0TezJm0SL9L9kPIHTq3+vabwTA
 qvd5T6UEI83RGhkAetOZezy8AbfbMvjPAoF9dx3/EdZEETaXiOdg5HCJw9cKYnvCL3psoZFOYky
 xi1YpkMkHR9PLMuNnOf38+KvkNqZ+mA7P8zyCXQnP/TWG8q2PtZ7VBaksDv8Z0ti6AEnq62lplB
 d2x+OEzT7yc12DoEU3+doOg0AtYk+K0TCgu4jvtrwvhZNq2T+uU7nDhT+es6B5euKmdCUB2H/jx
 JM0s3WWaFAVyGzvv7GDVb/QWkdGqSySo4KBs6rhVHBxcNHrSv1Qy+7iBEqF8n6u9cnG4M7GgWb2
 rAZP2rLhjJMywv1BYt7P2jbS+v27bwQQ0U1VPHUsB+SZhNDN+jD3YF5rce6293pwXMf9cXiUQHL
 g3GJ2ZO8J3592NQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-29-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0425:EE_
X-MS-Office365-Filtering-Correlation-Id: c849fd05-911f-4b32-d674-08df423c0a4d
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|2604032031799003|704163111799003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cytXeWxVcTR6ZU92VzR0MlArMGtXWUx3T2VzcHF2UWFMV0I0dEF6RUNCSGpU?=
 =?utf-8?B?S3VBSXYrTUJsNms5RERGSXRZaldMYWdycXZXenNNdXdLWGhRaExEaThzN3Z3?=
 =?utf-8?B?TnNha2l3anhxV0dyN1FzaEVPZXhsMHJTc053SEdrWENKRHNwNnpSdE5DR01R?=
 =?utf-8?B?YUN2Ni9mUkpJNkxHSTNaNGFFQzlvN0FSSzlYTzlQenhqblREZGtEYTlPRWcy?=
 =?utf-8?B?eG9RcFRrRE1oQzRJMG11ZTFYNXk1RHNDNWpsRDhFdDVRY1o3cVJ0VWJnMG1M?=
 =?utf-8?B?bHhEOUFDUG9OOGFkR3VPWHJOZzgvYXp1Qmhxa2htQUJSQXp2ZkZ4dTNzQzF6?=
 =?utf-8?B?RmhhMjdMaDlNcjBiTmF0ZExwZGNoeGlTT0Y5WEtYaHFnYzJUb0lJOUxwbS9w?=
 =?utf-8?B?NEdQZ0I4VVlEdkJlTDAvMGhDNmJZT2RqUUgzZFJaRzNEQTEzVmdGTGFYczhN?=
 =?utf-8?B?WGRCR0owNFo5UTBjSk5HdXEwWU5wZnVOdHBTRVVkeGpzaU5NblIzTEdtaTBj?=
 =?utf-8?B?MGQ0K2wwaytkR2Y4dlV3MEMwNXZWSWthT3NVejMxdXZJN0U2U01xSXhMNndR?=
 =?utf-8?B?alJ1cVJjVTd1OTZ4VmZycWZnT1JFakFuczB1VUIyWThJTTFnZERUWitnVURx?=
 =?utf-8?B?TW9McWlRaWlZNXVnR01YVURRdlRqa2V0ZTAwODNqWmQ0V08rQ0ZGbFRoZGVt?=
 =?utf-8?B?NjRwSDRqRzJNLzFabEhRYzFyRUxSREEybUtLSjY3TTl2a2RGeHVCS2VOZVlH?=
 =?utf-8?B?ZFdhYjBrVzU5YlVGelRCU2pYTmZaVjRORGpFVVNsSTFpSTJCaEt4RWptTkNk?=
 =?utf-8?B?a01zSFIrdGhNc2xRcm1Sd09JNHhaY2VoYjI3dGQyTUsvbjl6SDdWUnlGcFRG?=
 =?utf-8?B?VDFwZXhUN3F0bUZyUGxqTUZVbnRGWkV6MW40blhvWXJKbDRGbTBPZWhrak5n?=
 =?utf-8?B?bi9Rc21XMEg3aWJDeGJLQm1RZ3JxZnh2Wk9LU2FiRG1KM0JvUDh0R0F6ZGlp?=
 =?utf-8?B?d1ptZmlVbDJtS2pGc0FqMy9mYkR1THRFMlhreHVGMmo0cjY4L1VvRERpQW8x?=
 =?utf-8?B?YkpHSFkrWUF6bE8xd2IzWGdIZytzVnZHWUI3YXpJdHdlNGtnR2NrclYrQUph?=
 =?utf-8?B?OWthNUZNeEFmMW0xRlcya1lKak5nNTBWbjNPbWxIYlFKcmdsTGwrRzZzbGlj?=
 =?utf-8?B?d0Nta3ZLRDVTaTZJcC9ySnd2Q01NUFJCdXRTQmZRQXVjOXV4UEFQOWdDK3pa?=
 =?utf-8?B?cm1XWklDa0QzUEJ4T1dDSmZUN01SWjY4OWhnRzAvMVFFSDlzRnd3ZTlTM3g5?=
 =?utf-8?B?ZnFKZlZhWjVpV0thNXA2a0xlQjNqUVVHd0FxZnJKdXduNWM5WEV1Sk5ISnI5?=
 =?utf-8?B?SHYyL29EUnk4UGJCWTJhTWxzd3k0aTYvTmF6STdiSGZ6NnhwcldGU3ZUbVBK?=
 =?utf-8?B?MG96c3llMzRNRUtSNmJIV3J5WEFTUVZEbXFaTkF0eU91Tm1ha1IwaVRiU2Ro?=
 =?utf-8?B?SmQvK2N2Qy9mWndnQ0YwTjdjMEpRL1UzOVdndW9DUngyNHBSdHdWUldXenE5?=
 =?utf-8?Q?YJv5qUb09kJ1Qh9xlFj966felXYW5nrfQpPBdTnTp9V3o0?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNteFF3b3p1OGNHaHBOcnhlQk9JZGZSV3R6WFBhbXBWY1FrWVZySXIwL0t0?=
 =?utf-8?B?c09hazQ0NEVBblJCTStFSmtOMDlxRm8wbENqcUI5TUgvbnhjbXQ4SDVva0h4?=
 =?utf-8?B?MDFMenB5akF3SXZMU3AvVzJBUUlNZUhDMGFBTEZaUXljM2xFcDVWaDhnZWxX?=
 =?utf-8?B?SW9KOXVnbkR1TFJLVjMzV3dOWUdicU11SVlKc1A1dDMrUGlYSjcvS1hmSDNL?=
 =?utf-8?B?NFdhNktORkhxbkZ3ZjA5cG5GamxxQ2FTYnI2YTc1WWdLT1RBcWpSRnBhUjhN?=
 =?utf-8?B?Q016TldYNXRWL1p4WHlQUUVndG9saWNydVhHRThjYXdkdWtOZUNhb2Y5L3Uv?=
 =?utf-8?B?L2tSZmtIeFpucDEvL0RwQzhQbGxHUVFKZ1VJN1doN293a21RT3V2U3JhcUIz?=
 =?utf-8?B?ZnR6Z0hsbU04Vk1jUk43WllhVlZQRDlqYkVSa1g0cVM4YWlqTDNtSVI0RjBt?=
 =?utf-8?B?ZzNRU29jRk9QYll0dWJtQXAyZUpjaE81SUxjTHdEbXRLdEhrN0dYMFkwalB2?=
 =?utf-8?B?NzVKNUw3bk9uZmVZS0RUemdIdmdxSjR2MXBRd1BVOUtvU2R5UEZrSUhob1RP?=
 =?utf-8?B?VlpyVGUvTDUwS2RTcGY1VSt2dzNyUmo1STBLa1RiMWo3TEIyQW1QbkVRRWpy?=
 =?utf-8?B?MGYydUJXdW9XSG5wZ2QvdW8wcGhPZWRPSjhaYjZ1a3o2TjEzUXppYWp5cXhQ?=
 =?utf-8?B?aDJrQW92SHNNUSt1UVM1blEzSUFianVLRkZnYUFpM0MvM2Q4OUxSV2FGWXFX?=
 =?utf-8?B?OER1Zy9VVlRvREp6QWtkazc3OUh2OGZQaERPTDJocXdqaUtlUjBZSjdicGFh?=
 =?utf-8?B?dHF3alJ4WGNwMUl2NWVaYXBQK3FsR0lLWDZ2NmY1WUY0Z0VKS3J4eDZSZW5X?=
 =?utf-8?B?WU1NOFNLY282MjlRT2pMR1pwVkRuTm9UTG9HT21PQi9NK2NScnRFc0k3dzBj?=
 =?utf-8?B?OXFsUWRlYW44RHVCbmJmNlV0dHQxM2JLVnZpN2pOeWF4aUt3a013eVU0Vytw?=
 =?utf-8?B?WlUrTlhDeFdqWG00c2tJNkxsbTEvNDBiaVVYNmljOUxWMzNjdngyLy9BdUFK?=
 =?utf-8?B?eWlMTm8rdXJJd3k0T09tZnNXQkR2TlVZT3o3bU5IdG54N05lc29xTGJqbHMr?=
 =?utf-8?B?dUlHWXByZHpBNFNiWFpsNXVpbEV3S2ZTejZWbHFhLzVLd0VWQ3pLaWp1aHhM?=
 =?utf-8?B?eDFESmJoYXI5QkZ1em8wcmNLSXcxRDJBTnp5YW5JUGs0eDZZL1ZsTnlzYzdE?=
 =?utf-8?B?MlFxMVZBTzFSMHZrQnBYdDVhb2doRytpOVJvaHROQi9hcG83aWtIK3lmRzNP?=
 =?utf-8?B?Z2k4MFlydUlXUkc0ZjRjTzdLM0w0dFBKZFNtVWZMQTVDa0cwZHZFTVcrN2ZY?=
 =?utf-8?B?K2VPeHRGWjhDeHJYZU5jc1hlY24vL0RORlowRTdrUS9lRTdCS2lXSDFBQXR5?=
 =?utf-8?B?cHovOHJ6YVRIWm5rN1psaXdyTGNCZWY2bG1lUW9ESnFlODJOczFjVUxqOWVi?=
 =?utf-8?B?MXM3RmVaam9NUUZPbGNib0JCemxubDdnL201SS9kSGxHUTgxZEQ1SjVnblY5?=
 =?utf-8?B?Q0V3M21IeGtYbDRJUDNuemVVR2lxN2gyNGY2OGlUaTd5Qk9na1pHWkxHSkFY?=
 =?utf-8?B?QVlEdlFCWHlYcGtOV1RrRnMyK2hONUw1M240QlZQeEJ3NU5uQmtNOGFGdFdN?=
 =?utf-8?B?R2VkTUVtMXQ4WEpaWHduYmUwclJPc24wMy9xQk5IUGUvMW1HcW1CZmtQNCtF?=
 =?utf-8?B?Z3FQSXd0Wlo1b2pxdFhPOWFjVXpEb0J5VzlBTGswLzBEeUVSVW41N0xqR2V4?=
 =?utf-8?B?eit2WUxuN3ZmZEljVlZNQkFJci9kTk5UeEwzRmdOQmVGS2lTSnIzT2Z4UERk?=
 =?utf-8?Q?AV00UOozRE79T?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c849fd05-911f-4b32-d674-08df423c0a4d
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:55.2119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0425
Subject: [Buildroot] [PATCH 13/14]
 package/gstreamer1/gstreamer1-editing-services: bump to version 1.28.9
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,TVD_SPACE_RATIO,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 .../gstreamer1-editing-services/gstreamer1-editing-services.hash      | 4 ++--
 .../gstreamer1-editing-services/gstreamer1-editing-services.mk        | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 4c94cbbf07..df331bd7e4 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.24.13.tar.xz.sha256sum
-sha256  e9792ecff0df0b1dbbf90cfb271b9ce840bc048148c2d9d49fb6c6062bd18f4d  gst-editing-services-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.28.9.tar.xz.sha256sum
+sha256  23caf8439ba063091da226e7a1774915848105ff47ebdbe7773fffa21a094692  gst-editing-services-1.28.9.tar.xz
 
 # Hashes for license files:
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index c59315fbc2..2a7ec992c2 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.24.13
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.28.9
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
