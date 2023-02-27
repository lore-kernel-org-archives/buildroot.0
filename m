Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4868DC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B52B409EA;
	Mon, 27 Feb 2023 14:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B52B409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vdf_g9FSeJK6; Mon, 27 Feb 2023 14:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C86DC40A19;
	Mon, 27 Feb 2023 14:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86DC40A19
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E95791BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7CB6416D2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7CB6416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n62Rmc5DknN4 for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:25:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D4E841730
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::624])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D4E841730
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:25:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RST1UIbKaJeG2oYP0l3J8hQ5K2qNxZTbf1W5ynhALUfAY+aaI71lIZ31NpFQZ8FsnXwI0LaGYCI3UiCyoKlJUscaWtaFQbY2i2DKnfiw6/jKB+F85MutfVBrvxlfMEdWQK+lIcqB/bYdv6Yd6aUOApNSYYd2WqPGrBNP3H8C+eksz6im3RG43HjaZXj645Aj35GQw6WoNVeVHBpUZR2x4zEHXD3vHClyNHxLQiIKXq/G7cjg/3R3I3Nd2556q0YqkST0oaRu2c3QA3ss1DPNqGAElZ4WzbAN6x7fyJindCnJ/bBtYeixfWV9ykgYggVgqoqyvjxvha93h2fL8bLQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9og57T/49d6WBQJkMYSa4iny6ClqrN+PglVe+c7Zvzo=;
 b=Cypan4lvWfO7G+dWcGt3L9MzWcShjuW3V1ae2pam1OlgtkFoOiSsGt7wNJzAQxVFU0xogd//b5i1gfBVANmAhb6YkozRjB4RWR/QvC8BK3For9S3eq+XHET9GZJKuH5ba8ZmShZPLL2ieq4C5FmiyTosyswLcaK6fFFUGh8U9D2+2imkH2S156ownFCEIV7XNtNevfp880sfJNsjYWQ3i/oNDw2zPv9yK7LdEhtRfA8xVaAM+WxNd2c3eWlKAunv9/wBzO+JfCZdrpk/gFDhMFPlupXYhioMuJXWoln5bHX14Ut4hu7q6wPqmZU6mQNL0JD3aUlXNbf1gkh7p3zZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by GV1P193MB2279.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.27; Mon, 27 Feb
 2023 14:25:11 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::5736:e326:f7e4:7029]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::5736:e326:f7e4:7029%6]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 14:25:11 +0000
Message-ID: <ab86d540-9c27-43fc-0d37-2d5b0bca072e@othermo.de>
Date: Mon, 27 Feb 2023 15:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, peter@korsgaard.com
References: <20220718215158.C299083CCF@busybox.osuosl.org>
Content-Language: en-US
In-Reply-To: <20220718215158.C299083CCF@busybox.osuosl.org>
X-ClientProxiedBy: BE1P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::7) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|GV1P193MB2279:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ee165f-a2e0-4b91-30f8-08db18ce6dc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzmmViCzn0gv00CrM4B+46xRBYMTLqUtyc3LcO1h/dBSqlWBuoWR8YiY5/iN3s0WVRWb2q1GHA+H3SmHWuarwQQ574RnAO87i88UIup2iZgOMZwJ+eTCcdEXRLpY9tEt5n6M5hu3qs0yzsVGLt6uUrJUkIFr0cmkhybfT2BItrNxcZpqq81lIoXV1YTHu2l3tvMEne7cLA/xQx716MySUgBvbZFqEp4k518D/HAZNGuRDruN8jAMFPAwc6EHDG4VZ+bmrWeY+uBjXd+1RywjNcMGFN7n0M2KtEwIDgLaGil9JLdM8zI08+fowUi47N8rDuf2IG0d1CwqFZ7jxH8+B2gqV57xNVrX+A4DCz6R9+oQ8JNOzYBpC8PVuxSiat427IGyzrWYEABvmes2FM6UmmBa+mkHn2s7InN4J9Nxpwp+uHkoEI7GbByd3sMVmwRRZkBODy1aaMkIAOftgISzeWMea0DGlZHGNiyGunv0ZfmiIcsTlmGchXyG75Yt1kTSS+dgAMkKoDMhqsQm0A0qm+Fm2f40m9BjN+NrHb9wLjmvVvn64tLz1Hk9JPdQwNnZ7zZ1kYruuy/mU+emEpV9Ts4kkz71J0N1PiThui21nIbSQCULypiVUWt4KaAWYQzTRA68m32x/92zLa/yygwiI10baiShaQhQx0DSU78gAvYpOVlSTbYXf56NgfYmiv1SYJrgc3Hfe2gU/AnWtq1DSnejBLwFRhg79EaAxaYHwQXkdk/eIKqO+UxTCMWFdv6f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(136003)(396003)(39830400003)(451199018)(83380400001)(8676002)(31686004)(6506007)(6666004)(36756003)(38100700002)(31696002)(86362001)(8936002)(66574015)(5660300002)(478600001)(2616005)(186003)(966005)(6512007)(6486002)(53546011)(66476007)(66556008)(66946007)(2906002)(44832011)(316002)(41300700001)(43740500002)(45980500001)(15866825006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9tZXdiYkRsZnRJbVBNREF3Um1zNUgvUGkrR3VuclhldGdXM1orMnJRUVUr?=
 =?utf-8?B?eGF2N1huR3dDM3RCTHVlVTRZd0pFb1hpV1o1ZVBuaHVQZmFBQ21zYmdVb0t1?=
 =?utf-8?B?VkliOENrdEZFaDh4K1hJQ3lTdEVNUjY2K2V1eVhEMkRKS2R3T1dnSXlMRjBs?=
 =?utf-8?B?YTZJMGxEWGhwa1dINDNXTUkzTEtJUlFVTm1UYUxmZkdZeGhMem5TMVRiRW5i?=
 =?utf-8?B?REQvSXdJWkduZnpzTU82ZzRZc2d4dE5GTURUM3FrejFDemtQLzdkdlRlRUJM?=
 =?utf-8?B?bmZmNTh2Nm1SalQ1aEV1cUVSQlZxWmR0Qy9SaXM5enFJUkRnM3hSOG1wazhr?=
 =?utf-8?B?ZkMyNTlKaWFrWVV2UlZLVmFPRkRIQVRZMk1vQzlteFFMdlVOMnVod0JONGJy?=
 =?utf-8?B?bi96ZUFuWTI2ZHZTeDBmYzAyME8rb3NoUitEZkZwUzI0S3BwWWt0QmtCaGJZ?=
 =?utf-8?B?VkU0UEJJSzAvV0x1blN4QWRGeU0xV25QbE1oUVExaWZlRUFrTm56R1hqUnhj?=
 =?utf-8?B?Nnc2ZkNvSU1nYW53Q1d5dFdQdUhiMGxsZ2U2K1JjaFQybEJpcTdCQnVicXZq?=
 =?utf-8?B?eTBZeXRmb3RwU0hFK3NzQlZFem5ZQVhtd0c2UTBJRmEwTUNMTnNrdEFuZjZr?=
 =?utf-8?B?bGNhVmxJZ2gxdmNKbHAvQzJjRXhFZ0N0L0k3TmtOOVdhZmtMQ1M5VTdnSGlE?=
 =?utf-8?B?UWtGSTI5cmt6ZW5OM2VHMWhHc3ZWKy84dUp5S0VWSUN5VWlyd1ViUWJkbFFB?=
 =?utf-8?B?OUZTeUo2THFYWlhYWjdDaHFhQUQxOXFhNFVENmU4THJxdThraXFxZk5qT0wr?=
 =?utf-8?B?dlN5d3V1NjVkb0pBZStXbEcrQTdMS3NyRW9RWVlhSFlDTXFhUXllUVB2STYv?=
 =?utf-8?B?ekN1eUVjNldudS82ZUhENEFBNm5VQnhTN2dDczRKT3l3VDdFMm90VGZZRXhV?=
 =?utf-8?B?cU5SeVUrck5DQ0YzNkRhYUxJVlBBdkFyZnNWd1lURmd5QnBzWEhGVXBTWm9T?=
 =?utf-8?B?K0ExaFZTdURlMWt2UWdwMnM1YzNaUXVpWTNEWjVXcXVucCs2M3pGYTVyeHRj?=
 =?utf-8?B?czdLZllLWUkxZGp1MXZHRWVuekxyVnNqdG10clFyblpYWCtNMGdWbmhrUlpH?=
 =?utf-8?B?cDM5OVhUZTI0MEVkVUtFOUhhWVJuMVRuS2UzMzAzcG1jZWJqMy9VVWx2ZGxu?=
 =?utf-8?B?NWR2aVJSWWtxbFFqWU9ZRWlkTkE4b2JIUWxpd0dBdzNFcS9NVUI5LytlV3Zs?=
 =?utf-8?B?cnJhMEZlMkxHWU9qN3dESnR1WkV5VHJjalhudTd2Y0NURlhTNDgwRG85a1l4?=
 =?utf-8?B?Y1NXZHdWK1NTTWw2WUhucHhQZWMvVzNYK3hENXhBSXY0Z21pQmRDSzFhWDlB?=
 =?utf-8?B?SW43aTNMQnpJcjZ4RU1lMml2QWRsMDVBZWlPNDFQbXpNSlpJaWZKU3pRMzBr?=
 =?utf-8?B?NHhjaGpHdGVKTXRuazlDTjBFbGJscUJLeXRHSkJlZTZFVUtmTGVIZFpmMHE3?=
 =?utf-8?B?Z3BhcTgvdzlyRUw5TWVBSXkrMGo1WHk2TnFEN1R1MTRjL292WW1LYkh4TGlw?=
 =?utf-8?B?YzFWM2FkUGtYcHFjK0hhUnQvWksxU3d6c3Bvc0x4TDZJQnlBMFVzMStwbzJC?=
 =?utf-8?B?WEh2WFdyc09sZXhDWXk1K083TUdxbHNHM1BuQzFxbjBuSWRxYWRCcWl1UUtw?=
 =?utf-8?B?UFc5Sjh0R3Bzei9GR1E1MEZ6R3ZxQlBLSStXMUNyczQwd3VwM1ZCUkpDSU5I?=
 =?utf-8?B?Z0U0UjZFM3pZNDlFcUh5bFFzNlhoWktiWW1waEdhOU5oQUNCSnF1Y0ZUM3Jo?=
 =?utf-8?B?RzB0TW1GTEtSczEwTXh1cEJaOWdTSS9zWERlNnN4VSs0VEhTdUwvT1BLSmdF?=
 =?utf-8?B?RDNFZU1LdWQ4Q1U2M1RBUFdtKzdibHBUenhHcVFIc0xLeGYyWHRtTkVlbXNH?=
 =?utf-8?B?OWFxR1U3UjFQT0ZoRjNrRXo0eXVaRWRMSFl4RGVCWWRjUms5QVdlMmQvVklQ?=
 =?utf-8?B?c0JBd1hvRHhVV25TemZ6d2ZuVEVWaG5RdEZKZTdUK3JlL3FJT05kdmJWMTJ4?=
 =?utf-8?B?amZxWkNXdE1jRnp4VU8vNkhmNGNtOFZTM0pQRDVMTWl6cWVVT3dZVE1pc0R5?=
 =?utf-8?B?d1I4clk0VzdyNFZXWUU5eWFxaXBTMkZpcDF1eWdaYmJmOXJvY0lJcEpqSGVK?=
 =?utf-8?B?VnZqbEJqQjM2czl0L1k5T0VJeFpNbGNGZlFubld2NWNBTzZYVHM4TFloMXNI?=
 =?utf-8?B?enp6OHQvcDc3Z1J3YXNVY2VOTFp3PT0=?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ee165f-a2e0-4b91-30f8-08db18ce6dc6
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:25:11.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/vV3/pLX1FNxavGUn+N4567iRe8W6qOswecNIeHGByUYS9BKR+9FKOzLGdE/QbaLL1Nj/lw1uFGP65z1WaRiLFellGPosyP2oQslS22MqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9og57T/49d6WBQJkMYSa4iny6ClqrN+PglVe+c7Zvzo=;
 b=QoVHp3BgeW96+9Z9M8LuL+r3byxoqJgwFqj3zZY7jPLwEtSTylVUA6htkj3MGbDCzToVOz6MzFaeY48afRrYPKd1gEupboYbaCiSWFN/aUA4R4UEznTo7JuGLcLulM1yTfJIFLgvdGJl4qkVO34Kn6JwEguTE7J3CsxAIYKJKU0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=QoVHp3Bg
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [git commit] package/sudo: fix
 SUDO_ENABLE_SUDO_GROUP_RULE following version bump
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

SGkgUGV0ZXIsCnRoZSBuZWVkcyB0byBiZSBiYWNrcG9ydGVkIHRvIDIwMjIuMTEueCBhbmQgMjAy
Mi4wMi54CgpCZXN0LApNYXJjdXMKCk9uIDE5LjA3LjIyIDAwOjA1LCBZYW5uIEUuTU9SSU4gd3Jv
dGU6Cj4gY29tbWl0OiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQv
P2lkPTA3OWZjY2RlZTVhMmExMGZjODI3NTA5NDUxMmI4NDIzNTQ4ZWExNDcKPiBicmFuY2g6IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVmcy9oZWFkcy9t
YXN0ZXIKPgo+IFNpbmNlIHRoZSB2ZXJzaW9uIGJ1bXAgb2Ygc3VkbyB0byB2MS45LjExcDIgaW4g
Y29tbWl0IDliN2Y4ZGE5NmIsIHRoZQo+IHNlZCBtYWdpYyBpbiBTVURPX0VOQUJMRV9TVURPX0dS
T1VQX1JVTEUgbm8gbG9uZ2VyIGRvZXMgaXRzIGpvYiwgZHVlCj4gdG8gYSBzbGlnaHQgY2hhbmdl
IGluIHRoZSBleGFtcGxlIHN1ZG9lcnMgZmlsZSBwcm92aWRlZCBieSB1cHN0cmVhbQo+IHN1ZG8u
Cj4KPiBUaGlzIGNvbW1pdCBmaXhlcyB0aGUgcmVnZXhwIHRvIG1hdGNoIHRoZSBuZXcgc3Vkb2Vy
cyBmaWxlLgo+Cj4gRml4ZXMgYnVnICMxNDg5MSAoaHR0cHM6Ly9idWdzLmJ1c3lib3gubmV0L3No
b3dfYnVnLmNnaT9pZD0xNDg5MSkKPgo+IFJlcG9ydGVkLWJ5OiBNYXR0aGlhcyBIYXJkdCA8bWhh
cmR0QGJlcmxpbnV4LXNvbHV0aW9ucy5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYtYnk6IFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgo+IC0tLQo+ICAgcGFja2FnZS9zdWRv
L3N1ZG8ubWsgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N1ZG8vc3Vkby5tayBiL3BhY2thZ2Uv
c3Vkby9zdWRvLm1rCj4gaW5kZXggMmI5YmE3NmE1MS4uNGY5ZmRiNGIyYyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL3N1ZG8vc3Vkby5tawo+ICsrKyBiL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCj4gQEAg
LTgwLDcgKzgwLDcgQEAgZGVmaW5lIFNVRE9fVVNFUlMKPiAgIGVuZGVmCj4KPiAgIGRlZmluZSBT
VURPX0VOQUJMRV9TVURPX0dST1VQX1JVTEUKPiAtICAgICAkKFNFRCkgJy9eIyBcJXN1ZG9cdEFM
TD0oQUxMKSBBTEwvcy9eIyAvLycgJChUQVJHRVRfRElSKS9ldGMvc3Vkb2Vycwo+ICsgICAgICQo
U0VEKSAnL14jIFwlc3Vkb1x0QUxMPShBTEw6QUxMKSBBTEwvcy9eIyAvLycgJChUQVJHRVRfRElS
KS9ldGMvc3Vkb2Vycwo+ICAgZW5kZWYKPiAgIFNVRE9fUE9TVF9JTlNUQUxMX1RBUkdFVF9IT09L
UyArPSBTVURPX0VOQUJMRV9TVURPX0dST1VQX1JVTEUKPgo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpv
dGhlcm1vIEdtYkggfCBTaXR6IGRlciBHZXNlbGxzY2hhZnQ6IEFsemVuYXUgfCBBbXRzZ2VyaWNo
dCBBc2NoYWZmZW5idXJnOiBIUkIgMTQ3ODMgfCBVU3QtSWROci46IERFMzE5OTc3OTc4IHwgR2Vz
Y2jDpGZ0c2bDvGhydW5nOiBEci4gRGVubmlzIE1ldHouCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
