Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A7606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=psy+dqNC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=hAVU0+BS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C72D811A2;
	Fri, 27 Nov 2026 15:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGsEIW5D5fAP; Fri, 27 Nov 2026 15:15:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 114E0811A5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792556;
	b=f34SXWZm9sr6+nnLiwOB05guIgfnpwH5Cukee8qoao0+raNv2oXZF6YXKG43luYhPJ+K
	 /dV+99nHEolMIXkLNKf5W/Qiyp5NvquUYqirWlT1Z/eGUS/VZuGBXHawA/0V0xshBD+IA
	 wo0CQqZ/WqFKHPzrCEX07p6m+GHjxzC+zlNuRY7YlCh69KGfGqc+scMN//xlXPUV0apm7
	 cCMY7VMypRnXz52+l1TIwzOBGlNReMyI5iNjrYhl/dxe7qcz2+Mf/VcwVHqTLMg7M6NyS
	 JcebHEux9pH4bz/GXnIgozmXwRdGxYqwJe97XIAFuB/yozAXuiMhYu+IGk5EQHvCF7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792556;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 X-Change-ID:X-Developer-Signature:X-Developer-Key:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=bq272TW6J96ZsRlArbm8ViMVD0139dYjjcVBlC7RmfU=;
	b=FtUSN19hExMZo2R/qVbWqiyWDHI2XchZqEVZpO3ZJrslpB3lyR0EwfyTrfQoZD7zjh0P
	 kXof6O5GSf84JQ3oQXQgTjdQlD6osG70XSS0TD88i42qQwvwaujfpUtikGmQkxmdm+A9b
	 2JoeuNmlOYQTiF911ZFS+zSMIATzYcgeh1SJdtHYyyh+082W+64W36Wi6kE4ArWM4iFeI
	 PDH1UEGvYwRd8SSpxqyydW8nUXbdGYeTvsXeesdB9mc9MmdYvIMYsS5oNz0+dYE3yD4DM
	 XFMos6AZS554YcriQQYW8ZXM8+SLRYQZbRw5YT54vXX004LEy4j448r0hd4n6YR9Kqw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792556;
	bh=bq272TW6J96ZsRlArbm8ViMVD0139dYjjcVBlC7RmfU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=psy+dqNCpwyzb++oxkov0ImVA0PMLOLkoQJw/SqhwGG5gLJuN/SZspNZpkBzzViDR
	 wrd0zbjJe3MeVCwItU/URTq4fuUJ8d6uT6nSV6+AGVYrR3bwV4AAD9brx8z7owpD/8
	 9CneCKX4Sxs7TJzE6QDxWGtuFqYZzCaSC7cUrWZq9QeA+DUoFSXfUm4xNrO0gxnP3f
	 G0CdKPufLf6XirBekxF1wHjGenf6CWPEutLEB+nn2oP64LPVgWhTl+sHyxReg/Mbe5
	 6LXYeBeXqr4ljHZBe73WI0BV8Cam/CAxj0nS9aMYjLtWPQjSbIo6YDwxfl/L+ByBDN
	 CjTmWRNN3O/RQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 114E0811A5;
	Fri, 27 Nov 2026 15:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C11F2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F120A404E5
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GGCsS_3_dh1S for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:15:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A20F440012
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=hAVU0+BS
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A20F440012
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POEVEd6OLNC3xGa5cLxYAhSeMS1ocAM/SDng08mhHYw=;
 b=hAVU0+BSxSJI5DMIOtnaQaQPu1voJxu26HJeVclMA3tWGHSF1UMB/ORk4JHe1BceXYdmIwpUOuW5xrpAZ9Qt/XJuLZzpxdobqfS5SaMeYkV5lz3IqOzGj7ure17ACgOUN+BEscPX/VU/0r3vSoTmQthk1vklGpp3SsBw29C+HpSaWQyW/rBEvmcUYDNX5sNA1Odhrui66sYoiXmTvV7sZDX52TDpB372IQiDzAEhWT40/7yO0vtGm4zYj6FbfwW4PltjFHNc1FVZndTsTAzUrVav6V+SRXnY6rHmCZFP2u5dzx7YTFrR+0MxmB2J0Y7d5Z/P2NCWyheRElUl9dHv7A==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:43 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:43 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:02 +0800
Message-ID: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
X-Change-ID: 20261105-bump-gstreamer-260848b94831
X-Developer-Signature: v=1; a=openpgp-sha256; l=4823; i=tfx2001@outlook.com;
 h=from:subject; bh=ooLjHV6zNs4xM2R3Gyhd2Ry/PRze27fN6kC1FqCYrmI=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ45U7lIZU+Bowk6Xr7zRJH2eXEbOWs65Sst1
 nWnvwdwFGmJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeOQAKCRAcD62l0/wL
 2viOD/9GkKMiJi63t97g3+lzPPPLANFq59yx2YYWiPNcqAQD9BafuXlQrS5rWZamdX0ftEt7bEs
 L+Wjuuz7Ty9Y+uTeZx0w+M8CN+sz/o5FIZF+fFejogc02nUuG8F3yipVVsDDd11gfh45ky2YlXm
 thbxunPaMqFn6WV7bs+eds7fBHH2SfCByZQB1JkvIuBbmROmudZBz4SCUm2qf1sdQW7/40rllhd
 37MH0jUGJOW8YAVkuD3AamO7WsCxI5CWkF1oJDDYfNPiC7qR04YjM238b610euFC3QkVujj5wyk
 H/vRnLtXjc8mNQlgjzVs4Z0RjEA8a+HqX08WDxvFIa+HFB9Z2Ja+5MLpbE+N/NbX+3HvmZ4yx72
 q05NqtkphAIzjnJ90GJICml8ixaAb19vMfy3dC/G6LnSoowZmVg2tcoljHlXtHmp+P0Z5goI/iC
 PJgbWVAqMT0IYwcpnKUJ/5/YecYoxaLzhmRynD81HRnClcMpJ/2WjekV6Lpj0ZkfxmBG6k9PAB5
 TMjT8gW3KvtFHm750cqW/rZ0t4Q3fJRJzxLZB9IzY4vvpHehoCXJqxFYrqTDrWUdDkALl7ZqmXv
 d3NWvKD618Sj8HsYCk+4AN/j4odgE0n7djGlWl4cSUznStlJCjZvjUsTjcqJT+5v3sSSXBireXS
 xhrltLf7Nm8bMPg==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-16-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: d92d63f7-4f54-4569-cf4b-08df4c994da3
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|5062599005|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzRHYlVWN09rWTRNK0dCdE9aV0c5UUx5K2F4ZVZNRmRWL0N0OHliVWF0K2Jr?=
 =?utf-8?B?UmdQQU90NXo2ajNYR012SDM1M04rZndxRTkrRmpaQ1NsS25IZmI5TXJvcnQw?=
 =?utf-8?B?MHd5U1pNd1NlSEZCbFQ2ZXRkVkY0bHhWb24zQkNLVWVXNVYyWGRaZ1gwR2Ux?=
 =?utf-8?B?ME12c3ZPck9rQUx0UGRSN1g2Slk2SVM2ZnNXTWU1R2dpZ0VrUytscVJjN3p1?=
 =?utf-8?B?MzQ2cWFmRGJYay8ybmFUQXBya01FV3pmblpQaWhFT3k0NzVGMit0ME9ySnRS?=
 =?utf-8?B?ZTZjemtXZWpsTlpPN1A1bUhuMTBHZFNQdytuTHBCbkZMY0NaMzhQMlA4ZE5E?=
 =?utf-8?B?cnNjRGNBSDNnVTFDNG90SS8vODU1elFuQlIvRTA3ZTVLemJ4RGlPK0JlSmVR?=
 =?utf-8?B?TC9NQnhBcEMwVmRMbkhFQVlHWWszaHFQOVFmQXkxWTJVcThRSVMvV2l5QUk5?=
 =?utf-8?B?RjJRYllYMHNMNm03dEdLd0pEZmFNNVlsbDZCOERuT29UZDRSUklRVElSUG8y?=
 =?utf-8?B?UkVNKzRiSmFSeVlQeEkrTHhhdkdvSnZmSldpTHo0ZHJVVEU5ZGdWcE9DYnU3?=
 =?utf-8?B?OVpvNmZ4ZUl0YktQY2F1RUFsbXpKUGVrTERrKzNjVk85OXpXcWFyUHNsaVdI?=
 =?utf-8?B?aUtEbFhtYUdzUXUvdE9VTSsvNVFXMUltdndlQWdkWmZva0xLNnpIcERmSGY4?=
 =?utf-8?B?ZU0yMkdseFpyKzc5QzNjZU1lNExRd0RsdEIzRDRhYlFBNml4SmR3MHlYTUtz?=
 =?utf-8?B?NEpVWXhPR2psd25NRGd0aXA3SWhRS1YxNDZQbWVOWFZYUHFSZjJpZHhzS1JC?=
 =?utf-8?B?cU81TVZ5Zjl6SkhCNGJuVTcyM0t3V2VqcVVlYVBPeUkyYjNCeTJ0dzRYcjZT?=
 =?utf-8?B?ejJCNzh4cEgxUDNlMTJNNzA3NTJkeDB3dGhKeVFHL05zTGxSTTEyMFlBQVZV?=
 =?utf-8?B?RVFuZ0NkNzkvRjRrd2VrdW5zS0kzUUNtL01xejlBdnViLy96QXREaktVeDRz?=
 =?utf-8?B?TnlrVHpjcVczdlpWTlpoSWl5a3NvYmhqR2xUcGhmSGx0K0w3OWdQWWc1Qm1Y?=
 =?utf-8?B?blVERWE3RThXWTJNOXVJVXZ5aFk1Z3NObG10anhYYUJPTG9UK3RRQkNpWGlh?=
 =?utf-8?B?K3FmaGdTNGduL0VpNVNidTYzeURjVWQrUmswTzFjYTRjYzVjbmE0R1JnWGZy?=
 =?utf-8?B?ZnplNmQxckRZQ1oycnB6cFdXN1kyaGpDOFZXQTgzS3JkQWJsa3ZaTm1OUlhP?=
 =?utf-8?B?MThuUkFwYVhYL296enhveXdXc25XMGV3bGRnVDRRQlVMODQvY0lWLzlDelNH?=
 =?utf-8?B?QysyaHVPOWhPUkFsdmd6eVQ3UVU4eEY4SXd1N1ptZ1lwNC9xTE1RbmxlaHdG?=
 =?utf-8?B?RVNhQ2JmRCt6WlVhWWdkQmRBcTZmYTY5SVdRTE03b0dGcjg5SGNFbFlSQzl4?=
 =?utf-8?B?TlVHeVZDUXpNblNTc05zaFVZZXJqZ1dYRTRKUnBnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmVidkkxMG83MTFrM1JLY1VOcW9kZ3FyWXNOZFZsa1hYcmV5VXFoaDlGR2dW?=
 =?utf-8?B?eXg2bXRhemxDLzJMRjVhUnNJL0NwOHRJc0NYblpZTUpvdmVBb0dkekFjRVVQ?=
 =?utf-8?B?RksxUmtaWmkwR3FqdS9GTElwYUpCc2tKR3gwaWI2bW1oU2JCWmI5QWpFdGU4?=
 =?utf-8?B?dm1MQ0lIZ2hVL0VJYUc3Q0FuN25rUHc1QStwOVIxM2gweitCZG9SWGFSQ3dX?=
 =?utf-8?B?K1lTMWxZcDFvVlBlQkRUREhFWEFEamhLeEFGa2pnYnVtaXhzaHdTWXc4b3JO?=
 =?utf-8?B?bFh1RUVIOGkrTjlhK08rSmxCd0oyT0tnMzE5S1BaV2lndEpJSzhqTE41V0t4?=
 =?utf-8?B?eWZFU0h6S0VjUnNFM0lTdkZWT2N2S3R4NGt5b2l4ZzFnZytRUlpVTkZnUjFX?=
 =?utf-8?B?TWFUZHFJZmwvdDJobTZHN0hDSHRPclJOeG1FS3VhL3l2N1E2eFIrQ1RIYmxC?=
 =?utf-8?B?UDUzckIxTmxIVW5wNXZTd0xYMDN2UzBPVFltL2xZYjA2QjdFY0FGSGNZVVEw?=
 =?utf-8?B?ZGswbWVtZGFqR1JTOW5YanFyWnkxOVN2dUR6bjRqTWYrQk5WMDlyQVVhN0Iz?=
 =?utf-8?B?Z2gzRXFCZzRaSXRjWTZaTXl1VXdDMXVXbUViYWREY3cvK0x1WnRXODZVR0FR?=
 =?utf-8?B?cklhRFdDSm43YlJpaVpsaEhiY29iOTRneEd0cUtVQ3ZqMnpYeWRsN2Zac01I?=
 =?utf-8?B?SmpucUYwZ2RVOXhHd3Z0aFhRQkJBR0hmZ3hBTzdRSDVxQ3ZUWTFLaXNQakNw?=
 =?utf-8?B?K2pzTlVXMHBleDc5bVg1ZEhzeUVhemMxWTVqUmc0Nm8vaDNSd3lucGJ1QThu?=
 =?utf-8?B?cSszV2grZFdpZmlLZkdSOEpaRXFIOUxndEpkS2d6bTNTNURwZ0t3VVp5SHM5?=
 =?utf-8?B?Wlg5Q0hTdUU2eDNzazkyK3cwQXpPS2RMdUlBazcvUkVmL2d1K0ZadkQ0ZENG?=
 =?utf-8?B?bTZ3WVdYMEx5SmNxV1BXSGNGelI2dVFQaTFpdXdId3dVcVF3d2xxK0pmT3RZ?=
 =?utf-8?B?QmhqQytmdkpSbzVuRkRMZVVkeWFsTjVsV3BHTGNwQWpPdEtJL1VwMTJnalFK?=
 =?utf-8?B?dmppTllIM3lQQWpwRXVCOUg3Sm4rd2RRVUtxSW9pM1JRYUZKWm5UTTl6YUZP?=
 =?utf-8?B?aktjUFkvZUFPU0hCbnNRTGVFVGZhSjJQL3ZGcHd4N3hWMVFPRTFGbmN0VHhk?=
 =?utf-8?B?bkxBM1NFTmtHVzZzTmRwZ0k0UXk3KzRxZE5rVjV2cythNFR0NTMxeEV6TU41?=
 =?utf-8?B?K2lPbmdUd3IySTBoWi9BOU1zVmtCTDV5UkFNMG9xU0ZoRXBFa2cycWNFb1lS?=
 =?utf-8?B?UjNQMVB1UE5kQ3VzeGZMejlTZVQxVjZzVmQ5YmxjUURHU2RuSWNUUHJ1eG1i?=
 =?utf-8?B?QjBnU2JFUXQ0bFJNZVJ2NGY3dmF0b0M1ZituZWpZbkxWMys5eEROREczN1FB?=
 =?utf-8?B?Z0ZiQzZIMkNsTFQxa0Z2KzgrUE9qMEEyVVRkcWRIYW01ZW13dXp0VmdWaDlu?=
 =?utf-8?B?TGVMUElvK093K3JRVGpIdFJzRnVTTlVBbzBxazJUKzV3RXREdlFubTN5R1dy?=
 =?utf-8?B?cUdhMW9DcVYyRjBpbnZzSy85MVpTd0drTWFyNklxd2ZTV0lEdUJEME13UkFj?=
 =?utf-8?B?c3hGRi9ScU41ZlQyUFV4UjZxaU9aRGlEVENMSnFRRWIrOGk1ekxsYzJuN3Va?=
 =?utf-8?B?eFhaMXFTN2lybGdMczl5aVhBS1IrbE1PaWhPSVRLTnhjR0gzaHkzR1NJSWd1?=
 =?utf-8?B?MVZjcG00ekZ6TU03dUJ4d1Z0MEtSUm5vTU1jTnZ0OUlsMUI5cUp1R2ZHd2Nv?=
 =?utf-8?B?dGtFWmtuano0U0gwQWtOOTM4NVBpNlA5bUZpZG5LdjlWbE96WkpWaFBmTjZ2?=
 =?utf-8?Q?a19hpmNdBulEk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92d63f7-4f54-4569-cf4b-08df4c994da3
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:42.9789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 00/14] package/gstreamer1: bump to version
 1.28.9
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

This series updates the GStreamer packages to the latest stable release,
1.28.9.

Patch 1 updates libnice to version 0.1.24 to satisfy the new minimum
version requirement of 0.1.23 for WebRTC support in gst-plugins-bad [1].

Patch 2 changes the jack2 D-Bus option to depend on python3 instead of
selecting it. This resolves a recursive Kconfig dependency exposed by
the gst1-python update.

Patch 3 switches the gst1-rtsp-server download URL to HTTPS.

Patches 4-13 update the GStreamer packages to version 1.28.9.

Patch 14 removes the gst1-vaapi package, as gstreamer-vaapi was removed
in GStreamer 1.28 in favour of the va plugin in gst-plugins-bad [2].

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/94b59df4ea60d5cf4ce940dc8a105de078bd7e20
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/82a71a7739fea9d48e9c64f44bce879b86bd3df7

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
Changes in v2:
- Rebase onto origin/next.
- Patch 2: Keep the explicit BR2_PACKAGE_PYTHON3_PYEXPAT selection
  and clarify that Python 3 is also a runtime dependency. Drop the Fixes
  tag since patch 11 introduces the dependency cycle.
- Patches 7 and 14: Move the y4m and gst1-vaapi legacy options to the
  2027.02 section.
- Link to v1: https://patch.msgid.link/SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM

---
Fengwei Tan (14):
      package/libnice: bump to version 0.1.24
      package/jack2: depend on python3 for D-Bus support
      package/gstreamer1/gst1-rtsp-server: change download URL to HTTPS
      package/gstreamer1/gstreamer1: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-base: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-good: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-bad: bump to version 1.28.9
      package/gstreamer1/gst1-plugins-ugly: bump to version 1.28.9
      package/gstreamer1/gst1-libav: bump to version 1.28.9
      package/gstreamer1/gst1-rtsp-server: bump to version 1.28.9
      package/gstreamer1/gst1-python: bump to version 1.28.9
      package/gstreamer1/gst1-devtools: bump to version 1.28.9
      package/gstreamer1/gstreamer1-editing-services: bump to version 1.28.9
      package/gstreamer1/gst1-vaapi: remove package

 Config.in.legacy                                   | 29 +++++++++
 package/gmrender-resurrect/Config.in               |  6 +-
 package/gstreamer1/Config.in                       |  1 -
 .../gstreamer1/gst1-devtools/gst1-devtools.hash    |  4 +-
 package/gstreamer1/gst1-devtools/gst1-devtools.mk  |  3 +-
 ...t-libav-Fix-build-failure-with-FFmpeg-9.0.patch | 72 ----------------------
 package/gstreamer1/gst1-libav/gst1-libav.hash      |  4 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk        |  2 +-
 package/gstreamer1/gst1-plugins-bad/Config.in      | 10 +--
 .../gst1-plugins-bad/gst1-plugins-bad.hash         |  4 +-
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 38 ++++++++----
 .../gst1-plugins-base/gst1-plugins-base.hash       |  4 +-
 .../gst1-plugins-base/gst1-plugins-base.mk         | 12 ++--
 package/gstreamer1/gst1-plugins-good/Config.in     |  2 +-
 .../gst1-plugins-good/gst1-plugins-good.hash       |  4 +-
 .../gst1-plugins-good/gst1-plugins-good.mk         |  9 ++-
 .../gst1-plugins-ugly/gst1-plugins-ugly.hash       |  4 +-
 .../gst1-plugins-ugly/gst1-plugins-ugly.mk         |  5 +-
 package/gstreamer1/gst1-python/Config.in           |  7 ++-
 package/gstreamer1/gst1-python/gst1-python.hash    |  4 +-
 package/gstreamer1/gst1-python/gst1-python.mk      |  3 +-
 .../gst1-rtsp-server/gst1-rtsp-server.hash         |  4 +-
 .../gst1-rtsp-server/gst1-rtsp-server.mk           | 14 ++---
 package/gstreamer1/gst1-vaapi/Config.in            | 54 ----------------
 package/gstreamer1/gst1-vaapi/gst1-vaapi.hash      |  3 -
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk        | 59 ------------------
 .../gstreamer1-editing-services.hash               |  4 +-
 .../gstreamer1-editing-services.mk                 |  2 +-
 package/gstreamer1/gstreamer1/Config.in            |  6 +-
 package/gstreamer1/gstreamer1/gstreamer1.hash      |  4 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |  8 +--
 package/jack2/Config.in                            |  7 ++-
 package/kmscube/Config.in                          |  7 +++
 package/libnice/libnice.hash                       |  4 +-
 package/libnice/libnice.mk                         |  4 +-
 package/opencv4/Config.in                          |  5 ++
 36 files changed, 142 insertions(+), 270 deletions(-)
---
base-commit: 55bd43e4a8822fa9f609ee911fdee8c6bc69bd70
change-id: 20261105-bump-gstreamer-260848b94831

Best regards,
--  
Fengwei Tan <tfx2001@outlook.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
