Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34AA606A329
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r+G4gGgo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=TfUtDn3j
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C31E8606A0;
	Sat, 14 Nov 2026 10:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LkSyPUaZVZ42; Sat, 14 Nov 2026 10:42:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FE7F6066A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652953;
	b=IpFev0R5V8FuHZyOeEX/m0WVNhI2kOkHuHfTfx4JuWxmhFg0T8/4trpDOTkbzodnkJsB
	 2MPMxAD4xTBV3nrCMWxWDHSY3clAL6l1YkW7Uxfjdd0A+d57J/ACIwjn6SH+rKHtsqDg/
	 9LtWPQXkfzW7SUGYMHR+4dpsURGsUVkLuyolu4MzN40rWbsD/yECuPxCiycSyJ/T6L/as
	 XcbR+ZpjRWaG1p89H7XuPLmeBssikh4veHSzja0Qpkl6NTL9+5lMz2nkIYk4S/FY8aKBe
	 M/UjcpqMjCbY8E9iaznZ/XHKaCyB/h7i8000SBa86UCzCrVrgIObaTgaguGS13iJjLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652953;
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
	bh=cPwBgYCYV0VadyAZ77YjlykXTO5MTnrgHJeypqcJLaY=;
	b=s6Z9TIcl8PuFfBc02ugtXvTqnALfMayrVhYFKaNoGuCsQNgM5a3lWoO5yen5lGIs6SZv
	 bQvk/MR43prty3H0ofNA2tP+puhuM3Z8FBqEiXFe5egD2zmU8WpsytZ2Pb0eioM0MlIpW
	 EM6XpQv4uGDMN3OZPCBeC/WLh/HsTmEPx1FtSUDZwse+hPXYsK5GVVSyCpMjTvW88Zx+p
	 oIs1SsF5qartwKpNSqeFy4M2IzxUJL97ITiCe3D8lOMLS4RoJtqvA4z0+CJU3jj/IKpHm
	 RkXcDkY7WB/bi6bX481EHwNsWq226c6Yk/f5+h2ErON06myawnHOlti3xA7Ay3Mma0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652953;
	bh=cPwBgYCYV0VadyAZ77YjlykXTO5MTnrgHJeypqcJLaY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r+G4gGgoRjWIppY1RLSiU1yiUomDEQJs9HIeE0eiDdcqApFqwf22ulWZ4BwpA9MN4
	 ucwhfDhJlSK6Rpq79oM+68gMO0+3BCwXyzQOIYokmmSrOH+doAhmzcUmxO2e7nuGLJ
	 o7XotfAzeF3DzxIk2+6Qsysm4vJ6sXU9GyBiV1QxS+rDfcBinjC1OoIVVO/Ors+kMz
	 GlJlu6PuHkDGykqVdTVXHHhMaR7degN2kNSqCtndOby7HKWvdhnqdX9ePw5WQMXmyQ
	 ApJL/Q/PzNufhmvYU+Cbp18yfQEKA2NxZL/+lv8WS1bAv1HayqFcPZcFdudGXO58dC
	 qc/4k5UP6GlMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FE7F6066A;
	Sat, 14 Nov 2026 10:42:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C5D072D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E687F81801
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nwg5tbfpV9zD for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CCAF381763
Authentication-Results: smtp1.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40d::2"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d40d::2;
 helo=sy5pr01cu010.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=TfUtDn3j
Received: from SY5PR01CU010.outbound.protection.outlook.com
 (mail-australiaeastazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40d::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCAF381763
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RWPM5u6786Y7CEtKmTduHiiERgZ7WsuSyZwR8xGw2E=;
 b=TfUtDn3jlZPELs2dlWo9H2+1wwkkuwdI6eZ6zp0fytXdXEElHs4zj+nTHB9Yu8QOkpQkBD2sktFZeJBCAIPB6/dAkT2wIsim5cKQ7gqNUHZv6r0DpR72KQHL+ddeD2Z/YxPg1SIxZRQNUGUrOeZmqr6FeiWipCb3PT9kHbo70u7VO8cY1KPTiNm4tE6j3MaJaj5klkcIrfo5JBmyEYKVCvd4fnsCEXoMmf2BZ4sxnMKIBnPcCIzeD6tjd0HOGA1BwzCiSYIWN5+WjbJiRxneX4JR03e8i2fZWN2iLhc3QvStP8OycpJ50ko63uPnI8cd+GtqGYl5M5ah44yC516xpg==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:24 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:24 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:20 +0800
Message-ID: <SY8P300MB0041567E5E006F3C5FBB17D7B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619; i=tfx2001@outlook.com;
 h=from:subject; bh=OserjkN08RFPjBbHfPG/XS4qNHM52AYK3dzbj1KwQro=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpWmBtVrZKS3jKJwQNEhu0w7hlqZBHs2LDgO
 Cs78OlQ0GmJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6VgAKCRAcD62l0/wL
 2gX7D/4iwl49RKvcDYHNcVCvbvUTuUoSiILd21ONNcl9/3xz/kwPKSV7pKj75jZdHS0uq0HRTtM
 5TNYdze+iS+1S+Nt45Y7g/q6eMzq6dgyhS06/EkXOk0eb8grdnjLXwwI05EUgMr91h7swbpYkRY
 ZciF7GRCRkxro2ORXWiacymmBdy01yACl5BDZ4X23G+A5CmHl741gYJpLern8WiJkp95e+lBgI3
 tOOs696x5dhz0FD0T3H2BmgzZgUMPmLNKqSLjEpG7t8B+ySUeKCuynRuQ99wE64la6CzIy5YU1a
 61ZZnZdI6tr/21lF7qJ7Z7GZ2MvESt92PCnoMBlzqigrHy5KQ8ib7zsc8cTe1+4n7/jmVXhxu1d
 tSVLcP7R7BSTaQAHv9YJh2jvMDYaD1pBdq3f3rC2sGWJoHkpAFvvOoiYagM24AxztavktEetgq0
 181/KB/0avVdDXStnqa2HrYg8vh3808Celt55J96+6zCJFzz9z3Nvj1+wNmgoc7uQ//QAa10gCl
 baGEZPpeaISQBquEWB11Ut5Jy72he/usgibRIjrDLFMiWu3RNtjk/2dMJQ1Xo+WGbPwUK8pypiT
 4se4pSDfJJgxRWA/nzANjm+1KNqyxACsHwWZ578PHwQ/wF5j2nSCgqBLy2GyeQY2RRlDeMzujcX
 fgxBOeZn6+oVkNQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-18-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: c247b05a-cf67-4080-37c7-08df423bf80b
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDc1eGhBaCtpUWxJS0FPYk8xdzJpZHVDSkxQNW52V2NDQ3I5SmRzaXQzTzBY?=
 =?utf-8?B?aTFiUDRIUlgvYlBMNGROOTRIZWxiMVAwSEgrdW1hc0E0SFRNN1c3bkttOFRk?=
 =?utf-8?B?RktDV2x2MXpzbnRnbkUzODZLb0FTOXJjcExiMEwvKzF5UmNSdURBZTB5NDFI?=
 =?utf-8?B?NXRDUi9jS3dIUFZIaTRQZy9wTmtZMHlIVmNMaTFCYVJCMWkyT0pSZGluUUlE?=
 =?utf-8?B?OHdxSHd4bEFGeTRFemhYcU5pRlJoR1oxOXJOTDl4ejFxM3dTYlh5eTd4QTUx?=
 =?utf-8?B?UUc3c0lkbVl0ZUxKQkM5VGR2ZUlEcmxlSWhsenhNL01wUE1nbHNLQU54L1Uw?=
 =?utf-8?B?RXEra1E2RmFVNTU4bGpET2RidVVZWVJkM1JKbExxUndRY1lQT3ZxNkJMWnBQ?=
 =?utf-8?B?ZThmR1N2ZWZGczFPQ2xZMUNyMWVIWUQ1aGJ6blo1SGo5WlVPY1VVZG12RW5q?=
 =?utf-8?B?aXh4bEdxNkMwTVpMclJLYlAySGh3cG9tdGlsL1JIZlNDR3E3cXcvNVN3dkRL?=
 =?utf-8?B?T2tkRGIxNHNZRkF4S3oxcDI4OVQ5M2I3U0lQVDdaN0Z6ZmlUdVV0Tll4bzlP?=
 =?utf-8?B?em4xbTBUd3MxR0MyeUFaUEFZckdGWHVSSjNzMlNvaVQ1UThDdDU2TE41c1NG?=
 =?utf-8?B?ZDBDRzNzdnVQeGF1SWdVTGZmS1V2U0diYXd4WVBhRWZ0Zkx4QnNDOWxIRGhy?=
 =?utf-8?B?K2kzdldwa1JHM1ZWS3VQR0VXM3g5WlcwbzVEK25mNlV6dUo3WmM2cnYzeWFF?=
 =?utf-8?B?MFk2V3NQVVU0SHBJZWpyb0szQlJSbVViRGYrbG9HanlZN3IrQWs0ZG54M0lU?=
 =?utf-8?B?QzRweUlVaElPK0gxMGZ6MWxZUSszN2tSMU5rcTl1L0JkdDdMcXpJMW5HR0JH?=
 =?utf-8?B?MGR1OWJTMU42Q1k2b0k1Y0gyWEVCRkFjc0I0MFRlQkhrblc3eHJPS0V4V3VR?=
 =?utf-8?B?QUV4WGZob1cyVU1FQk9oR3ZHYmRrR1BUV29rOHIxUUp6SVJrb2JuQXZqTmsy?=
 =?utf-8?B?a2Ivekxxb1lSU21oOTNmRUgvcDBXSVdaT3dnMUxKR1Jubkk3UFJkNmZCMnd4?=
 =?utf-8?B?bUhCWWlWRzVKV1lIbGhESmhOR1BVLzNOTWpJMnVhMlJmNzVRMG5DSUo5YVEx?=
 =?utf-8?B?amZaY2YwVW5WQkRHM3Z6a2hkZWZmVkZmUEsyejdVcndHN1NCQVh6VVNwQkdU?=
 =?utf-8?B?MEFGS1V1S21oSUFJRDFMcmM5SlgzcmRqSzVVL2NCRWprYUdkQmxNWmpROUpP?=
 =?utf-8?B?NHVXZG1CSWdDWlVTOFVBaDNxRjRWWVN6d0ZSUGRDdTNmdGdnQXBIRkJRY1R5?=
 =?utf-8?B?QlRKNWNNQTVFakVzTUpwTVBNeDFneDliNWlCam9ZRTZzVGFaQVRtRVZ1cE1j?=
 =?utf-8?B?K3QwdWxQa0VpcGhvWkhzMVVsa251REZqYmxpcHYzZHRHMy9JYkU4RzJVMGpO?=
 =?utf-8?B?cnhydVd1U2Y3RG15UWxNMzk2Z05QNUNPTVBLWTV1OW1zRzRZb2c0cC95TXc5?=
 =?utf-8?Q?WJ0Jn5LEWy7Wq0ymYUAwEM0aUhV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG5NT3ppVGdjYzYwRFZTWW1YUHRIR1I5RWQxRzlxTDlxSXJGRURYK2QyMFVU?=
 =?utf-8?B?aVhobzJGZmFBQ2R4cmhacEhrTnEwV0JMckhyTXE1ME1jVkdBSEU1T2pVWVVu?=
 =?utf-8?B?U3pQRzkyR0RRZWpGRGo1YVFqb21IV245S0R4OVpWb0d1Y211aktKOEVsV3Jm?=
 =?utf-8?B?VldDakVTb1J6eFFBdmRWaDk4WEtNUTJuUnluaGk0bmp5NTZvTGZjdCthSG9v?=
 =?utf-8?B?Vm9GWDZSQ3ozaTFpV1dqdjhWWEcxdVFXT3g5WUJHeTdvSTdpRWl0WkpTY204?=
 =?utf-8?B?SUlUQjd5Y1kwYm9ZczZCZlRjWFNYREp4SDlBZXE2VHVuTTh2Y1Bpc1owbWZ0?=
 =?utf-8?B?a21DYmlhS0NEL0tNNmVablhNajc4OU9KS3ZUUThHdmt3aVhTRjBxS0o5Sk9p?=
 =?utf-8?B?Z29uSlQ3YXJiVFprT2k5Mm05UXZsekpjSm9PbEZPRmFmZER0TUZTRksxU2hx?=
 =?utf-8?B?SERzQ1lpSmxGUjJlRkQ2QzFYZlBRUm11L2dqbnA1Qk9KWFJYSmlSRi9LM29T?=
 =?utf-8?B?QnlTbDBxT3FkekFPbkRxVzFZQUtJMXFDczBnTEw2QlFPOE9wZmR0MzMrZWVk?=
 =?utf-8?B?Szd4MS8vZWJ5cjVZZkZaaDNxYytQU0g3ZlZUNTV5RHhHUkF6RlYybW10eUVt?=
 =?utf-8?B?aXN3SEdHNFVTQVpBLzBzdWo2eWh5OFVsT0RRU3dvbG9VQTZaSWRyZnB0K3ha?=
 =?utf-8?B?VUxpeDhLZXMyeEtaUHhFQXA5QnNSa3poTERkd2xlcTBKSlJJYlQvVEY5aEVn?=
 =?utf-8?B?TFNRSXZsSEhtTDhadmFjemxJT05Ma09rWFF6VE5BOExqZExUVzFsN1lHRzBT?=
 =?utf-8?B?dkN3WEhabGsxMGVaTHM0NUVVUzNHSkI5VGhFazVRc2Z3bVZWUEg3dU1sSmpS?=
 =?utf-8?B?dDdBeVFNVjlzSzc3cWdSUGhBbnJ6bjdkcGxFZ1F1Zzl1bXJ5eG1UcEdYMi9r?=
 =?utf-8?B?Uk0zRTBKSW9nM1VGYW40S0NKVVQwV2tGQ2EwUVVPSkVuWkJleDF3emo5M2Np?=
 =?utf-8?B?L0NOOUdXS1pDYzVQUXlLbzZNTVAweEwxK2UxQmVSSXNpR1RrZk54QXlTbmNa?=
 =?utf-8?B?bzR5d2N1L2Z2RFlkd3pvQmhTN0xtdDM0WVp3TlBqb2wxUkVBSzIzWGtqU0xn?=
 =?utf-8?B?ZWNLZFFJd1NBYWVleHhxNGV6UVRXeVhKYUROSDdhRDQyWGxhN2NENDJqS09U?=
 =?utf-8?B?YUFrZjljNWprRDkvZHpObm5hZ2kzSFF0NnlSM2V0WEFHZ0ZXTHZ3eU1GWGlQ?=
 =?utf-8?B?dlc0aUZraTArYmVLcXIzWXovL1lXdUdYK3pUZjI5MFdoUDhpdDRkeEJFRnFm?=
 =?utf-8?B?R1hUQXdpc3dwTFpodU5pNFR5MFFQM2RMUDk0elNRRjdwRHRmUzNhRTdqMUJk?=
 =?utf-8?B?cWxjd281V3FPOXY4SFJiYlhlbi9LclorK2MyTGI2NW1SSXlMcEZXbm55TWFW?=
 =?utf-8?B?NmVVWXMwbXJNeHJxbTdDVU5sb1NhRDd2ZjhmemFnQlF1dWJXSTRVOS9jTmtt?=
 =?utf-8?B?cUNJSjZYY3ZUSkIvSHhZUTNxTElrU0hPelFqdzd4dTVFd3p0UURtc294bFhH?=
 =?utf-8?B?dTVxM1c3NllWaUJwTkM4elZTckRGazlKRHcwRXp4OTBITm00RkRveUpac0pT?=
 =?utf-8?B?dE44TFh6NzF4RHh2WWJ0THVkOVlFU21vaE5RTTZUVFNFK2tsVnZkbEErRncr?=
 =?utf-8?B?VEpiQUtOZUo1VDhKRHkrQXdUaml1VzFpSnpqSER4Y3FFUFJnZlRxMGc5TVRu?=
 =?utf-8?B?dlE2NzZyTHFzNjhXUWd0dXNNbXRwZVhWZEZCckdmUjhJQlBNQnlKWWpTeUVJ?=
 =?utf-8?B?dG1JSXA4cERjYWdVbHVLa2VOcExhemcwYnVSOFN0RFNYd21hcmN5dEIyeFRq?=
 =?utf-8?Q?rZX1kN+3guYGJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c247b05a-cf67-4080-37c7-08df423bf80b
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:24.4027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 02/14] package/jack2: depend on python3 for
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make the jack2 D-Bus option depend on python3 instead of selecting it to
avoid a recursive Kconfig dependency when gst1-python selects
gst1-plugins-bad:

gst1-python --depends on--> python3 <--select-- jack2[dbus]
  --depends on--> jack2 <--select-- fluidsynth[jack2]
  --depends on--> fluidsynth <--select-- gst1-plugins-bad[fluidsynth]
  --depends on--> gst1-plugins-bad <--select-- gst1-python

Drop the redundant selection of PYTHON3_PYEXPAT, which is already
selected by dbus-python.

Fixes: ce4795e22e0b ("jack2: allow to choose the mode to operate jackd")
Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/jack2/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/jack2/Config.in b/package/jack2/Config.in
index f5ac0399eb..fae6b7b022 100644
--- a/package/jack2/Config.in
+++ b/package/jack2/Config.in
@@ -32,16 +32,18 @@ config BR2_PACKAGE_JACK2_LEGACY
 
 config BR2_PACKAGE_JACK2_DBUS
 	bool "dbus jack2"
-	depends on BR2_USE_WCHAR # dbus-python, python
+	depends on BR2_USE_WCHAR # dbus-python
+	depends on BR2_PACKAGE_PYTHON3 # dbus-python
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_PYTHON
-	select BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  Build and use jackdbus.
 
 	  https://github.com/jackaudio/jackaudio.github.com/wiki/JACK-DBus-packaging
 
+comment "dbus jack2 needs python3 and a toolchain w/ wchar"
+	depends on !BR2_PACKAGE_PYTHON3 || !BR2_USE_WCHAR
+
 endif
 
 comment "jack2 needs a toolchain w/ threads, C++, dynamic library"

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
