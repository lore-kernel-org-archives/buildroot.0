Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DEAC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 11:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D19E8132F;
	Wed,  8 Nov 2023 11:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D19E8132F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKyUHMbIjDST; Wed,  8 Nov 2023 11:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC7581434;
	Wed,  8 Nov 2023 11:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC7581434
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC331BF2A2
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 11:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 722AB4093A
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 11:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 722AB4093A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-n--UHNLpH4 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 11:01:11 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA3E740917
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 11:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA3E740917
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCEaJsbzdBZa1di/MDBhZccqULAG8BIutFa/tCHwCt+MpSEtV8TPD4GJ4CDLkku9OBnrKrG6kbwmSNZ3u9A30KKbIuyFPpUnSsRw1OkJhMFlWQaF1eDswGSs6aI2D5+75oWd28cIgU2ALjTDjE8H41ZMngUlR39cJq5I1aJJ5aZSNeBRMfOnr5Izoq2ctg0B8LXr6Z/1Cn9fr9+OH5ZXRiBh+84kV2TJYh4inlI00UuwgSNl/bYrqOH7ULkauCFjS+O3TTFG1OZJN4A+AGrKOVcTfqjeRECzqNyDofbs6KNLX36VEZI7cqEg6a81kK/n1OuzBMUHSch3NxE738l8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYkY8DRNyqOE6VfmtxJJ9dkJNNMSqcvJ3zpyP/IkALg=;
 b=hwIuGX6yw8SUH6OvtpbqXWiKXMypQH7W1o5qpdrj5cLGAWc7Muvky+/1rEekmHPWtfD7oCbeWziT9e5r6eXse1i+sXOumBb8Ngtf+/ZVTgjki11hKZ2YbEhF9RAw4Us3mXrqW7WbU0K+pZHgibM/fjPl9K3SvU+AMj5GEsFWx1sEiruUQ8Tjg4U1qhg1f1HqtDL22tc9PT4QfOropRCZErsp3Z/emVGRkt5gOFRS15dQVZTjjznDWEBlFr4QHRsKHAbLBjx8NYrF0DDvgIkP0RHklU+bfuN5/Ax/qR+6YPc3AYaBe3FQ6mbh+JV4A4Q4GLMs/ihgwZxnFb6n4+FODA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM8P193MB1074.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 11:01:08 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%7]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 11:01:08 +0000
Message-ID: <5cb59846-e649-401e-a037-1e9ea7db6de7@othermo.de>
Date: Wed, 8 Nov 2023 12:01:07 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Bram Oosterhuis <dev@bybram.com>, buildroot@buildroot.org
References: <20231104220152.3252635-1-dev@bybram.com>
 <20231104220152.3252635-2-dev@bybram.com>
In-Reply-To: <20231104220152.3252635-2-dev@bybram.com>
X-ClientProxiedBy: FR0P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::7) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM8P193MB1074:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ef7820-4602-4927-e780-08dbe04a02a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0dFxakaWJyt9/Op9hkhwKEFlxqTf8HcE6UJqkQXFqT/c9DuBI8Jd7wWU4O6H7y8u49XVv5/3PXTe7b12wl0GVY8cyJG/cHni4UqO6jeVla/heHrpwJVBidEXgn9se/sNbuDDPckBwlM75NBV/JifkJeYUK9NsVUwhQgaVNGcPcAS2b+623K5ClQM1LQ4OMej8Pe0+z/VHU5a5Ef21+sOUOKo7D+lta8YIZ++e2t45CYIp/0jYz8kSQnB2gxdBWbZZvmyaEItSWz9j7WWfndLqZcIVsNMEad1Z5Wt6eNmu//fsOtCCsFIlJ/FSQDQY2O8GvoIrPl4bRCocBRcwmZliTtSLCg5+W2jGj4B6IkVZOiLIFwrPhzf7VUcV2Kd1fGF6Qm/J9r/kLkDnTlCZq3Qv8DTLRgUdQDY6QDQlFh1yCiAzkBG7eRegiI1jgHjxXSNqrKomb9II6nizPKXa7q4iEOOurvbtjeVkOgwcRAO6B/we1oJWRj9/XlGV4Bmy39mDqBavTJgwZF7CsQWmeCzPlnOiWUX6y3/7M8ay/IW3M0gixnp+qU1F5XzfrVfhKVMUUbPrP2TKINN6SfzjkoMGPJD1H9/Olk4kYLwmNdkm1a+f+MNBd6jeSPPIiV0HJ9bttrztpAxn/u0k1MDaGn0kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39830400003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6486002)(478600001)(38100700002)(36756003)(31696002)(86362001)(83380400001)(6506007)(66476007)(2616005)(53546011)(6512007)(8676002)(41300700001)(54906003)(66556008)(66946007)(2906002)(5660300002)(44832011)(8936002)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NjZXBuWjJKcXpWOWFFVjVUZ2c1T0J5MVhUTXRsd0VLbHJ6KzR6cnBkNnRB?=
 =?utf-8?B?REFjcmJYUW1RWFVQSFAvcUdpUWVaNzFFVTF4bWJTdmVBY3AzUXBhUHJibjhM?=
 =?utf-8?B?TmxZcGp3bEtxejdIL1M3WGZwbnVvMWdZS1NXU05sQmlXYWNVQ3duM0NhN1la?=
 =?utf-8?B?VWRweVpYRFo3ZWVuSElvU0JmRUVHNjV6MmYxQzFBSjZ4WjRsblVjNmw4T1Fy?=
 =?utf-8?B?RG5IQWdOempHNVVGQ3JnK3dRRVhhZUpUcUYzWE1BeUFXWUxaZ1N1eklCVUJY?=
 =?utf-8?B?eHZqK1VoYWptd1p1OHZXU2NQc2NQRGJ0TTZoU0hFM2FCVlB2K1JzMnpOU3g2?=
 =?utf-8?B?VCtaeVJsYkR6SnNFMS9Ud2pnVStSVUE5WmhCR011NEQ3eGg0aXdRbUZqVS9m?=
 =?utf-8?B?SUVKS3ZJQm5xb0NNZjZkd3JEdFFXUGc5U0daZ3JSU1lndVZEVE04SkQvdkRJ?=
 =?utf-8?B?dG1hdjJHcm1hc1B1dysxd0NocTZYdnYyWVZlNVRJUWUzb01Ha2pYNk91TXdn?=
 =?utf-8?B?bzBPTngzNUNTUCs1NkQwZUZzSCt6NHh0bkI1UWUrZlAyUTJLYVNxTDFMMmx3?=
 =?utf-8?B?UDdJVHlmU010WmsrakdpRSs4WmNZU1dWNGxPd2ErcTZVdWwwNW9oM0NpYmNl?=
 =?utf-8?B?S1lESTJEcmFyaFFic2dVNkt2MU55azc4TEg0TjZHd1BJMUVlU1liYUdBYkE3?=
 =?utf-8?B?R2ZLRkdQK1JxNWo0Z2cwSk5yRU9YQk9JRWR3cDZ6TVZjZmVIZVFSK0g3ajF0?=
 =?utf-8?B?a3BTZ21pYzJ6TkN0UVpYN0tNVThmSGRoUnBoeFVRYUVWajk1WnpRMTRUNGFG?=
 =?utf-8?B?c1NKT2JUblRzTENqZlpNOCtSQzNabnN0UjBvN2VSMzZpRERta25CS2VobkJ0?=
 =?utf-8?B?Qm9HRDhPaXppQWdKUTZuZTRVWnJZSXIvMi9ESWJLSXNueUhjcTBzaXpObHln?=
 =?utf-8?B?Sy9rYXRVMkxET3hGbkZiZGhyK0paTEtUOWVFVktHMExPeG5jdzhiWExSY3g0?=
 =?utf-8?B?SUZZODdiYUI4RmlEK2x6aGlldTNXdnlOVlV1b0p5WjBIemhVVDIxUlBJTWx2?=
 =?utf-8?B?TEVOMTlrTzZrTGEzdEpEcjQvREpNSVZOSG9xZjRkVEZJQlJiVnJqUGorNUpP?=
 =?utf-8?B?MWs1eGVTWit1QkFPMVJBSkk1N2p3ajQ5eXM3SW45TnRCampYOEdnSVhKV3h1?=
 =?utf-8?B?MzhiblNFK2cvSlJQOUxiazJEOUxUNHdsWTdJY3JxN3NPNmVPNXIxbE10cmp3?=
 =?utf-8?B?YnF5MnVydUZGSHZoQTdSSUV5YzMzeVhjVEVGM0hvVis2bWlRdVdaN2FRb0hG?=
 =?utf-8?B?M3ZCNzhUajlYbHZyUnE5MUtKdEhncXpZaTNFckluN052WVY5TDZLR0diYWhp?=
 =?utf-8?B?RGZLeXg0ZFF3ZFVQMTNvSnJYNU12TVl0dnNTUkNTa0ZnSEJud0h6NVEvRDhz?=
 =?utf-8?B?WTRrYWFsMTNhbmJmTFpTMUpDSGJ0ZmFoSng3K0FsTGVSc0VKa0NFNWhBODdm?=
 =?utf-8?B?TjhaM1lDai9yTytIOGFRbW1GVG1XaUUxYVUzODQyR2VkekpqVFZFazZnME0x?=
 =?utf-8?B?ZCtvL0QyVG1sa2Nmd09HNytwNk5aS3d4dHFxNXIzaDJTbVFXL2dlN2V0Z0RZ?=
 =?utf-8?B?azcwU1dLTXhwOW9iRTJaTGR0Nk5sU1B2dEFpSVFvbHErWVNQUmJzSWtxc0lu?=
 =?utf-8?B?ZXA4T3hxNTA4Zm5pY1lBVWVUTjN3YVVVNDU3djVmWHU4OGVJajNIUHpaN21x?=
 =?utf-8?B?b1ppZGNWR2NzeWdqUnRZb2pWM0gzUkkwV0FtRzNvajhaL0VOVWwwSm14MHhI?=
 =?utf-8?B?ckkrM2xQU3ZIOHJzSXZBTHhPSzlOcnFlc21FMG5ha1NHRmpFeVJPcU0rWldB?=
 =?utf-8?B?QS9vRDBTYVAyZ3JGNjVVQjdaUGlRTjdlNmREaUthTUVERlBkMU9kRHE0Mm5R?=
 =?utf-8?B?ay9CR3dPR3ZDOTZyaWZqT3JIK0pVZUNRdHhiczhjclFDUnJGRVBEWXJDZk5x?=
 =?utf-8?B?bXdnd2RTVHBlUXdXOUZVQXZ0aDV6bEEweTFpTjYyNndLVWlyWjhMNVZ5K0Nq?=
 =?utf-8?B?Mk1NOUg1TkRqeG9sV3dhMnVQL3Y2VjIrY2Nra3NTWENHYkcwNXh2Q0dWcFYv?=
 =?utf-8?B?MDJUckpYQ1dRc0Nhc00xQnRqWUw0QkVwK1ladVF3aGVPMHJJOFdaMVltNmph?=
 =?utf-8?B?S3JCOWNCK3pUc2ZEcDFNR0hTbWdHTjlKMjh5TkFwRlhGTEtIdkRUMnV0N2lL?=
 =?utf-8?B?R01wT2x4dWc2V0cwbjU0NnA1V3BRPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ef7820-4602-4927-e780-08dbe04a02a6
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 11:01:08.1465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyJmMKnSq6fdFmRRdzdJyWY59nyUPbQ+8Ch7I9ZzyrEq9X/zSofArMIIhZ42GnodeOpH9UGiScCc1E5xFzxJyJjYnVnYQ1JfWU7NvC8dN3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1074
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYkY8DRNyqOE6VfmtxJJ9dkJNNMSqcvJ3zpyP/IkALg=;
 b=nXN2CcjIiZ0ZRaxytWUBXMjQf1iukpAF3okn/BTo8s/tGH6F9Zw7BD7OxCMvFsNq3GhoxP47BGsdLxURoEW2ACRq+rS+Q2xlNLbjJmlDzrJ7fpckxmujRi0KLMdYxVcxnQ82/ZAqq+QrPvicfzwz4kQYzS0IeY+vLLN57lxonjo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=nXN2CcjI
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-firmware: bump version to
 83dafbc
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDQuMTEuMjMgMjM6MDEsIEJyYW0gT29zdGVyaHVpcyB3cm90ZToKPiBWZXJzaW9uIDgzZGFm
YmMgd2lsbCBtYXRjaCB0aGUgd2l0aCBrZXJuZWwgNi4xLjYxCj4KPiBTaWduZWQtb2ZmLWJ5OiBC
cmFtIE9vc3Rlcmh1aXMgPGRldkBieWJyYW0uY29tPgoKUmV2aWV3ZWQtYnk6IE1hcmN1cyBIb2Zm
bWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+ClRlc3RlZC1ieTogTWFyY3VzIEhvZmZt
YW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4gICBwYWNrYWdlL3JwaS1m
aXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaCB8IDIgKy0KPiAgIHBhY2thZ2UvcnBpLWZpcm13YXJl
L3JwaS1maXJtd2FyZS5tayAgIHwgMiArLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktZmlybXdh
cmUvcnBpLWZpcm13YXJlLmhhc2ggYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUu
aGFzaAo+IGluZGV4IGVjMTMxMTVmM2IuLjMzZTA1YTJmNGEgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2gKPiArKysgYi9wYWNrYWdlL3JwaS1maXJt
d2FyZS9ycGktZmlybXdhcmUuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBMb2NhbGx5IGNv
bXB1dGVkCj4gLXNoYTI1NiAgMzNhZWEyY2I5YzNiZTk0YzNkZDZhOTZmYmIzNDQzZWVlNWFmMWRj
NWZjOTE0MGUxZmFkYzUwODMyOTgzMDY0ZSAgcnBpLWZpcm13YXJlLTNmMjBiODMyYjI3Y2Q3MzBk
ZWI2NDE5YjU3MGYzMWE5ODE2N2VlZjYudGFyLmd6Cj4gK3NoYTI1NiAgZGQ0M2U3N2NhMWE4OTY5
Y2RiN2YwNWRkNzJhNTdmOTA4NjIwNzFkNWE5M2JkZDZhZWE4MjQ2YWJhODU2ODljZiAgcnBpLWZp
cm13YXJlLTgzZGFmYmM5MmMwZTYzZjc2Y2EyZWNkZDQyNDYyZDU2NDg5ZDFjNzcudGFyLmd6Cj4g
ICBzaGEyNTYgIGM3MjgzZmY1MWY4NjNkOTNhMjc1YzY2ZTNiNGNiMDgwMjFhNWRkNGQ4YzFlN2Fj
YzQ3ZDg3MmZiZTUyZDNkNmIgIGJvb3QvTElDRU5DRS5icm9hZGNvbQo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2Fy
ZS9ycGktZmlybXdhcmUubWsKPiBpbmRleCA1M2Q2ZDhjYTA2Li4zN2UwMTBkMWRlIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+ICsrKyBiL3BhY2th
Z2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAgIwo+
ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPgo+IC1SUElfRklSTVdBUkVfVkVSU0lPTiA9IDNm
MjBiODMyYjI3Y2Q3MzBkZWI2NDE5YjU3MGYzMWE5ODE2N2VlZjYKPiArUlBJX0ZJUk1XQVJFX1ZF
UlNJT04gPSA4M2RhZmJjOTJjMGU2M2Y3NmNhMmVjZGQ0MjQ2MmQ1NjQ4OWQxYzc3Cj4gICBSUElf
RklSTVdBUkVfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksZmlybXdhcmUsJChSUElf
RklSTVdBUkVfVkVSU0lPTikpCj4gICBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVz
ZQo+ICAgUlBJX0ZJUk1XQVJFX0xJQ0VOU0VfRklMRVMgPSBib290L0xJQ0VOQ0UuYnJvYWRjb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCm90aGVybW8gR21iSCB8IFNpdHogZGVy
IEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8IEFtdHNnZXJpY2h0IEFzY2hhZmZlbmJ1cmc6IEhSQiAx
NDc4MyB8IFVTdC1JZE5yLjogREUzMTk5Nzc5NzggfCBHZXNjaMOkZnRzZsO8aHJ1bmc6IERyLiBE
ZW5uaXMgTWV0ei4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
