Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE754606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H2R/L8ea;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=EkjxQzXQ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 997F28129D;
	Fri, 27 Nov 2026 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvC2WRUdeAii; Fri, 27 Nov 2026 15:16:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3594811CA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792582;
	b=QvwdOfV8o5aR5XPb4lATkNKVzaL+b0kocJn5tTBCLJiqIGzM/JRvXxe8tFqniBc4Rmji
	 1r7D1aG6YDQIaEEt/xQeR8D2X0gs1moaFI3otp+catecDnBp2J2UOCj+K84szfXWcrDG2
	 g9QN8DfwayDV5+BJcTFV0FLqMFe5PuOgs7sF7Vx1jWk+hKTBGv23GPMYEUgWxRdjCIs4Q
	 SRo3Kcs5MhTvb3/B+ajhZcxtTrNCOm1LjhMvIa/2LjNSpXp7hUKmysYpKGaRUr7mxPgls
	 RyiDHULPW5/PKdmc9gT8IkHdEiqa0s6PRiDd9BOEqbcBp7TNZAhbo/3GcgWyvR9qrBQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792582;
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
	bh=bMHE0Q12wTVB59ShBtpzSbXf52skSlfXhos0qogVrjg=;
	b=RP0VQigB8Cwotq/c4OZLGu22aU5U1pIk62GlSdQemO4wLpL01Q6SF6qMYQKSafhHV51r
	 v/eHJj2OE0PnfJSYoDlswOb5hp4TqWA1PYaMSylNmV8E4A7ijTRssm/u1+wqaWSFNkm5a
	 1o4BaxUPYq8cy0fIWV4yb4a374eQ2EhqleyOBa5MWXr2SW7m+OXSrDUwWxv0OaCEZ3LDE
	 LaKhoZ9+/qBbHzBgXNbObDrdbMv8Us0ScmidEiQ7OW9X67Q7VbQgj+DhZmqW7swnar0PC
	 PMfrk4sl032McRL/qsJY3DUurf1ztm1k4fSVTArkpcHxKOy251GKjqASNl/d5JBg/Gg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792582;
	bh=bMHE0Q12wTVB59ShBtpzSbXf52skSlfXhos0qogVrjg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2R/L8eaEyW95hmAs25M68xMpCbnwAkQKu1lLOpbf8kxvILzkPCeW7eE0/o4LzfZY
	 X3lBSPiXG7bpRW5IDrLghxNuPDdiCVSpk0FTyJSl8xI/IY7xgwCb2HAjEyA0tCLaz0
	 l5bhzS8fTVkRI7i4FCPgxELbOwmcD2aVdLC++iBCyXFeqPEIbzVscKWGYESyFn5vsG
	 9KL5ut4LEEPFVRoBje/E/Dc0LWZspRiSKB6sUkHIONB0uBceum6UAvOvxkE5blgpiV
	 gDMDs/o4BvCN/z360o8PEzNus8es0QxwQwlbdYy0I/rrLKkhJmd6AEo+08SZrseeGS
	 A63kyQCaAV6+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3594811CA;
	Fri, 27 Nov 2026 15:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 460D92BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38267605F1
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5A5qUNC_C4h for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0A1E60D71
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::1;
 helo=sy2pr01cu004.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=EkjxQzXQ
Received: from SY2PR01CU004.outbound.protection.outlook.com
 (mail-australiaeastazolkn190110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0A1E60D71
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgl35N2V2U1kTCR41LlrzjSSUdqtOQNrwuOnlxi1jhU=;
 b=EkjxQzXQzEtdt0Lq7mSWbOn4DMjIHS/TkrGnsDElTmzuXrb3SUM4IyN3P3krEpUAB84d7gCGkwbITRzxTndqd9KYedrDiM+gRpO0x+Wrt345V7XvrdAbD3vMbelQ0jqKWX3gl1VfnVIV+CudySMPyDCkhtyWWRC8y1IrCTi+KmAFpPuv2W45pqV9VOiecqCY0ReQQTwoF4/jSsA+oTuOtj1QVEHtkq3+AjuqGpCgJd6T+5qdj6HYEftB+fFrV4nQTtaxwpL/p5/dtbtEasuvNWFucTkDQhFV0TBM+G4ecVYr72clQIEiEcCdU9niNNMsoLUbINPAjvyhu/AQG2ZCyg==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB0017.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Fri, 27 Nov
 2026 15:16:11 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:11 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:12 +0800
Message-ID: <MEUP300MB0045CD3C3BEC41E25A6414B7B5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=tfx2001@outlook.com;
 h=from:subject; bh=GPJUQ+DgWWJGubLOwD9MkUU5MathERBUMunSxLO565w=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ5AGwLyH9fnp4zZasBij5gaPlhke2yku4EyB
 HL0L4ONLNqJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmeQAAKCRAcD62l0/wL
 2qFEEAC4yUSd1bfxXdm9ZQjq1QaM1WgcW9fqIIqoed7hZQ53061lpWwBPC1y7g7KvWXsdxOigag
 SnBOBGi78qzJRn/q4PvjPvDatohTYc7hKfPOJf/AP+APRYKriwjKHlA+IUmPC5EIsRnu2SWOGKB
 KqVSUXTkFBJnDg9mo4Ox3nTJBvD2JEinL4hxiNuD+7XwXSYq5cK9vWTg0AaEvzIDNLQdtH/Ya+j
 t64xoZnQtYKAN1F/DSsMF7FuZFnY4VcInz45JJtFWr3Ch/XyW8cRqnskKl1UCQOv/O/xRKVPNyQ
 djiYKCK1VFEOojcAaGVqp3E27spMWgtL6EyBg7cG+1RDRWHKCwZHW3+mbAKG/0QZDv3ncMtyJT+
 lOc7ziUy1TyzIY/c4YYHnDCdYcYTCaXUtAkpCBfXlbCxF89wUio9YE76t/iShLtPMLbvRHF3xNG
 PlvyAXbXupQS8zcnvcd6SRsxk69Gn24744aQmZmZDA5D65u2N17L4PremlObjhCyssMbi/P9lit
 kDEy9cxIrHaRBIX52wo1MOmISCws8rcke6cDP01ERVxVvj5SUlR/XqeSXsrxOmhSxlfDMiE9cEd
 Zxc5GPfBCQB/NJXpSI7EUs21/xgOjJ8zpyccC0e9oYYQaXpAGJHZ+7la+NcajC+JrIHJJAoekuH
 P8B6FpX9KhXPlhw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-26-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB0017:EE_
X-MS-Office365-Filtering-Correlation-Id: b503a053-4dd1-490f-55cb-08df4c995e57
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|25010399006|51005399006|260925184616899003|16051099003|24021099003|19110799012|8060799015|5072599009|23021999003|15080799012|6090799003|41001999006|1602099012|10035399007|40105399003|3412199025|4302099013|440099028|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGYrRzhRaVJDQlA4VGlrT2lLQlorZ3dLb0xETjVwcU94V2pIdzlyVnpERHgy?=
 =?utf-8?B?UWw5UDdESTlwckN6ZStNL01WQUNWV25WZ0hXWWNoUi9rMDcvcGZESnRVTE5Q?=
 =?utf-8?B?VGkvSXl6eHRmb3EyNEgveGpuU0l6QWdmU1hLMHo2blBEbFdsWWcyOG5lWkJl?=
 =?utf-8?B?SDEwV3ArZ1BDa1JyTWF6Qk1jVnNxT1Z2aXo3b1hXRWw5WGdCejZENzFobVpr?=
 =?utf-8?B?U1Y0UlFXMURzSUJ0QXdMVmZDa2ZpWW5Xb3hlZmU1bmtQb3J1a2haUjF2ZEx1?=
 =?utf-8?B?aDlyUHpYUGdkUzVSUXlXVTZBZDV4RktwbE5lMm5UbEVKZFVSTkowOG9jNGY3?=
 =?utf-8?B?OW9Tc21IN1JHODJsZjhUSnY3ZHVxWks5TVFQV0lETlRuVUFkQ0NQYjhpOFpr?=
 =?utf-8?B?S0V2VnBMbkpBZm1wS2hBbHArM0U1NzNNL08zREJnV0cvVTA4cjliNnQ4T2I0?=
 =?utf-8?B?M2R5Q0pUTUVHWVI3MXZCeEN1RmN3d1N1V293RDM1MEY0bytod2doQjBjZ0FR?=
 =?utf-8?B?MWpkeVNYTTJYcUVPSFRmMjRBY0NWN3JhdWdSbC82d2ZOc3ROV3ZQbFE4OWEy?=
 =?utf-8?B?RGpralNWdW8xeTIwTTdtOVkrUThabWh0N2JpdUxONzVNTXEwTjJQTk12Q001?=
 =?utf-8?B?NDYzTERiWGFCVDhaOXJzK3UvZmFnYkRCL2t0U1gxSzhOTkJOei82R25lRlpl?=
 =?utf-8?B?WndGWlQ0cktRdHR5eUdvcW1uUCtzR0p1T3B5WngzcUJCUUVsdXphWHB5ZU9r?=
 =?utf-8?B?RlZCaHQralkyQU9nMlZSS2R0SGlweHBQa0RZVmwrcjhEejVRM3Z0clcwNVdZ?=
 =?utf-8?B?ajNkZm9ZUG9vYlo2R05ZNDFSdDBTTmM4M3BTWVhwMzFXZU43NmNxY3NVdnpP?=
 =?utf-8?B?ek9mNkYrbDJvRXZwV1pDY3MyT3Bua2pzUmIrdCs2bDV0UlQ0Y1JqU3Budmxh?=
 =?utf-8?B?TkI0ajQ1WUdKTmswNm1ZTHhubHdaNXFaUWdGZGpwalNLd1JrNTJoTXdVSmoy?=
 =?utf-8?B?SzR5ZEZUVzBWZ2Y0TUpMTXhMWVhTdWticnRWTjN0SmJkQTRpRW5UcEhuV3Nz?=
 =?utf-8?B?a2pSVHMxTkMxS2kzVzUzbVAwajVHZFVRallrQ3VLMm9vRmNVZnZpUTBXS0lV?=
 =?utf-8?B?Ym05SHNVTk5yQ3ljYlVuUmJzVkc2NDNQcEFBbTJ5SUZLUTBwcWd3T0xlbW56?=
 =?utf-8?B?WUFZcWlORnp2b2x0UFV1NEV6Vkhzc2JKN0QxSm92N25JaGJvM082eG81c2Z1?=
 =?utf-8?B?TE9rdVJxYllwVU5QbHhLQ3JhYUo0YkREQ0p5MjB0MEZOT3J3NmdrV0RPbEZq?=
 =?utf-8?B?TE1YWUU2ZUQ2OFpzamN2WXVMRmhJNlR5WVVGQkF6em1mZXlOQXIrcUxDL2cx?=
 =?utf-8?B?c1dQWDM3SERjSmpaZndlQzYybkNhV0RjNEhYRkk5ZStxaElRSlk1UlprTnJt?=
 =?utf-8?B?TjhoWEU2MFBkSE1TOFdDOGM5L1RYQXcrRStId1hZSTZUZDBXM0NOZHYxR0t0?=
 =?utf-8?Q?KRfjlE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDl1bVIyYmoyRHFJbDk1YnBvS0diSGtPUFU5ZUllWkV6SXcyMXgvMEdvZFBk?=
 =?utf-8?B?bjBSRlB1SThmYmpTaytPUG10b0k0M3U2YUpyQWNoVVVLMmpteG5kWllERGR3?=
 =?utf-8?B?MkVkS1Q3Sm12Y1BVV2NzeGE1Z1k2NkJJd3cwM2V2NklkdGR2cXlFQk9ha3Bn?=
 =?utf-8?B?cWU5QkdCUGEyU1c3OTl4SmxCNVBQaDJBTTFSZEJvenRxamRmNFg5Uks4Ui9Y?=
 =?utf-8?B?TFhtZE1TdUU2SjlPZUpGMjZPanozNE1KWFpRdURkYnZoSlJlNHBNTFE0UXVq?=
 =?utf-8?B?L3ZHSHdKUVBRN2xMY0tsZXg1eHhpMFU3V3piWGtsMmJCWUh5RktNTWw3VFFC?=
 =?utf-8?B?YXlXMnF4ak11eXBhUlhIRkJyQ2JOZXNFL3FHbHphRUZrWGE4aVkyT295bnh5?=
 =?utf-8?B?WlVaYk1PcTFkMDYveHp1dXNDWk9DZGRMWHNyVy85MUlscjBUT00zRDZiVzl6?=
 =?utf-8?B?a29iaFpkTUwvK0JwS3BEazZLd2dFVVNwRzRrUnZVZTNGTm1mWlBqdy9QNHJL?=
 =?utf-8?B?NUpqWXVzMFdkendZbHVZMUliMjI4aG1mUnRPMlNaSGNMWlpJMnp1eVNBdUdp?=
 =?utf-8?B?cE1sM24xZ05yaVJZRGlhZCs2cjkzSXZJUFRBRGVNTjR4OXQ0aUhHTFEvbjBl?=
 =?utf-8?B?WENMRXdKSUI3Ym5QbFpPQk9ibTZDNC9ka3ozaTI3ZUJBTEc5K0U0WWFreG5o?=
 =?utf-8?B?Nkk1M3ZpRjhLbU1BUkdHSkc0VmQzVi9XZnp5cVdMcWRkTkpEZ3M4ejl6enov?=
 =?utf-8?B?eThpY01lZWRlbjJ3MW45eXl5eTJRVGs1T1M3dFVPVitGMm5GR3lBVDAreTVJ?=
 =?utf-8?B?M1NLMW45Q045Y3p2TUcyTjRUQWdOaGN4Z1dOODl3RjlpVkU4a2Z4QjRJT01N?=
 =?utf-8?B?a01LaGVoQXBrSUVSbVoycUM2L3pucXM5N3JkVzVrOGNINTJZWlEzMXF3RENh?=
 =?utf-8?B?UFdnYUJSNW50d2NvTFd6Ykt1SXBEQ1J4ak1QYUs0aWo4Q0dZcm9rc0Q0RGdZ?=
 =?utf-8?B?dnBGNmRsNGZqZlFOM1NWVElRQ01keWs4dDNZL3lWL0E0SmtjUm4yTmdQbitY?=
 =?utf-8?B?ZEJSbGxLdGZlZWFramlPRDVnSm1kdE8xOXloaFAvbjEyYVZjWEwzcE12V1pT?=
 =?utf-8?B?UDFzaW1NMGNCTVJMVHJmekp4NWhZSllZUDJXOWZpeFZCbFErUTBwZzBBMWNm?=
 =?utf-8?B?cTducDMrZUVEMEt1MEVtUFVkWDgyMVZ5aFNuS3dWS2MwU0wwQUdweTNhTlZR?=
 =?utf-8?B?a1hKMTBGSGdKVVNwMTJQUURVQmF1WlJDMlVVTUJNRnUvM2s5dWNtOG41VFAz?=
 =?utf-8?B?d0E2bUNaOWZYNDMzL2NWUk1xQk13TTVsYXZSa201Y2g5OGdaZllYTVdBbjM2?=
 =?utf-8?B?dFY0TFFWMDFIUVFNQ0JydzJOdjhGM1pTMGY0YUkyZUVISmU3WUxYbVJXUER2?=
 =?utf-8?B?ZS9Ma0VlbktqbkdtVlcxcEhmTG4zWmVGRVQ1QlpaVnBXemgzanZHZ1hhWFNi?=
 =?utf-8?B?QlAzR0xObHNXbFFjZkdldVQyeW8rdkVSWWZEanUwZGdyc0RheXU3YTNmUFNE?=
 =?utf-8?B?TkRKSWpxaXN1K05zLytrRStESkdHMVZpUXl4aGVBYit4NXduRHBBVnBuYndD?=
 =?utf-8?B?WExiVFRISFo5R1FTQXJOYThLemJIUnZNRXBzNENLNmU0ZlczemVxNjNQZ3VV?=
 =?utf-8?B?VlAvSjVnR1JnY0xUQVFyaHdidk8vQTRqUyt6WThOelhDcE9ZbC9GaHo3eGg0?=
 =?utf-8?B?WXBST2VHa0dtL0lUTTN2YktIRkZWem1MeWpCQXRQN3RHZXovWTIraVBKdVlv?=
 =?utf-8?B?eW5hQzhmMWlPekd3NlRNRGZjVzN3Vy80eEZYRy9pZ29BNVduMXZtSEQvUnMw?=
 =?utf-8?Q?AYcFQNQ0D2ir5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b503a053-4dd1-490f-55cb-08df4c995e57
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:10.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB0017
Subject: [Buildroot] [PATCH v2 10/14] package/gstreamer1/gst1-rtsp-server:
 bump to version 1.28.9
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

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Remove the duplicated examples and tests options.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash |  4 ++--
 package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk   | 12 ++++--------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
index 9fc7a0f9ea..4bbd63b8fe 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.hash
@@ -1,4 +1,4 @@
-# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.24.13.tar.xz.sha256sum
-sha256  e8dd102a3d1026414f0048daed91078e7958012b56efea7e45fe2b3448b42d6f  gst-rtsp-server-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.28.9.tar.xz.sha256sum
+sha256  b87ed564d857a226a3135bd2c42eae7b40eb64031cb9cbce124722af92cc8b9d  gst-rtsp-server-1.28.9.tar.xz
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
 sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index a3143f0c55..58b7c30dc5 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_RTSP_SERVER_VERSION = 1.24.13
+GST1_RTSP_SERVER_VERSION = 1.28.9
 GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
 GST1_RTSP_SERVER_SITE = https://gstreamer.freedesktop.org/src/gst-rtsp-server
 GST1_RTSP_SERVER_LICENSE = LGPL-2.1+
@@ -23,15 +23,11 @@ GST1_RTSP_SERVER_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 GST1_RTSP_SERVER_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Ddoc=disabled
 
-GST1_RTSP_SERVER_CONF_OPTS += \
-	-Dexamples=disabled \
-	-Dtests=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 GST1_RTSP_SERVER_CONF_OPTS += -Dintrospection=enabled
 GST1_RTSP_SERVER_DEPENDENCIES += gobject-introspection

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
