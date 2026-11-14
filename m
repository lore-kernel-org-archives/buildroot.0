Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A97606A329
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bucw4qCi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Vcpy9ofz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F2A081BF4;
	Sat, 14 Nov 2026 10:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zby7JjfCq6ks; Sat, 14 Nov 2026 10:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8979481C44
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794652969;
	b=Bw4jjJBPeB4xyTnAoZ7RsHK0MVopE930uOoPpQ14PFprNfTD6xtQIvddGM9dZw1Vz4Ne
	 kPpqeRLh9BvCUO50QJfN4NGaM+3rJwm4fZkgGq4YVWY8WVmfQ3bLvW4cWKY3fFSdta4P+
	 66hixPjuAhuwGaiALrUVuuXPctVAtDkzbRaPcTOkYPe4c030Fn/VUeLW4fHKgEDHO9PI+
	 14JGKrQb6BgK/rSW+/xMAnQqwDHQUE1wcwTUKoohww42SOtVbSLWdtLjPCGMxGwo7xaqD
	 vF/d2iGcX2YjGLcztC4I+7uEASdY71F+yLIq0NteglRVo9ZsNjX0Z7tm9uM+hdIrgeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794652969;
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
	bh=mEQWHbxpO96XEXTTy5MHraYro7HEL0Pj7P3SfxSXdoA=;
	b=nnbqpl5pqsf7oDXsaGsrK+qAzBWC6AODRYYfwQ98H5QgwtZpkyqF0pW0Kf7B/4SYZwxa
	 VfywpMDSdIi9/yvb/T2IyEU9+7tfIyK5bp7woRBr+YucsBoa12tK0ukOZSwLocAeQX1A0
	 UQP7/TeMMKlCO3pwLCbKS8i+QlFghfZhGI+i2uAJ+FAjZy0mSLnNPv9TcyGJzK4V1SId1
	 s+77mvSnXxxvou82Y1NwwyC7YQjGP7buXkJlldsOvIIw9zGnUWo+xYYsqdUzti0TwoMAi
	 k1HlVFHLlpJ5o+dHJVmHgN4Ozk2+sthNsbNAqBJnh6P2XKQQ43ZOuv9d1sOOpL3+VKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794652969;
	bh=mEQWHbxpO96XEXTTy5MHraYro7HEL0Pj7P3SfxSXdoA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bucw4qCiDMWfSFkOaEyFJA0Uij1G3ABYxjge4WU60sWteniOTWgSbUmqm5hM057PW
	 bGiTQWKbJJeubntxJqgz6Phs75yTExmGpiKT2v++TjqwrC6WJ3/tyfGIRUQzHnWyUM
	 8vxKR/aooW8SngSCdlAsVm8a9RW3G1NgK1X62fYwEhntfu/uMC2eMmALzwJ8WHu52x
	 GGs2Wrh0wY2t5/8FtkL0c/XaI4pRC8AUK++2mKgwxf54cUTfTSzT47CrWGq3ThmzNA
	 ao1uasG6XUX7h8S/PnmtueloCjzjJArddOYaUjN6B2XEB3gLoNZvSEiJpUeEn5DIEl
	 Oqcw4aQKqTurw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8979481C44;
	Sat, 14 Nov 2026 10:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CA7172D
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F20940E66
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ESG3ycfc2Ad for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 10:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B9DFB40E0A
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=Vcpy9ofz
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9DFB40E0A
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lROWs1blPGN6tBYtcekz2Jm30EwodAPN4FkBUmO6Bo=;
 b=Vcpy9ofzvfDUL+a+EAQh2Lg/Y8F8KD1qCBeVUJNkZw7dm2zd46RjztiD34WlY0EiMOFa7WjhZF4h5OvCa2EBAg16o9b6E9hjaFhXJ0oaAAWaH9r8cNBMX87YAB4Yh1igwfk5+Kdy11XARgLw/s9wFqzNYgcpqf70VBOIZv1hPI0KSYwt4FmbzHeahXtwD6JKXP68PDAaAs0zfFUCpjHchwoq/4SHLU4a5Bv4XO1s3b+oiA5F3ub6LTWXIaAHssCIjRZ97FLzBr6ZNQ5adLcIXhZmk/P0Jvd/z1l33IflyklbKKMZUKUosJHxvWrJwphjwZBjjIZwQwUaPKPnaJVdLA==
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:261::8) by
 ME0P300MB0536.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:22f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.13; Sat, 14 Nov 2026 10:42:41 +0000
Received: from SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222]) by SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 ([fe80::338a:60df:663b:c222%3]) with mapi id 15.21.0615.009; Sat, 14 Nov 2026
 10:42:41 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Sat, 14 Nov 2026 18:39:26 +0800
Message-ID: <SY8P300MB00413DDA28DF093111FE9561B57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
References: <SY8P300MB00418DF86E94A561402DE73BB57E2@SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316; i=tfx2001@outlook.com;
 h=from:subject; bh=1XS0/J1ug8brDVNIEPgLhyrd6Qm5kCGl0k8pyvrkGfs=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBq+DpbjtarMcJeEo7tWY9Wzm2AIW5GgV4RvY3lO
 sj2NfmDVgqJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCavg6WwAKCRAcD62l0/wL
 2vq8D/4k6y0b6ZmmR0VfwGxxkc362zL2y8YK5Vj3Uu0M0XsekDyLNp4kYMrtqRwggt2O8y+y1/N
 LDic4zkIyHA8IMlYPU+LJ+sMVktWJ5Y6swx8qUM776WBnHsuTsiZ+KbI1BnxzFKUGNZQrksI6od
 0fukzuvW6uuYyddvo1imxGzIXARR0JRHv570MT4MnRjhIllpAesk6GsDCPvyEv9Asfj33BOdqXu
 DD42w6YVjTt3whhXqblD+EKSERJ1m4kpBWbx6FRRssyh5+KPFmwJwHvbP96mev9c5vnW1thEj0+
 /9X/EcORCsH8Jme4mtJOzA4x8khNWK4kSudBMeya4YDa+/Mf5K1/6/7ETUkwOMdmANWvsEjpMeL
 EhjyjIJ1iZj/rn5jXaPSd/UqaWhuneFqrb7CYAfPuhJGHP4+5F4ZAjetl+15cSRLC1jRZvAEr+I
 UNVH1+yc2NVEaO8vPxbsgY7J02Z/FQo+nU839L1GHvCAB60skHDndMyQYrf/HYXKyvEpf5owTWp
 o+Sz0k4iG2LtFd0sDxRLf+vh7OYE1skPhQLU0WLLaTcAH27cDb2du1heXzpYWGP2vvQykN1mmoJ
 myT+KdRCev/JB+EQVt/eIxo2GfDeeERoT3/uK0YVfCum/zUPLwgIfTeAvNcfTNAn/s1vwGICXWw
 ACYkGbhVbG9YkXw==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TPYP295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::6)
 To SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:261::8)
X-Microsoft-Original-Message-ID: <20261114103917.2630100-24-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY8P300MB0041:EE_|ME0P300MB0536:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e12e0c-1b36-46c5-3135-08df423c0216
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|41001999006|260925184616899003|8060799015|6090799003|51005399006|19110799012|15080799012|16051099003|23021999003|24021099003|5072599009|25010399006|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzZ4TEE5T0lXZ2YrT3hReXBhWjQ3RzJIaU5VdVd6dWc4aXpwWW9iYy9LUjhk?=
 =?utf-8?B?am9WWW84VlhheW1VS25WMTFocHJnYkY4ZXdNMlFhQWQzUWJFMEZLNk83b3JH?=
 =?utf-8?B?MFdSNlM5UUxxR3pnTFpFS09XamZrRW9GMElKT1lPL2I3aWxzbGhyOG9BWEdi?=
 =?utf-8?B?R0tadzFZMUZLR1EzYUlQMXB1WjN5MFF1VlltclBIUTZnR1M4K2pJWXBMd21t?=
 =?utf-8?B?K2U0MWhsNmVIZWl1WGh3bDlDQ0lrQXBzbjU1YSs3dEl4dDduNmJxak05dFRa?=
 =?utf-8?B?WVliVE9lZ09HMUJ1VmprYzZuRCtnc0NsbnYzdXptdnFjZU9zRmhlZjkxVWZi?=
 =?utf-8?B?ajd1WVFuVU1RWmhQc0NFRkNGL0todTdoS2t3VlhiVEcxV1laQnI3b0xmOVZ0?=
 =?utf-8?B?ekloa3V3NkZyUTcyV2tpOHJUdWtjTGt4M25aK3Y1dmlOaFZNeklLbzJpVEF2?=
 =?utf-8?B?dThHeXAzcHZGbG1rcHhGYStnUWxGTVRreTl6MmNCTG03SkFuRGVjeEh5ekRV?=
 =?utf-8?B?L3djVDNTMnpuSWprbmdibzBORmZPVStER2JWaUltdHVmZjVZZEhuMUlnVmJ3?=
 =?utf-8?B?NUlaeTlwQmt4cU1WLzQ0QXEvc0dJRnA3c005Y0VBbU04eEQySWh6WlhKREND?=
 =?utf-8?B?cmJqQXR5Vlpib0tiWkpMM1AwOTNXdG44bVlrUG0wRGZ2MlF0SkV0a2JvbU14?=
 =?utf-8?B?anRkOXFaL0ZRTUV3QlpKc1VmL3FvZHNGb3pHUlViUzM5SjRxZmRNZU9RK01o?=
 =?utf-8?B?SzFhcmJBTFBCcERrYXlwajhJWGM2cGZONGRJbHF6VllWcnd2UVhtNVQ4aEFr?=
 =?utf-8?B?MXZZWGxDd29KMzlvb3ByWG01Z2xuVXRxa1J0eU5ZVzNPR0FkWnZHSllsK20w?=
 =?utf-8?B?bDBWM0loOUpJRWY2OHArQ0RCNnhPbEROTitQR3p6L1pIK2ROM0JqUkliMEt3?=
 =?utf-8?B?OTVhNmlVeW81TTEvT1VycUxFWitzOHpGZVBlNUZONS9ldGFkeXB5bnpWQm82?=
 =?utf-8?B?OUhNQUZqajRXTnh3dGkwamxpMHNGZTh0cTcyN24rVXNKOUVwdDhrTGtSQVEw?=
 =?utf-8?B?R3FrVm93QU5MUDBDTVVpdzVsVFpTZGVrcHByLzJ5dkJxWFo5eDV5SVRTQmNE?=
 =?utf-8?B?cVFyVHMzbjVaSUduMWVEY1k5MU1SclhubVhXRUNnbTI4OForanViVHNBcmE2?=
 =?utf-8?B?QTg3ajljclBiYjVXUjhiVEJaRUFLcnVLSURPc3FMNFNGZTRyU3dDaU9BaWJC?=
 =?utf-8?B?UkpwajJQUkVBcDFXazF0cFBhM0JlY2RHT29SdTZLMVBSWi9MWWFpRjlMWEg0?=
 =?utf-8?B?K3A1WUZGaThnK3hrZFBmYWV5Y1ZWVi9uWGd3QmZhOE00T1lLc3NGWUlIMzc0?=
 =?utf-8?B?eWhIbkZIa2RycXNqSlNnUjFEUC9SV05SS2ZreWp6RmhkWVRMYWF6RlRqc2gz?=
 =?utf-8?B?dXBtWXZ1ZC9Rb0JNbmpWMzZVZXBqb0J5UkxwaDJnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG0rNWZMd1RNenlNczMzWUFyTjFQeFN0S3ZaeENUOHNlWHlpOXBWa0dGNzE2?=
 =?utf-8?B?Nlo1aTB6SWZTV2RjSmQ3UnJrK0xMM0t0SFpHbVdPK2haTTJsM1M1bDUwdGJF?=
 =?utf-8?B?YXdiY3FyazBNOVFaUmxROW0yQWlvZER1aGxrQWNYVmIveklJZzFQWk9jU3J1?=
 =?utf-8?B?TTlXbTRYWTBVa3k1dzFlRzJkWFYySDdSUW1USWZnTkhjejVmYkZtWGxSNnpU?=
 =?utf-8?B?YW5IOFJCSy84VG5MbDkyajEzdVFxcWsxQlZvb2lweExVdjIzU3U3Mm5YU3lD?=
 =?utf-8?B?aDR1b1I5Qmlyc1ZFMk82ZEo0UEF3cjM5Q21rcUs0cDIrZWE3V0NCc1N4NXRz?=
 =?utf-8?B?cGNPRDNtLzloajNjTVVvK2x6MjEwc0YzODhjWlFOSGdkYzR3SkMrZWFQUm1U?=
 =?utf-8?B?VFVQdmdidVpRVG5nRmd2eWYvWElvaW1ORkJldldCaktDYmUwRzFyeE5TNkVq?=
 =?utf-8?B?eGx0WnFnQ3lrbG9qVmU4cDRHN3lKUkViTTZTbUtXZzdKYWxocG9TREJYbWMy?=
 =?utf-8?B?T3h2VXlwam05cVdwSlhONC96cXhNaFhFcmlxTnJwZ0tmcnRINENJNng4QkNV?=
 =?utf-8?B?c0plVnhmN1oyVEVlYm9HVWs3U3lDaFZrM2xDNmxoOWZWUXZUbnhxZE14UVJl?=
 =?utf-8?B?L0lLWXN5bFh6Z09lYXIrcVZrekZuYUlGVzdNak93SG50b0J5RDhING9UVXN3?=
 =?utf-8?B?a0RTRS8wTDNNTU1YNmpFUzlnaXFMQjdXb3pzV1VjNGFMNEhVV0p1WTBZZWYx?=
 =?utf-8?B?MDRMZDhhOVR6TVlPUHMybEhuNHgwb0RlQS83c0hFVXRDb1lDTFBwMWQ3RFNC?=
 =?utf-8?B?N3Y4ZE40U2xxbWlFTUMyZVd2dGs3WFQ1T1RxbUtNajVqbVNhdHRTdzZlVFo1?=
 =?utf-8?B?TlpRbnpseE9yZTRFRkVoTXJqVWQyRE1Zemd4Mm1iRjhWRloyblB0d2RSVzZp?=
 =?utf-8?B?QlUrY2pXOTMwOGE2THdpRnNqeFNsQXEzV1d6eVk2bkpEclBCQ2pTODVNS3c4?=
 =?utf-8?B?NGtTNDdudlV0Z2p3STFrNWFOWllBTUhzYmFWdXpxc2NsR0ljWjBiTVZFZ3BC?=
 =?utf-8?B?cm9CMWM1T1pZZzkrT2dWbmFWYnRJSEZTaFdtNC84YTdzUC9WRHZ4WGxzMThi?=
 =?utf-8?B?MUU5dng1VlhQZUpzY0pXT290ZVlKUDNhZis4UDVjbmhVdVBqekc0ZG1zUzZB?=
 =?utf-8?B?UXgveldFNDJ4dlJjbHNhUUFLa2U4L3RNNDhjYzRwYUZXb0k0eVNLc01YbCtW?=
 =?utf-8?B?cG9Ja0dlUTg5ZFlhZTA1UmNUQW1xemRuZkhvTE9yYWtHczFGZjhqazkwUUdH?=
 =?utf-8?B?eU1wWVJqVk51WFEzVDNDM0VkVXZjS1RsallORlhlQmxPbjl3cEpMbEJqa05s?=
 =?utf-8?B?ZGIrenkzWXBxOHMvQ0p2Vjg1TXRUcEVTdWZUcDlKcDZVTHc1ZUNHWlBDR3hI?=
 =?utf-8?B?UThESkVDNlZtUi9temxLTDNPUXZRcGYxTXMwcGpIVDdLMnkwN3dmbGUwNlBs?=
 =?utf-8?B?bGo4REFvempjVHZDOGdvUEVqTytQMTQ5aDZqay8zRVlEdmZSR09xSVFJRUY4?=
 =?utf-8?B?L0c3TXJ3d2Zpc3dGamQwd3JoL1NvL1ZacW1xandMUUR0elJkT0syMm1xSEVj?=
 =?utf-8?B?Y3duOE5Ca1VKK01IM2FzTVNEeCsrQTNEL3NQdzN6WjhRQmxQMEJqY1lPTThC?=
 =?utf-8?B?SUtrVmliODg2NWNURnUzSEZtMHlycXZuL1NYT3hoTStqUWVDaWkxdTE0Rmdz?=
 =?utf-8?B?S2RxWlRHRDZPbWxDamhmZUFMQzlKejg3Wm1qL2FDVCt4aHo0dUExaE81Zklx?=
 =?utf-8?B?VldMNjRmbHh5ZXVaMGVnQkZGcmJnNmJwWXlOSStZQ2crRlQ0L1RDQ2lzd2pS?=
 =?utf-8?Q?CVpf+dRxj/pHd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e12e0c-1b36-46c5-3135-08df423c0216
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0041.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 10:42:41.2996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME0P300MB0536
Subject: [Buildroot] [PATCH 08/14] package/gstreamer1/gst1-plugins-ugly:
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

Disable glib_debug, glib_assert and glib_checks Meson options, matching
the other GStreamer packages.

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash | 4 ++--
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
index 322c61790f..53a8d7b0bd 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.24.13.tar.xz.sha256sum
-sha256  dc08bb11dce0a43453466fb9034e4fe06709fb5af68475bcf6d288693b661a5d  gst-plugins-ugly-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-1.28.9.tar.xz.sha256sum
+sha256  550a52536962186f5488e06b5c08f31ae0f18400aee32a3385156d31cb4b1189  gst-plugins-ugly-1.28.9.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 02b6e59e3c..c0aae4ea70 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_UGLY_VERSION = 1.24.13
+GST1_PLUGINS_UGLY_VERSION = 1.28.9
 GST1_PLUGINS_UGLY_SOURCE = gst-plugins-ugly-$(GST1_PLUGINS_UGLY_VERSION).tar.xz
 GST1_PLUGINS_UGLY_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-ugly
 GST1_PLUGINS_UGLY_LICENSE_FILES = COPYING
@@ -15,6 +15,9 @@ GST1_PLUGINS_UGLY_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \
 	-Dtests=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Ddoc=disabled
 
 GST1_PLUGINS_UGLY_CONF_OPTS += \

-- 
2.56.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
