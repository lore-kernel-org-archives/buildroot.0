Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14C1C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D0DE61234;
	Mon,  6 Nov 2023 19:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D0DE61234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaQlbHKOEKnJ; Mon,  6 Nov 2023 19:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14D961228;
	Mon,  6 Nov 2023 19:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C14D961228
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7838D1BF3A1
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 410A441FDC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 410A441FDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9D1AU3gEweJi for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:14:07 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::61f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 163F341FD8
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 163F341FD8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4IzuvFSkS9VxUQHzPZ0fteMjd1jmdix8/n9+HEtqHiJC6R3LdrQRgbvVkQHUxzS76zq0wQHLoSoe5IYOY7wI2j0Zs7a1p2dn/5TMcesiRc6Yg7RbnNeWxX/N/MwSf/HslVeGjAH/5i8ZakTiw+1C2Q80WoT+SHua10pUSOJ6spsXDJFdsXjTn4yLy0fhDmfF06HiXKz67wStwwLUHh/OpSNQozLyIQed20iM/f2oymDkUjc52fhwq5w/xMNRliNKqlacB4xrYx+tQ776lVbEfgKZ/V8NB3gs7LughnwVq5UCfNgPl0jG6U9IWDr1Z+PTMvZKPcNKJuExjwQkJML/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JESBq+3nLZtNgk4gRhRhhU+DCrYIlSuLZdHX1S10L8=;
 b=er7bGTTK3RSLLQBCsCgSTI5nMNwOwVb0vYNz2Eyl8hUUrNXe2X9UQv+XTEIFgxYcTs9CMeBPfV7+Feju2hsUQtHLHiIaaukIi9kHeFbwUnSrbdL8S8qX7CB/bHik+n9Pb08SvrJduBeKk1SXuSl0bRI8YbALWySazVUSQ1l54WGNAolUdFFFDgBmK8qhT33IJP5KvVl7pjSqOLIkb1X+jCjfgL6CoRsxnnsBPyi2Jv8Gmr23xCFRMIdbsxFrSB305b+YHcGOaIf7XSApkqISp7A7oAUIsm57RA8J7Fs9eKII4kVYWYvWL+FAPwbuHG5sSB5r14pzA9nFngX+Jjvapg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AS8P193MB1543.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:398::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 19:14:00 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::67a4:c94:e069:11a7%7]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 19:14:00 +0000
Message-ID: <c30eb5c0-05cf-4e9d-8e88-f8499db5d078@othermo.de>
Date: Mon, 6 Nov 2023 20:13:59 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20231105142405.71631-1-giulio.benetti@benettiengineering.com>
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AS8P193MB1543:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9c57f1-7d0e-481c-39fd-08dbdefc882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uT//7mhSDs9oHtGLT8q0Zm8TLfSd4kZkhKR+CAdsiz6yIelG3oLlqyCr8G0tkViiY6njLxp3kNwsQ9uz8jgi8WgCHczOTT9QPiuhwR5EX65fPHHpQoOTvsUbz3nMLPZTICmlT6na0ilpoq5ZWUNPlcgQKWxNM3kxNPG6BrbicVfMmaASalkEkwr5JgaOB7xE4xtZevljxETjeomPeAnSHov0oiTipRWD4SIuN6LpyNA3nphXKeOtSdLmU3ilh01wYo4rwAyuQFL/tiw0xrfXIfQzzTICJ7vApf4Dxa8obZksinlGnA0XhtJYvf3MucXmTOxPmaTbo4revenWqX7tZ995VSUa5ffxvsy9hhVbOiOsA2a+e9eh31mXIe/W8O8+TimWFXYaGtL2NZz7hjfFQkP9vr/8Dwv2uS2c1MlKk5Bijl9iOs9vv/Y4QuR1eGiLYNaq5JneNRSpIVFLYJo4DcP12qsCPdxXS7z7bQh8x10CuhAwlmAP/RO1aS9vYDHMxXwvifsYjt7R9v6o37HJbFkBvr08uyFrqkJ3ZyYi7WBcK9oOsC3GJqSTQuWM7eUqDlByALnwgpwceKBkyCbXhCXWEwE3kpiYMh2SdshyTKAKn2uJAxVtwLc3CH/eiPkC1bG++rLx9j0muh6DMk/2BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39830400003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(6512007)(2616005)(6486002)(478600001)(53546011)(41300700001)(2906002)(44832011)(66476007)(66556008)(66946007)(316002)(54906003)(8676002)(4326008)(8936002)(5660300002)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlra1Z0aSsxVndkdDlHdUZlMFBLN2NtNzljRXhOMnFEeXJoa1N3TzZLMHVw?=
 =?utf-8?B?YUZsanVyTzlTREtzamJyTmw2cmNtSHByMVF0c1ZwNlFkdnltQUhRTllUSEtv?=
 =?utf-8?B?MjFXZ2RaWWppMUFacURMTXhGY1JYdktKTERHSEhIL2lOaE9jQUc1YzU3VDNJ?=
 =?utf-8?B?Sm9nTjB3WHhmME9pQUUwdlpYc1NKUUY0c2VPdW85UDRoOWZaUE9GeFBOckZ2?=
 =?utf-8?B?RWJrRExDKzlsMllEWjFzOUdmRXJISHp2M3JTa2dwWGVzQnlMVy8wWDNlb0Nx?=
 =?utf-8?B?WWdKL0R6eitVZlp0aTFzbmdZYlZmdW9YWUxJanRUQ2pXaTNkR25oMERjNTZh?=
 =?utf-8?B?V3loQmNYdnVoWSt6WXV6dGVPaElwdTV1bGx0QUU5VlBrRFplVU9OeXBkSUhQ?=
 =?utf-8?B?a2hqclR2Qk1Za2g5aUhLZzBwMFYvWFdRWjBvSW51RHZnOE16b2hjV2xYWkdI?=
 =?utf-8?B?TkNhUFF0QUI4VURpSmVDU2tRNy9VeUtoNEcyYzhHMlg0OUdxL0lpNzJTUVd1?=
 =?utf-8?B?WXBNUDJldXhzeEQ0aGxzZ3Qxd2tKWFc1aVFxOS9GbGZENTIvcFVpTE4yZ1ZD?=
 =?utf-8?B?VTQ4NW5QSFNZWG8rL1hGNFhRUmJOQkdvMCtQaEYrZGZxLzhyTW5acVpITi95?=
 =?utf-8?B?L2ZNMmZ5amFqM2ZjNjA1QlVZKzRKQ2ZTc3FzWnkzS2N3NWNLS0lxckhKOFps?=
 =?utf-8?B?aUY4ZzhjRnVQZUlmWEdxNmhZbEowZ2hTWjhDbUhoSzhhY0JuMGd5d0ZZMGE4?=
 =?utf-8?B?b0R4cnR2VXVycVNhaEt6MVc1M09lWDVJRkNBUEZ4WlByTHdmL2FrS242d1pZ?=
 =?utf-8?B?NitqQ1k5QlBZbTdkZm1iTTBFUGMxd2QzaDlod2ZpcFd1cHdIWFlQdDJQSVZh?=
 =?utf-8?B?TDJYc1BGb0d4VUdtQU1NM2JPeENWWmltQk93WmE0ZUhDT0YyaGNUWDFjUXc4?=
 =?utf-8?B?NmtnNWk2VkdaZHlIMmJURVBjVjZ2Si95MVhBN1FSOVpuTXU5aGdZOEZqeEkx?=
 =?utf-8?B?K1daNEQvUG1mVlZCMjNJVmRoLzF0TjF3RERpdU4yM01zazZYU2NDNjNkQ1Vi?=
 =?utf-8?B?eEt3NGVWOXMyT1hlOHJxWVk1dnBhRHN0dnNrRXpQMXpqN3ZzbDcwWThYQmFv?=
 =?utf-8?B?WC9nL3ZKSDl6ZFhyMk1PUGoxb1Z2aGlUaU8rTVRXckZ5cU5DZGl4Vm45UTJW?=
 =?utf-8?B?WHBBNWhwQ2tsMjYrMXFlL0ZYdk5mKzJ1VVg5TzRWY0pyZFlXWjJISEtKUFZX?=
 =?utf-8?B?YWFaQkhjSU5ZVU5rZjk5NTJNNWR4Z0V4RmlCSmdBL0lESUpPSUVMV1FhY05a?=
 =?utf-8?B?UzlVTENPcUdQMy91TzloR0tDR3lWYzVUbHl6aHpsOUNhVGY2RGt3WXl6MHdE?=
 =?utf-8?B?TDZWc2FOS2VWSjdzTzZDZVhveDVnTTM1cWlIeW9nWHZtZnNrM2ZCUFNvb3ND?=
 =?utf-8?B?QmhlU1Q1STNZUzZFZWorNDJyY2xwUTFYZWFuZGRHV0dSZjlBb25oTkNwQ25k?=
 =?utf-8?B?UFlpeC9BK0tqTG5BcXkzMmZVdmhBblNSeE9JejZKU25Bd2x2cmpuM2NqS280?=
 =?utf-8?B?WGU1eVFScDc0eFcvR2hyQ2M1SlZkbVJmbWFXcUd6OW9LZkppQXYzdy9jUTZq?=
 =?utf-8?B?RUJvb2JkRzNEK2c4Y2dpM0RsU0VDZ01SRUFkK0xkV05aVHJjOWZ1M1JKTDBM?=
 =?utf-8?B?aXRYWDUvTlVqa0drUmQ4Qy9hU293NFFhVzYwWDVDT01uOVVpWTdqQTgvNVJh?=
 =?utf-8?B?OXN2VVJWcGN1dS83cVhXQzdMSS9wVm4vMU5NVVJZdzJjdEkxaFVISnU2NXMr?=
 =?utf-8?B?V09nUEdRY0VMZWozTmFFaHduK3hHdUJja0pSanMwYk4reUw3cDMydDE1V05t?=
 =?utf-8?B?NElVUU4vSmxsTnBSRzF2WGt4QkxFZ3NZZUI0djRjUElEaXlsMkk3Qk5wV2NT?=
 =?utf-8?B?Qkw4QzhhQmFWMUFZRm9Hckljb3IyVFpLejRlUnQ3ejBqeTBKanNaY2RCU2lD?=
 =?utf-8?B?WmRpMFdZeHYxOWJ3bGZRenhwWlNydkV4Rk9hRjBaSU1SNUJtZWZKSURUZmtM?=
 =?utf-8?B?YXNpcHJ1T0lJR3YvTWZsR054S0R5OUVtMUVidURQRTk2MlZuUEl6Mzl6ZlU2?=
 =?utf-8?B?YWVZOFB4bjVaN0FHYlJ0MHYrdnA2UHhzZHBPU1c0Y016cXB0bXR6N2l4REU3?=
 =?utf-8?B?aWhiOWEyd21TajRERml0aFpGSzAzdGV2N3dicEFUeENvd2xzdkFpYXFNSmhX?=
 =?utf-8?B?ZTZhM0hCUGN3eU1tUE1YcC8vNEtnPT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9c57f1-7d0e-481c-39fd-08dbdefc882c
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 19:14:00.1726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1yzXhZtp6gVTxsC+X7chux+wXCvKiK+fKOSq856jElrvkXxDnHQSkmDzZX1hCyeDae+0bCfNpOtiB1N8IJQIWP7Y486w9Lgha1asn/FiuWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1543
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JESBq+3nLZtNgk4gRhRhhU+DCrYIlSuLZdHX1S10L8=;
 b=NUY+ZPmXqvYyWcXMhT5vy5DNI2pURG5T1PpUa8ZszMrHxXM0yIsq2+wG+0HEgVqFjcwiLh0s6DFcuJRCo3O+yw26jI3YG9Oxvp8klP6EB39Lc+Q6u3kInSpFGQ4cV+cMqnEKcRg7klzlVwyyTT0cxMRJJDUbc1Eu00IEzJFC+A0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=NUY+ZPmX
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH] package/nodejs/nodejs-src: fix arch check
 on additional modules
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Price <daniel.price@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDUuMTEuMjMgMTU6MjQsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQg
Y2hlY2stYmluLWFyY2ggc2NyaXB0IGZpbmRzIE5vZGVKUyBtb2R1bGVzIGNvbnRhaW5pbmcKPiBw
cmVidWlsdCBiaW5hcmllcyBmb3IgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgYW5kIGJ1aWxkIGZh
aWxzLgo+IFNvIGxldCBjaGVjay1iaW4tYXJjaCB0byBpZ25vcmUgZm9sZGVyIC91c3IvbGliL25v
ZGVfbW9kdWxlcyBieSBzZXR0aW5nCj4gTk9ERUpTX1NSQ19CSU5fQVJDSF9FWENMVURFIHRvIGl0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20+CgpUZXN0ZWQtYnk6IE1hcmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhv
ZmZtYW5uQG90aGVybW8uZGU+Cgo+IC0tLQo+ICAgcGFja2FnZS9ub2RlanMvbm9kZWpzLXNyYy9u
b2RlanMtc3JjLm1rIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25vZGVqcy9ub2RlanMtc3JjL25vZGVqcy1zcmMubWsg
Yi9wYWNrYWdlL25vZGVqcy9ub2RlanMtc3JjL25vZGVqcy1zcmMubWsKPiBpbmRleCA2ZmI1NTBm
MTU4Li44ZjkzNDIwMmIwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy1zcmMv
bm9kZWpzLXNyYy5tawo+ICsrKyBiL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy1zcmMvbm9kZWpzLXNy
Yy5tawo+IEBAIC0yNDQsNiArMjQ0LDkgQEAgZGVmaW5lIE5PREVKU19TUkNfSU5TVEFMTF9NT0RV
TEVTCj4gICAgICAgIyBoZWxwIGluIGRpYWdub3NpbmcgdGhlIHByb2JsZW0uCj4gICAgICAgJChO
UE0pIGluc3RhbGwgLWcgJChOT0RFSlNfU1JDX01PRFVMRVNfTElTVCkKPiAgIGVuZGVmCj4gKwo+
ICsjIEV4Y2x1ZGUgcHJlYnVpbHQgYmluYXJpZXMgd2l0aCBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJl
cyBhbmQgT1MgZnJvbSBjaGVjawo+ICtOT0RFSlNfU1JDX0JJTl9BUkNIX0VYQ0xVREUgPSAvdXNy
L2xpYi9ub2RlX21vZHVsZXMvCj4gICBlbmRpZgo+Cj4gICBkZWZpbmUgTk9ERUpTX1NSQ19JTlNU
QUxMX1NUQUdJTkdfQ01EUwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwoKb3RoZXJt
byBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10c2dlcmljaHQgQXNj
aGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3OCB8IEdlc2Now6Rm
dHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
