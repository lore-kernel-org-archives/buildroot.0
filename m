Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416D606A323
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jpDB3a3u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=ekM6X0g+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D443E81286;
	Fri, 27 Nov 2026 15:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76SBIBYzPfkz; Fri, 27 Nov 2026 15:16:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A3CA781287
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792565;
	b=PsU7G12oddQPJ4qB6wZSaSrGzvL8xUUfiXrE8bXEvfgZ1sf9KmCAgrGiFPwvHcpV3m24
	 r7YeCGyDZCJgXT8/kevLY0BZyuo1MIJvx0iyaPgNABkJFaa52aanMonAak+TuCvhFvdD8
	 1ByZ3JlIytYbN0bVAYYgPk3P1CNoxTGJbUfBptt3Ank2pZsmpPllWIPlHFNFTn1CGjRbe
	 UbL1dhfeO7h/RJXK5SZdyKPqewt6ipiP+HEES988saurFIl9G1bq4RdLlNhGE9ZnSi8xY
	 P/dKDwRAGRyE0JEdQGRXZITCkWLjVcbQi2kYv7ja2B6RvPDSgKefQoS+IW2DgcFSAOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792565;
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
	bh=OtZZIImcVyi09SQxaHb+ha/vRvoDHVdKrOwpf8IPITg=;
	b=numytZgGiNYE4J4w/lRDVh6LuYu0r15V9FekdydJ5zSCZdM9cruOpPPkKdEQLvBv3MqX
	 eOtLD23rSSvHcV0ms5pRLPBDGXky6v+CIemOE5P0TnSoUO5OUF2PK4LP8qdKqkFmu9a0d
	 pj8ZPH32ymTsrA17yJCyjERHqduwXEkvJwcMpP9Tgc96Tq3/vkBKZ/0IVKD1Abae8nNMJ
	 3SWxkZVuU+H4Xs4nJl1gzrL1EHUaIOz5oSHScMt+qKdW/nd9HD7+BBhn9pJ4NHKSO3jLQ
	 hQngAYlDqO29S8rFUHJrjGlu2boED7BMUvmDXrwRQxzVEiFdx7hJMnEeKSSLmMdQCew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792565;
	bh=OtZZIImcVyi09SQxaHb+ha/vRvoDHVdKrOwpf8IPITg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jpDB3a3uzYS3EJvGw0hKTyGQue9nZGDBz3xYy0BaCpbmSHIwGsISHJxbGvSwOistd
	 XpnKihvJepmUiLviB0jjYHYhxcxDcYbrTjBrZ2p+p117wF7lr7UOkTLdNW0qWoPLfm
	 68oSKgfX2MsyPFT74wSGha5i62tdohieTHJwoFVi0Y2gDRHECX5j1Mj+ZYU1wIG38B
	 u20EAYyhds0QJTobFcXBKPpm1WMr1h+jusrxmmhWMQBApR+OW6XiWbTdi2I5o62gYC
	 MnbJv8CinZRH8Zj4iTKB8rnmXOLw98nzSeq+Ybp1u06qO2ExbDE/6mbd1qrgxfLmCE
	 U6M9hUmSzR0bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3CA781287;
	Fri, 27 Nov 2026 15:16:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DD2CE2BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE93540925
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M66H_nh1kGJt for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8C36C40836
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40d::;
 helo=sy8pr01cu002.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=ekM6X0g+
Received: from SY8PR01CU002.outbound.protection.outlook.com
 (mail-australiaeastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C36C40836
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArS3RlcRtVof3kRbUuDjJi3h7HnLXurd078HqGWj/nc=;
 b=ekM6X0g+xVDq/CRYV5b48C4TQdzQdgAdocSaPEmRV9uWuhxI0wRxPNDEDryDPKwPoTKMWgb9WiUawREfKGEwdOAtN8DJlKkXbiZ0K9yN01l3QFSlQ2oNuHIT8RvgMppeLoKC4SQF2f2hLI44q+6Y8PbxpzOr33702MT7CW/3IAEYhWxUp7skvSOfay2ic6AcCobOXG1EG7bqu+ATuKjUtFePBIjsi0QikGbHqj3dWq8NK0F9eKNdt+jjcSUqyQBSy0TL3iMfDV4b3viPxnMCkA3xTD8GSo0yL04+5LYn/WmmaxQUCDKiggyuoZwQA94zTfWSQQM8WnVBpaNvtT3APg==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:15:54 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:15:54 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:06 +0800
Message-ID: <MEUP300MB004599BC91683624F13D1A4DB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=6621; i=tfx2001@outlook.com;
 h=from:subject; bh=q7htpZGDrG98NrVdKAy1HdE6jhLOdA8rSvULOBylGB4=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ48E2LUw8DxFybOvm0H3XcX+f8ZHpTeSok+2
 CD3RkZb2RGJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmePAAKCRAcD62l0/wL
 2pjZEACQ9L6Y7mfaU6MAz0hW84ayEJRz0yZaNX7ZGBcvwP74xw9TGhPZ6Fqk0zaF8Nna74tD0Vj
 Nxqhb0Hh/NVJzJwblf7gQ47Wv72Xi5H74afhG0GLw5k25qrb0N3cO8uVqVNmJ1Nx0IwbiE5ViJW
 eP4UcERTDwSUFjs1/NZ3kGE7yJ5M+3ee3qd1FlhaY3PK6jdQqLHnhQEVXscfXoHecXZlJcTExoM
 DzJKHs5PsOmDkij2hzz/mQiCzTD3wiO47MoWn4HOO6t6qbOPqOuekGsA7RMOAKw/eWcsC2uxhNU
 w8MQNns4TjfeEVGDg7biD41/8jjawX5aD+3picBZyiWfF56aFCijb3keqjWri0OrgkEagB5MiFM
 RZDshs8hK4Nw0PCOpLZht6pVyL7UoQQhOWaEVIkc5mS3kwSTMYR4SJin7LgSAoxe1DCIxbJsKsy
 OVhiMrpwkWPnuq37OKjyEXKiHOZ8FRZPi6IabSStkAYRqO1zlqoyWVEhUYrV05mjtnWM+C6Ty0T
 0VqdW5s53PLG42hycp/XjPtniRRiEeldzb41n8cFsdtIEh9IIEqReWchq0wmOI7TNK4iBBg96O3
 mN6Wb5A8VLBqfoSxVqSjG1KTu9bUuH8qrmpMe5j6upVJx7Zbm2uLuJkCoEinb6ktK8ifwycxncy
 r91XSKOvN56bygg==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-20-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: e489e160-83bb-4e2e-a29e-08df4c99545f
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|12121999013|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3IraFBleVhHVGpzZ0hSWWw1WFp3dDhkclF4WVpuR2pBT2FtR1AwNHZ3cWRk?=
 =?utf-8?B?SG5mRUNTS0VuTmJuLzlUMm5zN3J3RUxxQTlUVUNialVTUFp5eGFTU0w1Zzd3?=
 =?utf-8?B?UjFhMFhPMWx0MXZsTDQrd3cxM3FFUmZBOTBnRlJFNmZIMElndmJNd3h2aUQx?=
 =?utf-8?B?NTF0ckh2dlFLZk4xenlzZnRsU0haY0VwcHVURVh5cDZIa2pLK0NPQ090Wnpa?=
 =?utf-8?B?bkQveUhXNGlzQ09uSWtIbFBybkJYZXYxQ2p2OWFnRW5zeSsrSWtDazgrQkl5?=
 =?utf-8?B?NThFaUxVamc5VXAxcGtzL29RblBSWmFiNUhTZ09iaGQ5RVlWdXp2c3JzU1d3?=
 =?utf-8?B?Q2VXK1paZ3h2N0ExVUNUZ2E2WVJrOHVUaDVGYmRiTE03VnB2QUY0WmRNTDdT?=
 =?utf-8?B?dXV2UEwyczluNFZGTC91WGxvTnM5eGVMQndpM3oyNmZVeWd6WnRidExkUXBW?=
 =?utf-8?B?UzcxdFYrekhndyswbnJaNkhKRmhzT3dMa0lWUS96RkJLMHQ0MTIrZHpXUUNI?=
 =?utf-8?B?b0xmUlcvVFZtZ2VUSXg4b0lkUW5MQ0NXczF4dWFJQ1ByTXhuQ3R4UWc4QVhq?=
 =?utf-8?B?eFdLNU1kS0Z1eXZjTUY3K0VBQnFQT1plMWtTRWdJNDZtTnljUERZcjZIamhS?=
 =?utf-8?B?eGR0TERRN1VyeWV3NVRJU2s3NThWWjdramNsQUxGL1djcTQ3d0dkenFRc0Vj?=
 =?utf-8?B?SzlxSjRLcjloSnVWVVZtSEhQMTUwRjVuQkNwT3NhZmdNQlZ3SGZCdDZjYnlV?=
 =?utf-8?B?M25aNWlZQjVlNWhtcFR2MlRhQ3FFUU0yenh4SU0xNHNxbThGUDNDUlN2UVBu?=
 =?utf-8?B?NWpWLzV5Z2tibWM4KzVreDgyQ04vNm02UjdCRFFrdXVvSUpVNW9Cd1ZZUmVN?=
 =?utf-8?B?Rk5GYk9idG05a2FoczBwU2ZkelhDQlQxbHA5U2UzVFlGMDNhUVcvcCtIYm1s?=
 =?utf-8?B?bnpzOWwwSDI5QTZZTnhUU3RKZlpza0pEWHQxb2V6S0llb25sVllsc3prM0lX?=
 =?utf-8?B?RElQVXNkdFEyUVVMcXV5dDRER2hQOVdaRXFyUnlRYjE1Rm1HSzd3SUZlT0Jr?=
 =?utf-8?B?eEU5L2M1ZlFvUStxekxIdkdacjhtRE91alV2bEVNQ1lmTVJUZGJIakFaZXRJ?=
 =?utf-8?B?NlZuZjI3d2xuSUM3cmg0Nzh3ZU1nQzJQWE5BU0Z1RTZmT3FER0pnTHBJR0pq?=
 =?utf-8?B?aitlSUNUWmtJK0VUcVcydllIYTBCaG9MV0ZiTXE3NlA4YW5hUnpaVzF0OEZu?=
 =?utf-8?B?cUhPUDVGbml4UGxiV2JpOXdWL2pSWExQK01rZi9sRjFYRmY3UzhMOG9JRDNZ?=
 =?utf-8?B?alZjSTN4dUpiWVpCU3pMeFE2bE5SSERWZ3ZidlhGZGNLdm93NW16bVYyYVBq?=
 =?utf-8?B?Sis4RmdybnY4NDZzeEsyKzQ4RmxVKzd6S0pBU1IrWVRWVTR0R1JwMFh3cVZp?=
 =?utf-8?B?eGlvRFpYQ2l6MUc0bi83SnMvbTlud25nSW9ra1lSV1ZmTThVbW1PNmdOTVor?=
 =?utf-8?Q?TaeIZI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzkvOWVsS3V1S0lGREpMemJ3aVlmSjZxWXBYTlV3SnBISmozTHQwdUZHTUZv?=
 =?utf-8?B?L0cvTUNIeVZDbi84TWpkb2VvVVFNNXZrQUhjaytyQzhGRVMyQmNnQnZnMHJn?=
 =?utf-8?B?cnNQYXo2dFNKalNoQXZGSHplN2JRcXh5dlF2N3ZWVlo3N1RTRjhqaXUxWkR3?=
 =?utf-8?B?cU04TDhkR0crSEVrdzkrZWp2K3pmcFdnNHQrVzJzUG5jWXRkSE9SWmxXRHVj?=
 =?utf-8?B?Mm9LS1NiWnpQdCsxcnh2dys3TU4xWjdwcnZock1BdzZib1FpbFdjNlBmdVpJ?=
 =?utf-8?B?eVpycTZ2L2RLeGtoNU1LTkZyVGpDVTZDWHphbkd1MGtnUENlRWRzZEpVNk1U?=
 =?utf-8?B?RlJoK1pNL2Urbk1wdTkrdE5oTGZnSEg0VUdCbkhIcE9YUHFNVG51eVBZY0ZB?=
 =?utf-8?B?REdKT2FhM2tCSUhkTy9jUzBpWmxPRUFUZ2hNODRkQ3lNeGtDVXNsaDE2RU84?=
 =?utf-8?B?NjdGcTdWMEVWNzJkRVRDZktGRDI2eElTejJIUzZaV0NmN1lnK1dRV0dBbUJ5?=
 =?utf-8?B?NHZ4ME0rQXRaU2dPMXd4cnZXQUgrdmVxaWR1bGlUUUYzeXY2aWVjTDM0ZUFN?=
 =?utf-8?B?RU5uRTBEaGgzUUtsd3dYWmJCM1c0eldia21NWDV2cUd1N1p2dWJtekVTbjda?=
 =?utf-8?B?aS9PZVNiMDNRdkY5TW40NGtXeGpta2JoaTd1ZnBvZEc3SWFUY1I1ZDJwdnA2?=
 =?utf-8?B?V0IrTHc2TFl4d1p2K2tFVFF0d2hreEdLSEFxU0RPZjIwSHI3cFJyRzU3Y056?=
 =?utf-8?B?SkZLbDFQNWs0KzU2UzJWTnNzcTZ5ZE93d2hOSGJWcjMrTVZnaWNpeXNhMkJ2?=
 =?utf-8?B?eTlTb1FhV1Iwc1ZPOXZ2MWVERTRqSjZWdU0xV3ZvcFJNS3lPNUpZam84Sm1h?=
 =?utf-8?B?NklhZ2pmdTgxK25jVWhkZU9sYWZVR29hdFNqcDR1OVN4RUV2c0VPZGxvMmRR?=
 =?utf-8?B?ZktrYXp1c1RiN2pFRlhRZ0lQUmw0NU45TG5qam1rSncvZnVqUmtqdFJtMHND?=
 =?utf-8?B?VTA4ZHAvQmxmVnNXUVhFUHVzZnREcjQvc1A4K2JGanlMNjBySTdhdm5QS0pO?=
 =?utf-8?B?MjhKUXBJSGplRjk4c01HMGR5azVUa0JVY0gwMmoyR0NPdHpUTXo0b2k5WFE1?=
 =?utf-8?B?UEFaSlJaZFZubzVRakcxOWUwYk1HK0NtQVJ5ci8vVndTOFhMRjBORU44dHM0?=
 =?utf-8?B?eVdMVGRkYjU4dDVNeWhWbURIbXdEUm1mK0dwRE1RcXN2UHAwQ0wwRkwvNFJC?=
 =?utf-8?B?TkFMelIrcG5ENlplaUx1ZEk1QnhJOGc4TWRUWXFJdXd1SkZBRUR1aHdhNmdW?=
 =?utf-8?B?eEQ3Nk8zQytUdTBRUm43eFl0SU5XZUJCZnhZUTBnU0FwUXdPTFNuK2dJa0Y2?=
 =?utf-8?B?a1lHY0xQM3Y5czFTSEVmWUN3ZlhUVHdaVGJ1N09EeFBSdWJaOVBIU2RscjFs?=
 =?utf-8?B?RkJrMWV4WkhQdVdIN2pmdDNQTHJKVExxVitCWGEwN3FIWk5mUitLYXVvMVlr?=
 =?utf-8?B?cTVNU0RIS1V4QmtZWjQwc00wZE1xNzF6azl6eXMyRmEzRmZvNDh4NXNQMDN0?=
 =?utf-8?B?U09kZVI5R3FlYWx1RlVTdWpSazhMbWNmQnljVDdtZm5BQ09ORmt0OEp0UVph?=
 =?utf-8?B?ZVJzY05Id3dmd0xzU2xPZjMzTy82bXN1QTlsaFdIUExlc2I1WndBVTZsSFRn?=
 =?utf-8?B?dDBleGlpdzZQbEQyNC8xSmZ1eWo2eCtGQm82QWlEMkppanFtQ3hxdnRINzh4?=
 =?utf-8?B?eUdveGdadTJ0am1NaGh3d1JEc1V3THpOQW15SUtoYStPSHRId1ZhanJjV08r?=
 =?utf-8?B?SW52cUFOa002R1RJN3NLMUN2dXBjellrNEY1K0oxSDZBTkphRUNzTlNEMnA4?=
 =?utf-8?Q?SVkK83x3jykiO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e489e160-83bb-4e2e-a29e-08df4c99545f
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:15:54.1873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 04/14] package/gstreamer1/gstreamer1: bump to
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
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
