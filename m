Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B7D606A333
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bl1sPckP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FHkEFNot
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822C381C46;
	Sat, 14 Nov 2026 10:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0e-tP8uYGGV; Sat, 14 Nov 2026 10:42:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62F1E81C26
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652961;
	b=B5QipKb+KyYygewMcJoM15FPPzE0oAuXWx1NAgge8u/5jTtcPOqJO8IMLJhRZX+TDSgm
	 tiEcPExwgihDVkZOFFAMS3x05mcen++XlQZLWyMVQniXIiJT8UKqhshKeCbQHB1m0LfzS
	 XYDJinlWQVexsO0g1oHAnqSl6f4KUiX150Uw5vlSx5ODa7Y6GSWRrfI8hsFGhN85jDzJH
	 q8haqo6S54mzNc2d/0h4uQ3Y97jPWtsYCVyD29iXCdeNR9lNYYg/mJYPswif4CFgkX+jZ
	 uR06E+Yuj2eQGDqdflNjwt/KIFIXAQHDvANeE58fNzSB9Cf9SurNa5vugHFRwo2HqBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652961;
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
	bh=FTAINkhp50a6adbhKEjsby4dpVoujeckyTiKHMdOCh0=;
	b=fAsyf5s6R2ttMSQyGNYr263oFPSleMIWglaKuHzM7vOcurV+GvQyycszebqcfsfZEZH8
	 EixVFcyU7Q99ORrHlfNMegiGzkwfa5rA8vhhHKkB/OrpDzOEWWz/u6ca0GmwZuhb7IXlv
	 hzxu4UrqtcCqcvVQAvtB7/R+Ag+1YapV2eFYsUuzQzt1pxzYzp/xvEr+X9+egM5miCwZz
	 +BhLy1jWntdEtjba6CtQjg3wQnH5waFLinBpz/4gzD9xeFxWvAsAsS9BuofzDvdyaM4ii
	 wCtnTT8Wln4kHbKLF99LSUfc39eMk6TXOFUVo4dDvQyvTHbsuOfxwqnld0MsJZX63vQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FHkEFNot;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652961;
	bh=FTAINkhp50a6adbhKEjsby4dpVoujeckyTiKHMdOCh0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bl1sPckP3/sSwQle1y1Z6HxfOkYM/Bo3k8eTPo/OUe9O7gJOkGOnuPpFOtaepexBH
	 5MAUNEeQz6JNStMdpkETN+iOwzlmL+8v2iqDrmNeE9/4jgkmAu5k54lP9JW0V5FEFy
	 SYrw/M4pkTuTWy5Hu9jA2g3AAIITLUBNELWcN0yI1qYb5Zxn5YYzTbapFodA6RnDz3
	 59pwHod4U2VsBTenpNkKE+d6vUY8qbITVIduXFwsXSW7ZWDjjrqLyLLVSQ78ImzOHj
	 UnPsjigaW7IWeRaHgD5dcKw4WYD7rpOFzUXRc5nhVDN/BtfVvZjvJxoxLI0BjDNkz0
	 tOSKMOApKMpTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F1E81C26;
	Sat, 14 Nov 2026 10:42:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F67472D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7182581801
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klKnDIOXEuIO for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4CBCE81A34
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=FHkEFNot
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CBCE81A34
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uqQWZOploDaND+t5qvv/9be4NyTczk+ElDvA69eWxg=;
 b=FHkEFNotY4Gr8eqcDfDLoFLfKiD/UwciHEp5EJAanEnG/5qt1eHA/pjoUgCxCgSL1s6BwDLcaYGwIyxydBm8xcK9G2llbx7EJDbB2Ut3ZTP19s4EZYcIda4HNb0IoIio5oeQnlkPpBMbua9417jnZ9desolYgg0H35lj+xyMPQHg9uT2/GNuEitR0kYqlaP+X4WqtPV/ntPHBDHS2fAtNe6STcDxw4LAkIYrpGFMSFZ1r8V1l9Zg+HqCIzEMNb3b5sOjcFrxQ1fwW3cYXi5TFfkgBQSEcb6hnK8i9yYDmdIYdVjA/Cm0qwWLLhN6tr+E/HuTqYsv7iwXZo/sL+OIdQ==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:30 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:30 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:22 +0800
Message-ID: <SY8P300MB004192F000A00B8C7DC8F27FB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6621; i=tfx2001@outlook.com;
 h=from:subject; bh=pTT+RyuabZMAxIQAXosB/6SJvo4LxGFYB655pjg55Y8=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpYF5GzZyvE2OxcnbGW5SxNgRuuh7QEUteCL
 rwkWbGoVWyJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6WAAKCRAcD62l0/wL
 2tv5EACHGJJrGSwXbrxd+LpJGG+MHSUtFbteq6KR31+PkXelptDs6tTGdqC+k3nKR5lW+xDAcH7
 LyfpK7lRkWOaPcd63NT56+QSEdcMTsDxoKAjcM+ivkYazL1VpJrQs89BZ53yjkM29gWmCHQ+Ex9
 mqviQ5L6CW8U8rfteKfecH0RTmDep6pY5kTyNjqzQGh6PAT5pV4sr4c/KlxLvVGHw6z3UA8vVeB
 ei6h00WM4PQAP1vvqdMp0+UEgxWrYguz8Xb69bOMZcyh/Ffu13vqFuZIQcIBgxsfm7W/NYMKUId
 9PrSs2bovd/JkSHhlKlqeUum7AOqJTmhxSGgQA3XiPlbCHq8VPxKmcZZ/anvLoAEDb8+ETau094
 qT8S4shoQo3fYpqfZthRo45CvjTk511rnDMKXMp+grPsW73hRd7xMG4F9WkGeFUhbDK8fYWkETs
 xfs8NveJyEl4BtrjapZd5JVSwBanOrMpWX3d/WZ6xgY3Ljap3m8oPDH2z+eteSnk22l8DICXRC3
 YQfXRdy5MkbpXKdvYgkC0PAJFufZjNkm8rfPYJyJN4tZk9D+tQzzuiif+c2jvbQd5FNuUnuqDRB
 yVjYruZRNCnRHbOyDUk1j9ofmAui1zDdTBn/ph9VbfZOyDCBgFSOt1oIxBFKfKLYdoW3GcIxU8o
 kDXmSeSJxG9PngA==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-20-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: b721de1b-653d-4268-ec8e-08df423bfb54
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|12121999013|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0xCZFUyeXVWc2NWZnhhcFBpTld4WVRZd1dhYVlmVGM2UDBhVHBEalRJcmNQ?=
 =?utf-8?B?d2hUZWNjdldRd1FwMWdHYkxCT00vWndIMmxhOEFkb3Z6Zks2eVNZR3k2UXps?=
 =?utf-8?B?RTlwNU1rK09rMnR5TVd2bXdqUStMSGQyZzIyS25tVWtISlVRSlp6cWVVTllZ?=
 =?utf-8?B?U2hPakVWTGg3VXpmYnBqbis3L2o2TC9hSmF1SEJmd0xyUVRYRFc1R0loK1RD?=
 =?utf-8?B?aVFGeHYzZjJ6NTRNcUZTY2RDM3phMHc5ZHBKMlVtc3R5S0kwaVB3VXhnek8z?=
 =?utf-8?B?V0dVZjV3OW0xRGdEYXV3MGt5UldZb1hUSVlwZlJFSTB5cWhhTUR3MzNwWldM?=
 =?utf-8?B?RWsyZTI0UmtiOGxzR2oyVGhZdkJiSk9aZTZFYkFycE84a1VrSTYvZ0x2NWxu?=
 =?utf-8?B?UEgwQXp2eVJidERGbStJSnFKTHNORkpFNGtRdUxjczNrbmJwWG00OWtvZjFB?=
 =?utf-8?B?eW83aDU1aUtZMkZFTU1xRDFjVGxGU3BoNnh1N2lNdG55ZThQOEk1Y1RqaFdK?=
 =?utf-8?B?QS8vYlY4bzRqeTJramhtSWlIN3paRnkwZUZGMDBFWGpTblppOE1GQndFMEZo?=
 =?utf-8?B?bGk4N08wdjdDeW84RmtUd29QN3BXU05XZUxVVS9PRGdHd281aklNRTIreDFQ?=
 =?utf-8?B?UTgxcmtpYWUrNFpqU0JpK3cxMzNaTXlKNWQwZlpJaVdqSXpMRUZpMHNYeGE1?=
 =?utf-8?B?V1pJQlF0UW1sWkRJTENUdXovdU8wRGNKaitjUzZDcEIzL0NYdGJ5dFlKMko1?=
 =?utf-8?B?NmlQN01zSmF1L3locDByQ1U0eHdOQnpqQ1dCWnlnejlxdUFJZmFGTmtGUTlB?=
 =?utf-8?B?S212a1lQRGtBRnBxOHF5UXJOVWNJYXNTdlhCSjc0S3h5eGZ1bjgrOGs4amxQ?=
 =?utf-8?B?bkRqNEJHdDE4VHYxQnRBeHYyUWNEUllpUkd2WS9BemFxd0FoZW1ZVDdqWTlN?=
 =?utf-8?B?bWVFYTdKUG9ndlFMdnBkWHozTWpTYll0RWFBM0ZLdFl6OUpXaVFMZytrR2JI?=
 =?utf-8?B?SGtRZ1orRFpHeDNrZDhzVDlkbnVuK1hJeHpaY3ovdnlBWlEwdmo2QmR5VGIv?=
 =?utf-8?B?RmpSRTNhbG5wa1phOC94bHlRWlJBemNVTktCTVh1YWYvZGp4dlpzcXJCTjUy?=
 =?utf-8?B?WWY3OXk2S3gvdDhpVnpIVzJoR2h6dkI0TENFdmpiR0JaRndjaXBWZHJ4ODgw?=
 =?utf-8?B?UWhxaWx6Z1pBMVJieGNsNG5UUnJGS0UrekN4WVpsRFBFMzdWR01oeXNXOW0v?=
 =?utf-8?B?OUs1Q3prZW5CL3pkbW9BaXlza09hTUtlaENRMmNabDk5ekEwbzRjRzIzOFI0?=
 =?utf-8?B?TjJFMU9oQU52aEwreVg2SWZtdGdlSGtDK3o4TFhCYkt1QjJNRlh1eVNVa2cy?=
 =?utf-8?B?cENLaGFGYlFqNmRId080T1NjOUVzaXFxZHhxWmt1Ris4VmVaVlQvdmdmY1ZG?=
 =?utf-8?B?Vkl0a0k2QjdHZm5FWkJpQWhMcEV0WVRRWTBpQVlLVG15UmR1TDJjamNKcUwx?=
 =?utf-8?Q?E6bsZA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME80RWZuVVdzU0RoUGU5ZXNnSnNCTGtSMlJYcEZvbEV3cmR3TkFjQmxFdlB0?=
 =?utf-8?B?MzNwWkVkMTVxamp4dUdyZFVSY01VVVhLNmVtTTNteDRXaDhKd1dXc08xYmR4?=
 =?utf-8?B?QXhub2gzRFZRVHRtUTJiQmcwZHZDaHFYeXA0Um5XSUxmaGhob2kvbk5FMkY4?=
 =?utf-8?B?NkI1ZTc4MXprQVQzTDU5ajgyT1F6Wll5ck5LNm8vR2pFMlNXQmRUNjdydHRQ?=
 =?utf-8?B?VUx2c3ZpMnVlbzM1bGJGOEZTdmthWkJEMDZFM2Zla0FocUd6MWNsQXBIUm5y?=
 =?utf-8?B?UUcvenJLSjkrV3FYN2M4VkdSTlJacWtCdjN2dE1YRngrb0taR3RKaUdTRzFR?=
 =?utf-8?B?UkpwQnRwNmtTM3hEWGFsUFBWanh2Ujl4aWp0VFNraDZOdGdZM3RkWm9ENklL?=
 =?utf-8?B?bmw0a2NNcTVaVHNEZUp6dHl1QzhNZlp2aFhzSjBkOHduRm1lTlB4K25VRHVw?=
 =?utf-8?B?WklDenRodzk5MlpRYWxjZzRiNWFodGFQaEhieDNkTGx1ZENHR1BLT24veUJa?=
 =?utf-8?B?aFk0dEV5NDhkb0h0R3UwMXBMUDNGaGVvZXZuSXc1aGVpSzNwc2Zhd0Z1Q3NP?=
 =?utf-8?B?Zlh5QTV0eHV4YkdpQ0g5VXlmNmdVTVNyMU1JOC9nUjNGeHF1dnBtMnRUeFp1?=
 =?utf-8?B?dWpBdnY2bDduQWg2aWt2SmY2VXVSZHBDUUwveTVwak9lQ1hqYzA0VkxQbTIz?=
 =?utf-8?B?UTBKV0xMWXprVkRmZDZwNm5mY29obW95bmMzVmQ3RWRsc0dIU1gycUpES2t0?=
 =?utf-8?B?QzZVNEJTWW5Sc29pUVQwSm9vTDJEUEZSRkNHR3hLcjduNXlBYnNPS3BsaVpD?=
 =?utf-8?B?Y1duVWwyY2JiMTdrMllZUENndEJIMThjeVhNOWlYMWYrRjQ5OHo2QjFNK3px?=
 =?utf-8?B?bndoS3J6M3BFY25yYVpDc00vUGZUMm1qa2U0QXVncGpZSFJPdlhYTjZQV29K?=
 =?utf-8?B?V09xY2hzOER6THBWMzRSbldTSjRtc2FjeXlKaFRtV1dGQk9YSDNYZFhaVTJ6?=
 =?utf-8?B?NVJYend4QVVhZVAyTk9nMk5pNGhOZTdQRjBhbXAvMmZ6aU1lUDZ6OCtZMzRl?=
 =?utf-8?B?dVd1Tm5RMnFWVDdCUS8zamt3QXR0clpscG5KTGEyL3QwY2t0TWJ2UXJTMitU?=
 =?utf-8?B?V0pYWEZjQ2JvWVo0bzBzZ0lGSWFKRDNPbFRSaGNsV2hRRG9QRlVBa3p3aitv?=
 =?utf-8?B?aUYwSUhad3Y3V3pFbTF3ZC9ZMHRNbkI3c0JyUTNMSnEvYkRwaUpxeHpidzJt?=
 =?utf-8?B?eXJXcTRUeHNxWUhRRS9sZEZISHdxNHZ6dDQ1YWxrV1NjUGpqN1JSWEt1VlF1?=
 =?utf-8?B?VW9vYWRDUUo2cU5PYitITjVEbTFzU0pLbUhOUUdkY0FmNzlVQUswRG1iQTdC?=
 =?utf-8?B?bEVIYWZ6am0xZWptMzlGZ1Y2OW52UElwYVpTTnEvc2YrSlJzSVVyZVdCMHdH?=
 =?utf-8?B?c1FTblhTUXNKazdUdHZzUStnTWxHTmQ2VURkSlFJR3lHZE0xZ0FBOHdXa2tr?=
 =?utf-8?B?UVFLWE9LV3p2c2tLQUNTbGdVcGhTdWIzcmI0SGZBMFpneUtmdVpVV3ZnZkpK?=
 =?utf-8?B?YnJqV3VjeERCUlI5OEJOLzJBbjd3UUFWemg3VWI5QTBBVHRBclhXNnJRc1hY?=
 =?utf-8?B?OFB2azI5b0hUSmkyS0JBOXBCZjR1VXpwcDJXMGFtcTdzTkE5UEhwK0xBVXZM?=
 =?utf-8?B?RVlhRUdvSkt1K3o0NjN1enBaazJ0djVEWUFMb3phcnhaME5xVllhWTRwZjRy?=
 =?utf-8?B?bDZuWlRGdCs5RFhFNTdYWmNUY1R6aDJ4dU9BODMwMktmZUhhNGt3Ykt2YTha?=
 =?utf-8?B?cTdza2tnUE1ickRkT1UwYUJvVGxiYm5hdEFWY2g2ZzJMaG5vRU01azFFejZL?=
 =?utf-8?Q?de6v0R0zKouhB?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b721de1b-653d-4268-ec8e-08df423bfb54
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:30.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 04/14] package/gstreamer1/gstreamer1: bump to
 version 1.28.9
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

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Require GCC >= 4.9 for C11 atomics and <stdatomic.h> [2], following
upstream's switch to C11 [3]. Propagate this requirement to reverse
dependencies that do not already require GCC 4.9 or later.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0a2e0a4f64cc877c845a4c68cba81fc4d5757553
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gmrender-resurrect/Config.in          | 6 ++++--
 package/gstreamer1/gstreamer1/Config.in       | 6 ++++--
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 8 ++++----
 package/kmscube/Config.in                     | 7 +++++++
 package/opencv4/Config.in                     | 5 +++++
 6 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/package/gmrender-resurrect/Config.in b/package/gmrender-resurrect/Config.in
index de52410a73..338351c7ed 100644
--- a/package/gmrender-resurrect/Config.in
+++ b/package/gmrender-resurrect/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 	depends on BR2_USE_WCHAR # gstreamer1 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # gstreamer1
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE # run-time only
 	select BR2_PACKAGE_LIBUPNP
@@ -11,6 +12,7 @@ config BR2_PACKAGE_GMRENDER_RESURRECT
 
 	  https://github.com/hzeller/gmrender-resurrect
 
-comment "gmrender-resurrect needs a toolchain w/ wchar, threads"
+comment "gmrender-resurrect needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/gstreamer1/gstreamer1/Config.in b/package/gstreamer1/gstreamer1/Config.in
index 5609d8699d..a940b6c6e0 100644
--- a/package/gstreamer1/gstreamer1/Config.in
+++ b/package/gstreamer1/gstreamer1/Config.in
@@ -1,12 +1,14 @@
-comment "gstreamer 1.x needs a toolchain w/ wchar, threads"
+comment "gstreamer 1.x needs a toolchain w/ wchar, threads, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GSTREAMER1
 	bool "gstreamer 1.x"
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GStreamer is an open source multimedia framework. This 1.x
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index edfd60d9d3..dde468a333 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.24.13.tar.xz.sha256sum
-sha256  ed4678e1d0708db01a469ae5dd31c10cac73c0fb3f7c2c471b0d3cab0affc7d1  gstreamer-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.28.9.tar.xz.sha256sum
+sha256  6dbf744f583131a34845cc641e803843766a9ba80ce00378a9043fd6d8d5fb38  gstreamer-1.28.9.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 535272ed25..be327f50e1 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.24.13
+GSTREAMER1_VERSION = 1.28.9
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
@@ -18,9 +18,9 @@ GSTREAMER1_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dbenchmarks=disabled \
 	-Dtools=$(if $(BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS),enabled,disabled) \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dextra-checks=disabled \
 	-Dcheck=$(if $(BR2_PACKAGE_GSTREAMER1_CHECK),enabled,disabled) \
 	-Dtracer_hooks=$(if $(BR2_PACKAGE_GSTREAMER1_TRACE),true,false) \
diff --git a/package/kmscube/Config.in b/package/kmscube/Config.in
index f68f38b7a8..5001474ce7 100644
--- a/package/kmscube/Config.in
+++ b/package/kmscube/Config.in
@@ -18,11 +18,18 @@ config BR2_PACKAGE_KMSCUBE_GSTREAMER
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	depends on BR2_USE_MMU # glib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gstreamer1
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 	select BR2_PACKAGE_GSTREAMER1
 
+comment "gstreamer video support needs a toolchain w/ threads, wchar, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 endif
 
 comment "kmscube needs EGL, GBM and OpenGL ES, and a toolchain w/ thread support"
diff --git a/package/opencv4/Config.in b/package/opencv4/Config.in
index 10b2c54b70..05d1109d9a 100644
--- a/package/opencv4/Config.in
+++ b/package/opencv4/Config.in
@@ -278,12 +278,17 @@ config BR2_PACKAGE_OPENCV4_WITH_FFMPEG
 config BR2_PACKAGE_OPENCV4_WITH_GSTREAMER1
 	bool "gstreamer-1.x"
 	depends on BR2_USE_MMU # gstreamer1 -> libglib2
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gstreamer1
 	select BR2_PACKAGE_GSTREAMER1
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
 	help
 	  Enable gstreamer support.
 
+comment "gstreamer support needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 choice
 	prompt "jpeg2000 support"
 	help

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
