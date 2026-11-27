Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3B606A31E
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zil0wqdD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=WOp0JBXw
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13C8860C26;
	Fri, 27 Nov 2026 15:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id weDMMk2EK-fy; Fri, 27 Nov 2026 15:16:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D456460B86
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795792573;
	b=aIB2evCUHx71lyiaPiEU1mIqMhjR87NFikpP6rOtLTIGGCI3CORICOos0mirCHaj0Fju
	 gPegNCRPwC7hohaWF0aHnbsOWiGkI3zCwIGS1C5HALKtyEyoDyDME6JNVmF906f9MZl8I
	 C7x9b6Abyi95kvQfUPez/XN4kLzGq66EPOnov9M5AauvGDFby7Ld42uioKUX7F6wSL1qm
	 T5c7+wI8E/N3KryrZLZssS6/qUkjcbY7o4BsOCzl8hpCulMcYz8eWVS5gNHhxXHGzrRgh
	 up52sc5mZwcnxvVrkabO6wdNu7br4dbm5KHTR3a/BVKHHLhB15cVohADXuQOLy4nOOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795792573;
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
	bh=rAeQ/sug0xVg4PvCgbsR5jmNkg+ozMhLGw/6rgkaLAc=;
	b=WAwJ1v9hOZH5DGFhR7J6zPP4gfnmffIQI6s9X+3LtLgEpQxZaoNOZ6ZAOHErXLVU2t+M
	 0Bd4eV99QsMZeZSWdo+NeS+BirzfvUDasd9oVViHxSIWE7h+14Cz1F97xGeXRXfXvcmLK
	 1UrC9hgdToGUruivwtWOZTSLbi5efQBtqQ7WoA8DZeYLQbwIfnGXIiajKpzIKDLBbdJlf
	 MfzQ9hRNNT9sYTf9fkuHc+Ji2J9isAktLe0800NnbfO40GMg3YghmGmHE1DCTX0xo7CXw
	 FyAtqyIo6vUdYPZA04jbeSI/YAKgIznMgzQYFV6KtwoXQ+J5u3Qskm7mdnGirL9WUkw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795792572;
	bh=rAeQ/sug0xVg4PvCgbsR5jmNkg+ozMhLGw/6rgkaLAc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zil0wqdDHkk3nRH+fHQmLruL1ceBqpDPlR81n9FRDGyajol47ibqGnaLYBfb0pZ/a
	 gcavDMNSTRy9CKoEMgDOgsCO11aocZkxcezsmVelcGG3fSRoJ1XFF6i3fTnpVI8TEA
	 7pCL6/+B21l5Vt+qAoO0XrCKro6TslRR7snX7RMQLbol7RUH2EHEynf7GjHUB01Eqb
	 ismsSC7NeHHpRt6jxAOxz9tSbpOXvMjnQH/9wzzP10fEZ/X0Jwe5ss6TOgDUzapNht
	 t9eJar13Daq4BR7rAdvohtcfOoLXITawo8W1usmSoisq+l3UIUNhuJFihhiszk48zj
	 Zk6qlS4MS5nGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D456460B86;
	Fri, 27 Nov 2026 15:16:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6AC0373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CE07409A0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIdG0qoEBJUQ for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:16:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BC9540836
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a01:111:f403:d40e::"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:111:f403:d40e::;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=tfx2001@outlook.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=WOp0JBXw
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazolkn190100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d40e::])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BC9540836
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcZfWvJc6soRZImEZV5M+6nTMqRe0EkF2RpG9V10sO4=;
 b=WOp0JBXwBgJvAJCcXAwZTt+/O/C8PnR2l+Y8QgNjPpFa+yEyvw2rnruxwrJULFFJSoH7dFw+2IQ6eiJkXLYVBcGfw1iOrH5do/OhGOrmJiePs6fS3nxTniIZeT4vRAzBOTMBZ7vwWSUaF/cWyKNpO5eWpRlpE5jXUIBgMMpQrwcKpfSToCJWoqvLhCQvKqnOKkT6hUNxUbvnW+CPVJd9RKzjTZDWdqRXxt1W0zxKhfhTnEbnws/4fCU8kK0vy77bkE+R9XfK3FkFjhRfwZIn1FrLK2yHt03cedf74V2mfItyFnsGIrPvkNvveC41/nvR31q5R19wGjHse6htz1cAVA==
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM (2603:10c6:220:21e::12)
 by SY7P300MB1434.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:2c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:16:00 +0000
Received: from MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb]) by MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 ([fe80::9d6:c1b2:a1e4:5ceb%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:16:00 +0000
From: Fengwei Tan <tfx2001@outlook.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>,
 Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fengwei Tan <tfx2001@outlook.com>
Date: Fri, 27 Nov 2026 23:14:08 +0800
Message-ID: <MEUP300MB0045A46D9AEDBDDED984E0DCB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
References: <MEUP300MB00454F7593FD1E072AB8FDABB5412@MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3836; i=tfx2001@outlook.com;
 h=from:subject; bh=B5t2Bu+5Q10U33g+Y/r//M/3nKF1r4Li+Xuwcz8R2ww=;
 b=owEBbQKS/ZANAwAKARwPraXT/AvaAcsmYgBrCZ49gd3hQOMMzXIdF95Gh2c9WjFQQmfXjy3ZV
 dOdTav9QdSJAjMEAAEKAB0WIQTM77vWq2MBMkgGqAccD62l0/wL2gUCawmePQAKCRAcD62l0/wL
 2qVKD/9OmDgIHzWh1aklrhW8eQgKWC1VKZD0lc/mN96DDlYNgYncE05nsxLNnJ9fpDNk9ztzaAm
 Ex2sE2Oq/Si5p/ePk2Axh+cgw4IJrkXp6M2peJqxE2qp7IN9XNwlOHiYH0faFTtGTGnJSm0FyzA
 O7swkq/NGtM0jptO6YqGWVIw1QpcxYpQIMH1qp2pXB3jLTQ9dUEF1BlOdEmdmGqiQxnRsMQ/eFH
 BGM6pPe0RmlvL8lUE3o5p0wAkRg1ptX34PaDw670YbShEXz1tUZK0zI51vuag2PEf3Nbktrwz/J
 zTPlWvuNgqAyjH/jLAu4xjse6jCCXcD3qbs4XcW6whkmWFqMZYBkh1KA3zkahF++kJIUvjtyaH1
 9Mis3+0avaiS+3szakYTMGrdgshaNGKFIYddWLMhpbSSjHbNGNMdS1ZkVif9GcHH1C1EHvXbSIp
 wJb4PHxTK0T5m+xVSRaYCzLOuxBmMRsb9CMnhTRbsCLPXxgHbGSBerU2TIj9yj80sz1keuBzGAj
 i7bRes8mDj5fLjeOWXYGO5vNENOxddfbHM+ylCrYIB4hky9FaPIyYsLIF1M8NBGCu7Ga5jm6zhY
 s9JXUOBdosxkMWzZqKwzGzdsxJm/2uSv5SPoB4a0OZPKWjUE4+mqX7BqnSWlBv2C5IuddZMBGCa
 LZMOWKIqda2SuBQ==
X-Developer-Key: i=tfx2001@outlook.com; a=openpgp;
 fpr=CC1554EDEAE6C2E309538CB2EEA89BD13554CA50
X-ClientProxiedBy: TP0P295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::14) To MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:220:21e::12)
X-Microsoft-Original-Message-ID: <20261127151401.352750-22-tfx2001@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MEUP300MB0045:EE_|SY7P300MB1434:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f9b302-9a84-482d-cbed-08df4c9957a9
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24021099003|8060799015|19110799012|25010399006|260925184616899003|51005399006|6090799003|15080799012|23021999003|41001999006|5072599009|10035399007|1602099012|40105399003|440099028|4302099013|3412199025|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUJDR09IeFRRaDNBUWRERkFZWDR5bzBBczJYQWxEYkRNNWFZOXRzeGZ0SDFw?=
 =?utf-8?B?c3NscTJVdGV0Qkcrc0tGK3dSRWRiSXloQ2tqSXRVcWNHUytiQW5IcGlCamxn?=
 =?utf-8?B?TU43NGFyYkRBeU1VLytTTG40RG9RY2tXTi9ZeHRGWFJVaGErOHJLM3o3Z3Rl?=
 =?utf-8?B?Q0VEcXA1c05DT0ZBSDdzSmlJQzkralhabWg5QWUwWFZNQU5YQlRRSEp0TTFO?=
 =?utf-8?B?UzVaM0NwZy91aElZdGNDazBhT3J6dncvcnhqeFgzRU81ZFN5TUU0blJBZ0lk?=
 =?utf-8?B?SHBoemVQNmwxRUZtOWZKbnhvcTU2UWZQKzNkYi9GZ0FkYWVHOThJL0o4ZmlD?=
 =?utf-8?B?Z0dGTit5S3UvMGJKVmc2SThsWFFRTDIwcEt2VVFxUENzOWdXMGlzUG5HalZy?=
 =?utf-8?B?bHpmWk01eG00K211NVRzbDVWV0hSS1I0WmhGNVdGZjhZbGEycjB0UFBGTWJs?=
 =?utf-8?B?dTZHVW5VaUtKNUhkM1pBdjN5Wmw3WVpjVmc2c3ZuK2NGQnpUL01NVmN6OHFE?=
 =?utf-8?B?dDhqZnVYUEhKeE9BdGtiU1NpTmRTbEJqMGo1VGxCMlQ1b2I2bDd0bHJPOGhP?=
 =?utf-8?B?QTNxZkIwVzdLREs0SDNuRGlCUUFROXQ5RFpiMldocEI4OGJ0dmlxSkpHendN?=
 =?utf-8?B?UitaRXNzdWRvczZPMUk4ZmwwaDhMNlVsb2Q5VUJZKzNXQk5kM2RsVjVORmE3?=
 =?utf-8?B?VE1NaVYyMU9nVjlDUHR1VFFDWkpwenNnZGxkN01Ic0dBdWl1bjBCODRvTzZl?=
 =?utf-8?B?YWdmdDkyWm40NHV1UFVIQjNRbjI1YW1GMGx3RmtRTkMxM20yTVRvVFMrc1BF?=
 =?utf-8?B?UVNkWWFSTmVabENJS2M0ZFhreTZmTjhNcCthcjE4ZkNYR2xBdGpEUkoxc3pu?=
 =?utf-8?B?NjNxTjdGMExISkl0MHhieEd0TlR4Z1pWajF4TFdmWUlVTEJYVk00ZGZkRysy?=
 =?utf-8?B?M3pSMlkraU9hR25pazRMMW1XWk04NWJjb2ZidHJjZklBeXFlUTRYVzFwZE5h?=
 =?utf-8?B?OXI3UVYza2tLcWF6TE5zNzMyRVYyVDNOTUlZaXFVUFVLV3NsdVhLNlAxbnhH?=
 =?utf-8?B?NW9FR3V4Nk1YeUV1dFFBczRrNmIxeEh3Q3h2RlE0WG5RSlZId3Rmdi9JWWgz?=
 =?utf-8?B?UE5McVByeFZmQVNkTkNjeHpwY2FtdFlMaGlRMTNaMVFtUnBGMGVwQnFzdjJy?=
 =?utf-8?B?VDkwcGs4bk1wMy90K3JFSzJtR0E1aDBBcWNPejRkV3Vvdm96VThoZ0w0aUp0?=
 =?utf-8?B?cWFJaEkyRnBVTk9YU0duSUVaOGRzN2JUMEZxVEdtSkYrTEpRcHpxeUpjQ3kv?=
 =?utf-8?B?NWxNMW5QcGlQODh0a0swVXZBUzJwTXNnazVGSnhFNERRMTZvNGtsK054V2h2?=
 =?utf-8?B?bUdlZWFGRmZ3L1krRUFFQ3haVnFFc2RRUnhXbHhmYjM1ZlpWMDNKeVhKcUpX?=
 =?utf-8?Q?RYqGy47p?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVI3dEMrRGNHWkJDN04wdDRYY3E4Z1ErR1pEcVowN0pDMGdTRnlzdk5uMEQ2?=
 =?utf-8?B?eCt2R3ZsZUMxTDZqeWxhWmJrNGJVR09zb21DZWNKQ0pBdUR1LzlhOHhLdVJH?=
 =?utf-8?B?NWNjSHlqVlBVVEJlTkZpQ0ZIdEZ5WWFwUzZERkpTeVlRSVVoMExFWGR5VDZs?=
 =?utf-8?B?R1JnaWFQdVJ2WGZRY05Fb2lWK3lIdHhvNjI1RStveU81djBickl3QU1hUTJo?=
 =?utf-8?B?ZTA4Qzc0OHprL1dxQ2ZLRDA1dm9oT0JNZFQrNllUcnMybkc3MjYzWndvQldh?=
 =?utf-8?B?Z0JMY1ZKaUppU3ptOFFONzh4NTRpN28yd000czdQQWdtY3FZSW9HVk80Y0pY?=
 =?utf-8?B?ajNac3pDdDdDemlqcVk2RHNxaWxsckN4WUVJVHFHUUMrWlpNNnJhcm1zVk1w?=
 =?utf-8?B?L2JVU3lSejc1NDRjVWZYbWFVQ3BXbUdFME9uUzdRN1NqMnYvdWZ2YkRBYTRn?=
 =?utf-8?B?c21aL1FpR1lYR09QSjRlMGZXRWphd05xVS9XR05iZU5NY29uZXI4eXErM3VP?=
 =?utf-8?B?ZGZrNlRJNks3TTExTVU5OU1OL0Rhc1c0Q21DeDNXOUxOZVNIN3hsUy9ONU5w?=
 =?utf-8?B?SUg3eVV6TXovcm91NGVJWU5BZDMxM1oxT1RlbzM2SkNOY1phTFZISGNWMTN2?=
 =?utf-8?B?bUtKT2FEZHhuZ0xWbFpoVG5hdHh4bGdYaEF6cWNZT2VDZ2I5WnlCbmNSY0pK?=
 =?utf-8?B?cENzVzBYYUszT1hPQmRrekV1TDJxZW1iV2c4R0lTazFkVGlTcTBNK04rUUYr?=
 =?utf-8?B?dS9LS2w3N2szbk5GK3h1bDJxRGVMSGM2ZmJnTHRnRmRRR01EZmFNZXZneVNQ?=
 =?utf-8?B?bW5sTkllQVZVRXZKOVFvMFVUR0hoSWNVenlYaERoTElyZ0xwQzZaWXh2a0N4?=
 =?utf-8?B?dzVnYUJHL2xhS2dIRmpERVZXN0NPbkwvandKZnVrNVRJaU5ib2hJcXZkN1Er?=
 =?utf-8?B?UEppN3Z0QUF3T25hZFc2TXlhWEJCWm54dWNUMkFxTitsdlNYQTZ4TWl5Rm9v?=
 =?utf-8?B?d0pXOC9DTWU3SXBIUGcvNWM3ZTdLWUFmMGc4K25hWVhBUEMvUlJwRlZxdWtB?=
 =?utf-8?B?WlYwRysrOVZyREFzL1hhK0gxZGhzWFVUUzMyOW00N01sOFV1QWRFcEh6eHYy?=
 =?utf-8?B?cVhURXhrVzErbnJheTM5d094WEliZHJIeW1iNzYwb1ZsYlJ1NFgzWWtxcjVy?=
 =?utf-8?B?V2RaQm1VOXkxZ0J0NHRLelRMUGRaSDU3UCtyUk1vUitxUWlGd3A3L1ArendH?=
 =?utf-8?B?V2FQaUJQOW9Qa3hDbXBmRG5PYjFGVUMxR0JNV1NDNi84N2VhcUk2QjNHWWpx?=
 =?utf-8?B?VmxCWC94UmRlbmtDTHErdU8vbkg2aUI3L3JZQkJpTjNUNVpIWURWSXBLSVMv?=
 =?utf-8?B?dHA4VkFISnpNVHYzSWFVZndFY3V2YkhjMjZ5NnhRSForRTZqTkxOajFqVjhl?=
 =?utf-8?B?OWpFVVg0dzFJVWp5dFQ1cDlMWlZKb0g5R1pDMURvZFhLc21EdER2Ym94YklF?=
 =?utf-8?B?a204dk9OVlppS0pEZTRMbkREM1hOZEFFRTUrbVZnSlZkYWZEeTBkZXBPVjIv?=
 =?utf-8?B?TXlhMmhuWURua3hvRFpwMVlnekdWaG92Mk9XL2g4cGhJTS84STlKay8vY2x6?=
 =?utf-8?B?WGRZcXZQMHl3M3JKM2RaM05VZ2lITUJTT09IZjFQbldNTHRsaUFMeWtFL3VJ?=
 =?utf-8?B?TmZkdjZtbGZ0RjZNaE9Nem40Z2JuTytKNk5FbFhNTzJXYkd1d3NZMEw5anNW?=
 =?utf-8?B?SWs5K3I1bzFWMTU2emRTc1Y4RU91VHhrYmo3NmcvSElCZXB0dXVWMElRRDFZ?=
 =?utf-8?B?bWEzOTcxRk5nbG9hRHhOWnNidDdPT2ZGYjRSOEZPUXJ5NUFkRkxWaERKLzFk?=
 =?utf-8?Q?SBYRkKuuw6XUK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f9b302-9a84-482d-cbed-08df4c9957a9
X-MS-Exchange-CrossTenant-AuthSource: MEUP300MB0045.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:16:00.0036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P300MB1434
Subject: [Buildroot] [PATCH v2 06/14] package/gstreamer1/gst1-plugins-good:
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the deprecated Meson options with glib_debug, glib_assert and
glib_checks [1].

Drop the explicit -std=gnu99 flag and use upstream's default of GNU C11,
with C11 as a fallback [2].

The y4m plugin now also contains the decoder moved from gst-plugins-bad.
Update the Config.in help accordingly [3].

For more details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.26/
https://gstreamer.freedesktop.org/releases/1.28/

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/84b3a0950debc467ce25aebdddd0d827e658252e
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f022eba452dc04d1cfefe4860a5f89bc261e194f
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/16d34468fbd46dee295e117d3c300c5259ad7070

Signed-off-by: Fengwei Tan <tfx2001@outlook.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in              | 2 +-
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash | 4 ++--
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk   | 9 ++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index c4eb4efb65..3d595edbf7 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -254,7 +254,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_XINGMUX
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_Y4M
 	bool "y4m"
 	help
-	  Encodes a YUV frame into the yuv4mpeg format (mjpegtools)
+	  Encodes and demuxes/decodes YUV4MPEG streams (mjpegtools)
 
 comment "plugins with external dependencies"
 
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
index a8b17f3d0d..e19e379aad 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.24.13.tar.xz.sha256sum
-sha256  574ac6f9fd84b32eb04e80572391d6762df6f9802a47bc0386cd6cc48c14d08b  gst-plugins-good-1.24.13.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-1.28.9.tar.xz.sha256sum
+sha256  e518cd97483706a252e95e60312a22d23dec6f5e7673af6f5bde719c3a9ca7f4  gst-plugins-good-1.28.9.tar.xz
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 1b48d83c8b..8428d82460 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_GOOD_VERSION = 1.24.13
+GST1_PLUGINS_GOOD_VERSION = 1.28.9
 GST1_PLUGINS_GOOD_SOURCE = gst-plugins-good-$(GST1_PLUGINS_GOOD_VERSION).tar.xz
 GST1_PLUGINS_GOOD_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-good
 GST1_PLUGINS_GOOD_LICENSE_FILES = COPYING
@@ -12,15 +12,14 @@ GST1_PLUGINS_GOOD_LICENSE = LGPL-2.1+
 GST1_PLUGINS_GOOD_CPE_ID_VENDOR = freedesktop
 GST1_PLUGINS_GOOD_CPE_ID_PRODUCT = gst-plugins-good
 
-GST1_PLUGINS_GOOD_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
 GST1_PLUGINS_GOOD_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 GST1_PLUGINS_GOOD_CONF_OPTS = \
 	-Dexamples=disabled \
 	-Dtests=disabled \
-	-Dgobject-cast-checks=disabled \
-	-Dglib-asserts=disabled \
-	-Dglib-checks=disabled \
+	-Dglib_debug=disabled \
+	-Dglib_assert=false \
+	-Dglib_checks=false \
 	-Dasm=disabled \
 	-Ddirectsound=disabled \
 	-Dwaveform=disabled \

-- 
2.56.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
