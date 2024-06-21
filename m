Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D6AC2BA1A
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 05:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21670812EF;
	Fri, 21 Jun 2024 05:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSor8uZZGvEu; Fri, 21 Jun 2024 05:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A878130D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A878130D;
	Fri, 21 Jun 2024 05:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85AC81BF352
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 05:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72081408B7
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 05:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZrsvX-c4snpb for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 05:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.150.181.156;
 helo=mail.sensor-technik.de; envelope-from=alex.michel@wiedemann-group.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8003D40898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8003D40898
Received: from mail.sensor-technik.de (mail.sensor-technik.de [80.150.181.156])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8003D40898
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 05:39:08 +0000 (UTC)
Received: from stwz1.stww2k.local (HELO stwz1.wiedemann-group.com)
 ([172.25.209.3])
 by mail.sensor-technik.de with ESMTP; 21 Jun 2024 07:39:06 +0200
Received: from stwz1.stww2k.local (localhost [127.0.0.1])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id D8717B5ACC;
 Fri, 21 Jun 2024 07:39:05 +0200 (CEST)
Received: from mail.wiedemann-group.com (stwexm.stww2k.local [172.25.2.110])
 by stwz1.wiedemann-group.com (Postfix) with ESMTP id 18860B5AC9;
 Fri, 21 Jun 2024 07:38:55 +0200 (CEST)
Received: from stwexm.stww2k.local (172.25.2.111) by stwexm.stww2k.local
 (172.25.2.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Fri, 21 Jun
 2024 07:38:54 +0200
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.44) by
 stwexm.stww2k.local (172.25.2.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Fri, 21 Jun 2024 07:38:54 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkZGE7hjVVzOdFsTv2NQaJ9F27PDVJeQgcHKNk/oWHJ0RV1CrhUIu0lTGLso79Yqe9hchIgXxlkDms050ANVKg0pKxWP4EeG8y0723Hhjwq0Fws/ctnmk2vPPnrLmeNyYFZi1XPMxjUysliiW8OzWd9kFXpQY+3N1FxtK5i+av4H9BwtC4nFYjQgRDyec6pbG2MNxinus0MUKhrBBZ8hRK/mogJEHK/UXNs6me6zUkFg3fxdfx0PLfF9ATx3eFGlCHxp0z6kpexLBNff5kKIl3RLRbbZ6Ba6nvdy8IjvrH4pa5/qUfogRuBWX43odWDGazgLqetikOOEHKIBkIoA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwpEPwqn5tc/VGrg87mJdfPvwTkWiuWKci8z7OXtLhc=;
 b=kX9SYXMuKpyTkwmRpxVGiEsMH3JZ6GOjM4I8ZuFD1bKh9HRjSMnhzlLiGhNYkynQ3hg+bpDVIP/1GQTipEofli5afPceVos83xJq2hQ+M1Zyw7ptdvI9O3SDY+X/4nEd1cL6U6zF3LO/gmElbtcJbU83/ayvcLmd9Ahz+LFUvX49LiDAwNl8fiStcayGHfzV5xpDTX/IcWUzihG1EnEiyj8UnKMjGOKJXZO9l92HU+BDceTfoA0l/AhJPr0azPP6RejTZ5DyKTQOgQAp6tAcQJZW1ROK6O6r9u9bbFG20JVVyCWXjynehrpmq5upDSiGFp8/1DrqLlQvzBi1DmnWSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiedemann-group.com; dmarc=pass action=none
 header.from=wiedemann-group.com; dkim=pass header.d=wiedemann-group.com;
 arc=none
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48d::22)
 by AS1P250MB0606.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:48f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 05:38:53 +0000
Received: from AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2]) by AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
 ([fe80::b4a:3a:227e:8da2%7]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 05:38:53 +0000
From: Michel Alex <Alex.Michel@wiedemann-group.com>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 0.11.0
Thread-Index: AdrC85toXEapi2o+QqK5qG3BJcKSyQAN9lOAABxc6CA=
Date: Fri, 21 Jun 2024 05:38:53 +0000
Message-ID: <AS1P250MB06084E4AF2C197370266E0DFA9C92@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB060825741529F073326AA014A9C82@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
 <7e24df50-3710-4700-a644-901528a1a939@mind.be>
In-Reply-To: <7e24df50-3710-4700-a644-901528a1a939@mind.be>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1P250MB0608:EE_|AS1P250MB0606:EE_
x-ms-office365-filtering-correlation-id: 4ba84030-14db-4fcb-2f74-08dc91b46fd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?ZFZ0Q1NsZHNud3Jvb21QUmtEYm44R0M2K29qaWdYeE1MTmZZNTFqSy9QcDJY?=
 =?utf-8?B?TkJzS1ZFWk1jaW5raHNFZ3ZxNXZxVS9vOGF6aVIvVXZ3ekZJM0NuRlRsY1dy?=
 =?utf-8?B?L1VUWWR4OU4yUUFMcHNPTW1kTU4yd01yV09RQ3oraUR1OE90dlB4Wm1vSkxZ?=
 =?utf-8?B?VXJ4UnNxbmJrUzBGa3Y2MUdLSVJNTUhBYkRnQjVJa2hCbDVNRS96OHRCc0RD?=
 =?utf-8?B?eWIyRjZQSDdyUjJLVmM0cnRRREt5OWhWaEh5Y0JldGJjckFaVDlZcVpmWHlR?=
 =?utf-8?B?bmlhR1RpMTVHamNpd2ZvNzJRU2N4YWhVQVF4RHNraDNMek1UeTZKclgzN09H?=
 =?utf-8?B?b0YxZnRudEhwaWVoMGswK2ppa3ZTbjFqUGEwa2xOcnB0eFl5ZzFWdkZFT2h6?=
 =?utf-8?B?dFlKYU8vZnJqeTYzSEFHZFAzTGhnS2hGTVBYcDVJMHhMUkxoT0VrdU1HVDV3?=
 =?utf-8?B?eTlJa05scUg3TWJ3SmdyWmJMS2pjblZVZm1CRjNsbEZXbktJWkpvdXpqRDl5?=
 =?utf-8?B?cnc3UlV1dWtDOXRmam5ydXNhbFpQYmRjOE9GYmtSZFRvN3NkWi8vRGdpSnZO?=
 =?utf-8?B?Z1pXQmxMaUFpbVpibExzNm5KVWZBVkFQT2RLOHB3cXFUaFF5R0FjM3YvVkxN?=
 =?utf-8?B?Y202NGdtOEcyMVVGcURVOCtaOTJlemwzQWJObGFnVjlHdVlyL09RQ2pTUnZa?=
 =?utf-8?B?aGFRSFZhbUY1ZHRoWGVQRERMTGhwTStFWHF2VElJSHhIVGFtNjRSenR5dkVK?=
 =?utf-8?B?Q0w5bmR1dmN1WEp0aUllS0ZIdStaV2VhbGppaklZWGQrS00vQ1UzOG9RQmNt?=
 =?utf-8?B?QktnQytxSm5Ybi9mSkRlcGhDS0VXNENnOWRsNDJaYkx5TStLWGo2Y1pmdnNY?=
 =?utf-8?B?b0Yxa2NIZk5zZkxrMmJ4M1FidElZcFR2bUdOYjZOdHMxTFZiVm9UNlJocFlB?=
 =?utf-8?B?Mk82ZXVQd0FoMm5HeHBXa0xIRTRkU0ZHd1ZrdzdyT1RPM0prYmdtYThNT2Jr?=
 =?utf-8?B?dGFnL0FJcktZZ29oYmtickdVOWlRbzhSMGN0elJLT3kvdnMyVDFONVR2bUNS?=
 =?utf-8?B?SDVYcEdDRW80anVDMGM4aTRqU1JHQlNsaU1RZmpjbmFxYm12UTdKd1lZSGVt?=
 =?utf-8?B?OG9kY0NrdXdFVVFoMHZIRGNvS1FTb3c3WWZLSkN6YWxRb09EakJQKzhzSFBy?=
 =?utf-8?B?Q09tclg4ZGtleG5nUmpDeURGRmV3VE9hM0VpczhyQWNudnhoc0x1eHJHaXQz?=
 =?utf-8?B?b0VuVmYwVFhzWjdRMDErR2lTR1BZZER1WVROZjVEWmJwMmIzdzZvNTFWelE2?=
 =?utf-8?B?ZVpHeUNsSkN2aFh3RCtXUG95Y1hsWHRSRUtQYUpzNHZaUm5jK3E5WFh4TEpE?=
 =?utf-8?B?MnRCYmFPVFJKdU5qMHVOY1kwaForOXlPSXIzTU5QR3VFQngvdjBVTEV2eVhj?=
 =?utf-8?B?Z3dXcUNGU0U0Z09QWTJpV0l5dzgrRzkva25tUWoxRlRwL0RmOFJOY2tBb0hk?=
 =?utf-8?B?ZXlONzMwU1kxWEZFaFJXZ3JqY2FkelpmMHlnWkVxWE5hZWRtOWFiQlBjS3BY?=
 =?utf-8?B?NTN5bmdlQzIwMm5HQjN4OG9NRUlsQlAyZE91ZFlPUGdoYjRQci9aSjFXeWhs?=
 =?utf-8?B?ZC9UTkExMElOaEhzamtOdWtNUDdHV1B2SnRQT3htdTVFYkhyTFZqRGc1TW4y?=
 =?utf-8?B?UHhRakZsWDd0TGo4bmcwWnFKWVVTd3QrVzZoQkJ5UUp2QTlKZnJkVVFjSjNB?=
 =?utf-8?B?K1N2dHVDbXMxVG5UWFAzaG96ZURBQ09XajM1b2hRNDB5bVNpMnV5eFBtWlJs?=
 =?utf-8?Q?xr2W3quwng+icpEfuEeFsJOY+leoFYl9DUzQA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS1P250MB0608.EURP250.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFMrbEJwcjdJN3c0cmdFTE5DRDNvMFIwbDRDdjJ1c2oxcVFHK20rUWwySm44?=
 =?utf-8?B?b041QVZYVmdhL1d6UmxXd1ZPQmVIaHhIQWVQUXdqY3FhU3dSaHozbzlUVWNq?=
 =?utf-8?B?elUvVXFkeEcvRXVJRWRNTWhaS3pjbUE0YnplRmZwTmx2RC93ZDNVKzJZRmlC?=
 =?utf-8?B?SmVyRVBoZzRKOTRrVlU3NXl1N0JwLzYyaURHY0ZBUVdmaWZVNGJ2QUlPcHZn?=
 =?utf-8?B?aG1icjBLYUx5K3JPRWNMRElOeGx3WFIvWDNoUHJoanVIUW9DUzFkZjBqU0or?=
 =?utf-8?B?T2NuKzhiT2xRYmFvb2RnNFZNNDhwN1lEdHNNcityN21EYWo4YUc2eW1vbmI3?=
 =?utf-8?B?cEpTakxvdkF6aTlWUkpCeFFwM20xYkY3dU9iTU9vL1NrQXdGTG5rTW5sd0Nv?=
 =?utf-8?B?dkVsejNSUStOMVJZOGtZNWxLM1FvcCtnZE9nVVNpbEhMRGhTTk4vVW1KNjVG?=
 =?utf-8?B?YXlSZmlESFdyWWpXdGdLSGh5d3NZa2Y2UTB0ZDhMc2NOcHVyZ1llaDFOdGY5?=
 =?utf-8?B?bTZ2cEZvcDFLVlZydVJlaE83RjBoaU9aQlNyTlFGMmZtZXVDTlpTaVVWb1g0?=
 =?utf-8?B?alRWOStJbStsMXNOcllxajF2cDlxMUt2ZzFSOEh4TEtqcFQwNUJvY0V5VHRy?=
 =?utf-8?B?T0tmcXhlYWJWcEQ5bVVEOXpmVzVvcktZQ3ZJYVJ2OUJncmZQOHRlNWdZOEhy?=
 =?utf-8?B?U0JzUG5WU0FhaEdMZFpHS1E2cy9RR3ZnTUxYSXRlSUFxbjJGdkMvRmh4c28x?=
 =?utf-8?B?TXZPN3UxdmlTSmJxWXE3YmdGVlk3MjZDQjJ6YVpvYk9nK2ZPSVVZWmxNUUNB?=
 =?utf-8?B?QXFGNlA5ajNYVXpxaW9nL1p5bVY2WndNVWlHQTk0ak5PZWpGejJQSVlBV2ts?=
 =?utf-8?B?MWZOU1pnaHFOQnBhZ0xuZ1dhU09rMEE4clZxdjNLNVh0T244MUcrL2ZmWE1k?=
 =?utf-8?B?ejBjbFByKzdzQ3hxWld4eE40bTlRVlR5UWtQRGpmak9TMmJUbEtTUWtXV0pJ?=
 =?utf-8?B?dU1sV0E2dE4rSnNMWVJlTUhLaGV5bm8wVmpEblpncXdMNUQrbXp1NzU0RHlt?=
 =?utf-8?B?WGdKNjJudm1KYXVXMzU0QzVVd2RTVXBxRkpVOHVjUXhzTUdxckVJdXZxTXZE?=
 =?utf-8?B?WGQ5YXdtd0NmenBOeHBxY0dKaVNkN3lGd1RqMnMwcVNVQ1FON1dtNEI1UHNT?=
 =?utf-8?B?RUx0d0dTaVB0VnFDSHhZM1NwVm5mVXhPdnd4SWNycnN5cGZUd1Z2VHduL3d5?=
 =?utf-8?B?eTkwcTRzRFdFVGRybjNDTTJDZ0FOT3pyam1SMWN1Wnh6R214TEpzNU5MSnJP?=
 =?utf-8?B?bTNybGdnWXY4L2RrbmZBaENVWFdyaHhjWHB2cWJPbUZRelF6VlBybzFNRE9Q?=
 =?utf-8?B?WVNoVkRWbnVLOUhTWWg4M0QyQjBLZ3YrSGNhOE11SGNrZWtSajNjQk5RQTZE?=
 =?utf-8?B?MXlnMzdKb3RkQWtvT3dzb25mcE9JbmJGbEttSnBuK2paZm52d1NUWFhqRTNr?=
 =?utf-8?B?dUloM3lSeGhFUVpvRllFWEdENzcvdGNYVWlMMmhlOTNVRzJyZFU3dWlSYjhV?=
 =?utf-8?B?dDZ3bkxPY3YzUFJEcUYzT1ByTDUwc09zVWxIU2VxSFFmVFUyc1k2MWpuUkVH?=
 =?utf-8?B?QnNUNFJrMHpUWkw3NWFCY0d2bnJGMVVkY3B3aCtxMk5MZnZXTlZQTU1hYm1h?=
 =?utf-8?B?Y3IzQnZYTk0zVlN6QjNGbU1YOEMrbkFaUXBrU2hBa0tGV1p0aU5KQTlqRm5M?=
 =?utf-8?B?QjFWdlBEVFlhdEtxZm9oM20zYXp3K3FlVXFVR1ZHTlZkMlppdGhnZmJhRDc4?=
 =?utf-8?B?MnBOZjlvdmxvNFRsa21CR0JmTUFRUGYvWnpnTDB5cjRRSGlpd0tvcFUyRDdW?=
 =?utf-8?B?a1hVeU5CSnluMzZDSEtMb2g1ZXVKZms4aUZmOGZVR2hhT2JKdlpXTkFIUTJI?=
 =?utf-8?B?b2o3NklWbWUzYWZGT1RhY2NSN1psS3JEZ0c4QkFUQmwzakVnNU1WaDd4eUxE?=
 =?utf-8?B?djB2VHpzNHlGTzJ6bmJtTStkckZLVU9wUVQ4ZCswZHdtWFFtdTFzMm1LWnc5?=
 =?utf-8?B?cVhZdVBrYlZTUVphSzdGQWk0R1dVOThpTVY1dnozZis2VmdiVnRSdTRTa0E0?=
 =?utf-8?B?bWt3WXpqRVhFTFZNREFTNW1sTi9oUTlnRUZRbmsvWHlNc25CcjBIQ3lpcDBz?=
 =?utf-8?B?R1E9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IGoLn4g059mYY+dq4m5lkJ6JLvEF6NUCJJzTtgQ9ZokNsuiHhKd2MEwXJU7B5nFP58nx3Wj2S0ulyWaqligygxdVCH3PLAj0ukvRUdoDvUiRjmMTehDC+RP1hQ9jF4VnWvbgPsPxHQPbvtOHQSv9L/wTHA6trBbtJxAkatx9sFk/tts+MY/modmBMuKwGHtNtw+SByWwVGz1JvWmTFZZQZK+QSaJ44pCACK2/lX+5bxfnl0Dl5UzjyRnhd+MNG8hXysEZiNhtFykIPdibKIzu/A++iKfhH/rTGuxn/zvd7f7ra/C8JRK3jXptcHeipdcA1azuPEQuMm2tDpXEdi1HvTYGHAt9eEuUX3GhYyBqM4IBvFOg8JV7MRPcyPIK6qElxGWB5Y7GFRuLZS67lIeyRIMQEc4kb2qbnP7BvIhu4dskinfXpMN+E19tnUn7qz0zfhmYTjkSw72KQr8SOIy249QgvL2Cs0j/E7STcyearnji4rXCTLYeHKp/RDTmNL9vWxOTbw/viMpeE74tE/b2e5qHAvNervpVBqPNETALVCdDMKG7Yno1q296oliIK3rzyexWxFtgxPlLummnZYr3Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1P250MB0608.EURP250.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba84030-14db-4fcb-2f74-08dc91b46fd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 05:38:53.5540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f92d38a3-9c84-427f-afc3-aef091509c71
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCXAbq+c4l/9z7LUTLd4XlFeMMaRf0mZidqEOTQCHnzfRD6weWrHLhKvIFS/JjMaey2RmR9Wu9J3vgisJfZNBMFoJclb2+uefzPgWmaesKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P250MB0606
X-C2ProcessedOrg: 71f8fb5e-29e9-40bb-a2d4-613e155b19df
X-TBoneOriginalFrom: Michel Alex <Alex.Michel@wiedemann-group.com>
X-TBoneOriginalTo: Arnout Vandecappelle <arnout@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
X-TBoneDomainSigned: false
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stwmm.onmicrosoft.com; 
 s=selector1-stwmm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwpEPwqn5tc/VGrg87mJdfPvwTkWiuWKci8z7OXtLhc=;
 b=PqnkmIE9fSlGgxKogC8taRIHrvrfrUFUFy+HdFHiR1BBxtA7RVBZDyJ3gyZValkgug7ZRbjv0KaB7YV6ihcBqU3w/vPz1N8nJT88pBfrydw2Q0auKyxsppGIpKpTTjQgFnd6YOUi7kLUx5Po3cIWFKQwJg1hphLkB5wcWuINK/c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=wiedemann-group.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=stwmm.onmicrosoft.com header.i=@stwmm.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector1-stwmm-onmicrosoft-com
 header.b=PqnkmIE9
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiedemann-group.com;
Subject: Re: [Buildroot] [PATCH 1/2] package/libzenoh-c: bump to version
 0.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,


> > -LIBZENOH_C_VERSION = 0.11.0.3
> > +LIBZENOH_C_VERSION = 0.11.0
> 
>   Does 0.11.0 come _after_ 0.11.0.3? I.e. should the final .3 be interpreted as
> something like a -rc3? This is very counter-intuitive... And it breaks release-
> monitoring.org...
> 

Exactly, it wasn't clear to  me either.

Regards,
Alex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
