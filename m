Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90CAC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 22:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46073610B3;
	Wed, 21 Dec 2022 22:21:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46073610B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cddgItv3jqdJ; Wed, 21 Dec 2022 22:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C036109E;
	Wed, 21 Dec 2022 22:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76C036109E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F5F01BF2BF
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 22:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2F3A403A7
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 22:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2F3A403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qCVk-Jur9av for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 22:21:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D924B400D1
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2043.outbound.protection.outlook.com [40.107.13.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D924B400D1
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 22:21:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr1aIdLwbzwYoE92NoDT3oDq1NXFEmv1RjgmmamSfWrRZsvfHBvQpIsS87tzblMLJW6mwweVjpnLYqmTzHIJ3Xvu2a+0tdEmUSeY8TZJyplmWyEZGnO0nom01PjH2vro3tXFp6Ohndi3altfqhRxxbpGLFrU7i2uhhk0KljVJAWs1OxP8L98Uh7RzFdqQ4e0J0r8hwbfxuBw8gqcp3pVvEe0z1H4I+ajHAyI9E6bEtyUqpGYTw4yTeTsZh2IGfFbvSFWYjRejk1guEV0Z4KfrekjN0rKl/DxpPOGGuDqCopZuK9bLuSL/SAQbBUNDBevWtHYcXKfBf7+taoIImdtgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS31Qs2M7OSohAgKGTbwqnRTKqTZzxEDfvTmuPsdZOk=;
 b=aggKCvYUeE0L/dMu2YQc0aZt/I4TDtyD00ce9yJ19C1rpYilTBtcPN6LhrbgeJYC6BR1FLswTrkV8jkPJXu1TWDu76iYyyWWt2SdYV3+4tzgX7LdpGGSdC+679djbLZ2bYiJZ9v4pVnVrKQLmSPTVVKoSyiFRexe/kKXN7ku7jUz5jyrzsHO9ydnOAv5KrHLxILkZTXknFQ0RH5y+nkx1DQlBO9yhVJKY/ZCGVSJMDHBheFyaopLMdfn6SnO6NcyJmckSkT7UPtWe/Sn81oKi6d9tfBwfFQwMlYhCCkV7wcYEm2u4P+kzvHX5ASZq30up7X4vNxPY/nv+UQuhNdRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by GV1P193MB2069.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:2a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 22:21:28 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::eddb:e9be:7b7d:e95c]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::eddb:e9be:7b7d:e95c%6]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 22:21:28 +0000
Message-ID: <7b2f79e7-0880-f210-5c35-d58f7dfaf367@othermo.de>
Date: Wed, 21 Dec 2022 23:21:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: buildroot@buildroot.org
References: <20221122203130.184496-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20221122203130.184496-1-ju.o@free.fr>
X-ClientProxiedBy: BE1P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::11) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|GV1P193MB2069:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ba132d-3a3a-44c9-23fe-08dae3a1b443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eZgMdsSdlzL+aHibF/g1f/OVhVfvLzuUVfVZyrhQT5Jz7zixdMokAG4aCTZY6YRXIWrbVbEZADL8j9ClqKo0jsJNbdRxMLrqZ2+xC8IuCvSmrmThQ06Z7RFc7MNtqKJ/AEc3MJ/jSfhNqdaeuCFw7zWsUUwSe59Q4JAivIdlg8CQBEmVFFpqW5gQvysTeS6TlUNEa2VqhhY2IqD0pTGtjZeeYNb8tJ0YhTH3+aXdZSVgFgwprhrpS3dlxUFIpWHof557v3ZBbzfADG0VYcISiGb+STNoXlBq2ZKjtp5sbZkfuRDTt0SdcxviRCp537or9sLBhTEVqTMF/yysomxLbQT8LiWBGim9iII7ejNlKwzSoR1qkLRrrfGFCRREwY2vJm8Y0rsl5jy7uhHVQUtMFERay1LiEbCBZKyJ9QM4/Sd9A4+awToa9PA2f+VG7r1mz2b+rM0Wb2Tf10NmQMqeTFGOhlE454i53znGSI6Q3CPOeAdO1UasYb+stoALccaoNf9M04cuQT/xDsPF4836GHisfSyba6iCSTq2ewoZoeD2FsTPfKeW9Vl/JayA3Vc0/wwwwn2N5xmY4oavmxLyA7HoZbXoFd/E7bqUmOgmren+zjU1DJu3elY41UaKb2yFGxKq0o8QVkobulfbxYzEjdZeSRbp26XJaMBkbfP//e95NWfMtg2nUgLkqOin3KJ72/qmhxqxPQOHK4Nwxrw8I4+ze09eY7Oy9/ree/B0gQBtBzxIpODwZiIuhtp05UdtMsnOjusaAZdysayX6nWzaGPDfEIXMiQszbcOapKRsLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(39830400003)(396003)(346002)(376002)(451199015)(44832011)(966005)(6916009)(6486002)(38100700002)(478600001)(2906002)(31686004)(36756003)(5660300002)(8936002)(316002)(66946007)(86362001)(66476007)(66556008)(31696002)(8676002)(2616005)(66574015)(83380400001)(41300700001)(53546011)(6506007)(6512007)(186003)(15866825006)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmhHZGt3TXRmd1JCS25MNUNudEZHWTd4U0hyWGR5SkJOMVltUU5vSEJXckY4?=
 =?utf-8?B?dVJPUGI2ZTdWR01IQzltVHI5MkZBOSt5cDFhTVgvZHFzbzM0aGpscXcvUXFa?=
 =?utf-8?B?UjV5TjBpM0xQQzkwNkpmOFBFaVplQVAvcEFDODVWZUROTjZ3OXpnbFRDZjAz?=
 =?utf-8?B?RUtSY2F5WnVDa3B1UkY4RWtGODZHSjVYTURPUGxrRU5ZYjhZWFhQdk1yUFFO?=
 =?utf-8?B?ZmhRY1V6M1pockZiSHFyQWJMbjFSYlBaL2Y3M3NETzlJNVdSOVNYUzJmNkhj?=
 =?utf-8?B?V2RLTE5ZN2J0VFNhWEJvbXgyUHRJTU8vQWVhcmhreUYrS05XTDI5T1RVdTBq?=
 =?utf-8?B?bjhyaXZTb1dVR1lyWXFLRm5RckNKblByQVRtNk04YStaSmVjeVF0cE1ybkJM?=
 =?utf-8?B?WUlxVFRjTmJ6VGdjRGZDRVpFL0ZFYmpvR0VlRXJkUys3bHRiaHlTeHpHQUEv?=
 =?utf-8?B?bDNqdml3bUNFWGtrVllLZnBZVVlXNFNBZ2pnbWZNRUdJd1VCSTJjTk51Z1Vo?=
 =?utf-8?B?c3REOFphalREYjF4M3NmTDBWaXRRNlhVNi9EcGNNaSs2RnRndHZJRXE2VHpq?=
 =?utf-8?B?VCtFMHZEdVJWblFVb0xuL1V3am9Ya2pOd2l2QkJLd2ovbGhDYUYxcnI3MVNq?=
 =?utf-8?B?VHk0TXZHY3VaQ1NqNEVnL3Y0bUc3dHEyZ2p5QW5Vdk1oQWozRHFvOE5UWDlw?=
 =?utf-8?B?TURPMjlWRHRGRFl2MzlweEVaMmFuRFJvNEFnTUdKNThtcjlRZ1hwRXlsTEtK?=
 =?utf-8?B?SG1yTTFlZjdUS0R0VUxWSWlsT2RENG8zZ3owaXZWay9ML3NpMVRjUmFMbnlo?=
 =?utf-8?B?QllKaHhBOFFnTEdkRUtIRWIwMUNLWkVXRHMwdFZTOHVLeDJFZVc0OGtVeEFs?=
 =?utf-8?B?Ync1dGs3MXNyQlBVSk9URWU3WmJua0V2WWZ4WndjNGpwR0orTFRuRGNjRkMx?=
 =?utf-8?B?aFN0OGtKWEpsSm5FSzRyUmxvOGU0azh5RlpQVzRINHNhQk1OUWUrSGp6dk9S?=
 =?utf-8?B?bUhHYW52V3dCSCtEY1pjYmlvQTlFQmpkODlzQXorc2s4OElZQmV4eUJjUTFQ?=
 =?utf-8?B?WlJ4MVV5amJIMHh1bXdYQk50bUM4ODdmcVl5NjZPNUFmSzZaQVRtMitBblh3?=
 =?utf-8?B?aG5PYzlRcDUySGhTcmtFQWJudTFMNlRmdXY0R09RRHhwTEVNK1oyalZKUEc3?=
 =?utf-8?B?aVFQYmlKRTJwamxvTEtiQWl0SDdXdWtOU1hUVHNDRjFud012YUxrM3VlOHpq?=
 =?utf-8?B?eHladnRXU2IvVU5PWEJlYXJaVTlGTElZMklKYWFrSXlxVk1KcjJhbnpJeWM1?=
 =?utf-8?B?SjhzdXZYSlBGVkRqZjNFMktpaUJOZm40WE5uLzFqbHVWZWVrK21tZEdMb2Y4?=
 =?utf-8?B?WjhzUE5jeVRyMVpUN1hZayticGtDWlN2QUt5aUcxdEhvMXordzJQNmdVdGxZ?=
 =?utf-8?B?dy8rVWNYeUxVTUJBeFpOVG9ZVVZMbnlraWdBZXExcUhvZTdLVHo1Q0tlRTc4?=
 =?utf-8?B?ZmhrQ1VHMGxPeDRLY3BuWkIxMkNsMWtSTGxBWEIxS3FBUnlyVVM1S3Z3YXFT?=
 =?utf-8?B?bWFDMmZhTCtzalBDc01mc1R0ejVrVndja21UTSs2djhqTENoVkZFL2s2clZU?=
 =?utf-8?B?bDg1WEhmWU1FR25lRGxtNHBxbkh6bVNrdm5jaHpFVENXV3NWTkg3NEZVbEFE?=
 =?utf-8?B?UTRSYldHaG1hSm1YN0pJN1ZUektHTlN3azVnbWZ6d1AvamtXbUtZeHpIMTFw?=
 =?utf-8?B?SG1pYXRDRnpzK1duZFRTSWJqVmJLbUJFbDUxem1IV1YxRVhkR2NoYzNmME9K?=
 =?utf-8?B?Q0U4d0hJTXdJWlZBMWd0aE96TmtYb2RwbGhpVXd3MkNQRmR1VmxhdENhOHh6?=
 =?utf-8?B?aUdoK3ZRUVFCc3VSZ3Y0aWdweFc2VXhUNE8zaGYrTVh1MWdBblFTYld3Q0N4?=
 =?utf-8?B?aGJnVHAxVm4xQUpUMW9HMWF5NG5MNHdzMTdCTUxkY054dklHSTF5WXppekdV?=
 =?utf-8?B?UWRiZm5zbUNEcGs3VXhFL3B0b29QdTg4Sm1kZm9ERDVkZWN0UGdlTTVua3Vm?=
 =?utf-8?B?ekdFVDIzRExLMHU2QkRXTXdtY0FZcndBZ2lsQUZmQWFBRzNFcHpvcVR5WkhX?=
 =?utf-8?B?MHQ2YUk2cFMwV08rSVlacHNnNTN1VXZJUmJqV0NodEwxL0tlS1BVS25wNGlp?=
 =?utf-8?B?RDRTRnZObUY1UnBCNTBLY09GQk9uMllNK21FN3ZNSjBDV2ZhclR1UkVpdVUw?=
 =?utf-8?B?WlVYWjY0MHJURFRWdE9pT0RwZGNnPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ba132d-3a3a-44c9-23fe-08dae3a1b443
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 22:21:28.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvPcFgKtyxkFNRLfbKHH1PmYa+6iTYhNlWtiIJb8Paz+QnLZr1j8n7EkPN9oVk+nv7YnN7odO72nBBbYUJs3LR/RNJHBtSn1ct+kpP8YlnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2069
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS31Qs2M7OSohAgKGTbwqnRTKqTZzxEDfvTmuPsdZOk=;
 b=BDaLuzKOQrgw3BbJ+8FxclZ+Hjio5ajSCeZaEDxqeuUOSGpMW6vXLrjxEoCuEA7edAjRdd84RX2IqCMgiCzke0J3L7keMrDBxhClmCp14qCnXXO2XxHNuO8mS87BDSOtofjVZf4BrmzyWIu/+gEp/Sn9t78+YB+cKoYaDQKd2Xw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=BDaLuzKO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH next v2 1/7] package/python-idna: set
 _SETUP_TYPE = flit
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDIyLjExLjIyIDIxOjMxLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBQeXRob24gaWRuYSBw
YWNrYWdlIHN3aXRjaGVkIHRvIHB5cHJvamVjdC50b21sIGluIGNvbW1pdDoKPiBodHRwczovL2dp
dGh1Yi5jb20va2pkL2lkbmEvY29tbWl0LzJhMDBlNTE4ZWZlNTVkMmVlYjYyY2QzZjg4YWNlN2Ri
NDEzMzg2MDMKPiB3aGljaCBpcyBpbmNsdWRlZCBpbiBpZG5hIHYzLjQuCj4KPiBXaGVuIHVzaW5n
IHRoZSBvbGQgc2V0dXB0b29scyBpbmZyYSwgdGhlIHBhY2thZ2UgaXMgaW5jb3JyZWN0bHkKPiBp
bnN0YWxsZWQgYXMgdjAuMCwgd2hpY2ggaXMgdGhlbiBpbmNvcnJlY3RseSBkZXRlY3RlZCBieSBv
dGhlcgo+IHBhY2thZ2VzIHdoZW4gdXNpbmcgc2V0dXB0b29scyBwa2dfcmVzb3VyY2VzLgo+Cj4g
VGhlIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIHdpdGggdGhlIGNvbW1hbmQ6Cj4KPiAgICAgIHB5
dGhvbjMgPDxFT0YKPiAgICAgIF9fcmVxdWlyZXNfXyA9IFsiaWRuYSA+PSAyLjUiXQo+ICAgICAg
aW1wb3J0IHBrZ19yZXNvdXJjZXMKPiAgICAgIEVPRgo+Cj4gd2hpY2ggd2lsbCBmYWlsIHdpdGgg
b3V0cHV0Ogo+Cj4gICAgICBwa2dfcmVzb3VyY2VzLkNvbnRleHR1YWxWZXJzaW9uQ29uZmxpY3Q6
IChpZG5hIDAuMC4wICgvdXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMpLCBSZXF1aXJl
bWVudC5wYXJzZSgnaWRuYT49Mi41JyksIHsnaHlwZXJsaW5rJ30pCj4gICAgICBwa2dfcmVzb3Vy
Y2VzLkRpc3RyaWJ1dGlvbk5vdEZvdW5kOiBUaGUgJ2lkbmE+PTIuNScgZGlzdHJpYnV0aW9uIHdh
cyBub3QgZm91bmQgYW5kIGlzIHJlcXVpcmVkIGJ5IGh5cGVybGluawo+Cj4gVGhpcyBjb21taXQg
Y2hhbmdlcyBfU0VUVVBfVFlQRSB0byAiZmxpdCIgdG8gZml4IHRoaXMgaXNzdWUuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKUmV2aWV3ZWQtYnk6IE1h
cmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVybW8uZGU+Cgo+IC0tLQo+IENoYW5n
ZXMgdjEgLT4gdjI6Cj4gLSBJbmNsdWRlZCBKYW1lcycgcmV2aWV3IGNvbW1lbnQ6Cj4gICAgLSBf
U0VUVVBfVFlQRSBjaGFuZ2VkIGZyb20gcGVwNTE3IHRvIGZsaXQKPiAtLS0KPiAgIHBhY2thZ2Uv
cHl0aG9uLWlkbmEvcHl0aG9uLWlkbmEubWsgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhv
bi1pZG5hL3B5dGhvbi1pZG5hLm1rIGIvcGFja2FnZS9weXRob24taWRuYS9weXRob24taWRuYS5t
awo+IGluZGV4IDRkOTk5NGE5YzcuLjM5NzZjYjE1MTggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9w
eXRob24taWRuYS9weXRob24taWRuYS5tawo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWlkbmEvcHl0
aG9uLWlkbmEubWsKPiBAQCAtOSw3ICs5LDcgQEAgUFlUSE9OX0lETkFfU09VUkNFID0gaWRuYS0k
KFBZVEhPTl9JRE5BX1ZFUlNJT04pLnRhci5nego+ICAgUFlUSE9OX0lETkFfU0lURSA9IGh0dHBz
Oi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy84Yi9lMS80M2JlYjNkMzhkYmE2Y2I0
MjBjZWZhMjk3ODIyZWFjMjA1YTI3N2FiNDNlNWJhNWQ1YzQ2ZmFmOTY0MzgKPiAgIFBZVEhPTl9J
RE5BX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKPiAgIFBZVEhPTl9JRE5BX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFLm1kCj4gLVBZVEhPTl9JRE5BX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4gK1BZ
VEhPTl9JRE5BX1NFVFVQX1RZUEUgPSBmbGl0Cj4KPiAgICQoZXZhbCAkKHB5dGhvbi1wYWNrYWdl
KSkKPiAgICQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwoKb3RoZXJtbyBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHpl
bmF1IHwgQW10c2dlcmljaHQgQXNjaGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBE
RTMxOTk3Nzk3OCB8IEdlc2Now6RmdHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
