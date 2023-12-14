Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F040DC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 18:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F72A83D0D;
	Thu, 14 Dec 2023 18:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F72A83D0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16BgDBGiU1lO; Thu, 14 Dec 2023 18:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1BDC83D00;
	Thu, 14 Dec 2023 18:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BDC83D00
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D40F1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E20B860F89
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 18:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E20B860F89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gKiZwJpMJayw for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 18:16:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::61b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C989060F78
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 18:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C989060F78
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRR9q2y833DaldBdgGPnlmEJTin0pGg51XLedABIHdE4us7zzcvi2KY0eE+NNJ12pDas6KkMwaxxD3nT84xBHkyk1yJ+p153xVaj88Ap5/IktCwuS6ymg4dyzVs3AO5RhdLYnt3rtOlm+9L35sGY4TIx7e2XcWnj0eMCKeYqGHYW2gb8klvjdwSCT61k/uFDsaDRo3Z26KIKEJD+TU2KrQqTiI0YCQyzVhWdEPYSBiT19XmSO4MpqyLgC8R62vHBSVPulba2E8imn6oPQLjVb8CYUha8lx/LEMXi/CWGbQcF+4spM3QVtxw9b3tyoz7A3tRYAtb5ykCFP1Mxhge5Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnGlcbOoxnr+wDif8N0dY7+U0jjTSHRn5rfYa0YBKBM=;
 b=eks1M50ddazOraoAlrFhgTntB36t+Ifg4btOUt+I60KiLWcv5dNriXW1ChmrzwnE6NZXRr5xnmj6xYEbWEnvPjha6jVh0nEtH4qxH8YeSNS1iKN1G8ADEL0mJsT3auuBHUsxqT/w69/gIf2QNTeMw6H2UTvtSYDnI/ei7pVQbyJers7BFRiW8radPNX9pPFP0Ch1CUaBbCownnzQ9OPlV0pxFY07aLwwDoPOZbxqlENL6lvMNprnBzl4lkxw6F0BjdPSgYTzEq5aFw1bNEtXTya1sJZlUO3sjlZY1OPwFSAYfD3BCv3fX2kHwR4D/fhrcuCzWOaa5s8UAz06VZo2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by AM9P193MB1602.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:308::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.30; Thu, 14 Dec
 2023 18:16:18 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 18:16:18 +0000
Message-ID: <df462c29-02c3-4f03-935a-100a923f7b8a@othermo.de>
Date: Thu, 14 Dec 2023 19:16:18 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
 <20231214165420.181703-4-james.hilliard1@gmail.com>
In-Reply-To: <20231214165420.181703-4-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR0P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::13) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|AM9P193MB1602:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa4dd23-cde9-4c10-d332-08dbfcd0c4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6k7cNxk8keZI4EaqC72V6FkUSKIo7QQ2ALnY1RshhCcOAT6ppEjWRSVDCPKZ0tqSpNJyeeY+Jd0YXXm7c0HQtQq4/z8S9KD4YE3s0HR3ZKnOP11f04RypbMkocgF7F00S1BVuEHAsg9j6LVCg6VZ+dLjQWWTGMW+g27rsBgoxARKGNeaSDHBEM0X232+1IPuy6kVSmgDTS0J1wTe1wxPCb+rb8V4gMwo+DmThIOIlgwtlNTnFchkGIZubv2/HJWDn/HovQNzAi5qGi3DBNHF7c/yroD2MrpRT0e0MuXcy1w8mr0V3H0Nat0EYPo2obNTmdbAabV8iIZgVyDPvvEUVMfJ4JntIpe3lO2DiSbGdKnqRxL7D6J+2DycRFZ/rU7fG3NfUMlUQBHNiL9FYztmjM/Scv1AUIB7NN0Doj2UadtQQyPrW2hdLCQl1dsIQ31jGLvszfouRNGt/VFDxqZLHOuL3pwFwYCJdFy22cKBbnJ+sMkfiQbLKJzAV0PCuzXdiE8F4pknWTzkM6/qyBomul+K0LiAfchFF0zApONwhaH9cWqsmb/yd13eSfDgQbS2sHZ6jZYpDJROgeEj2LSsPGEQEu85N8T863SW4A/HM3D1z2626PtobBiSavwNomwh+3fnpw5J1WXowYmQwwGriwT9y1H4WvohrBXFvJ9KsXbMntYG/XvwrGSARyBO5wvr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39830400003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(86362001)(8936002)(8676002)(4326008)(316002)(44832011)(31696002)(966005)(6486002)(478600001)(66946007)(66556008)(66476007)(54906003)(41300700001)(2906002)(5660300002)(36756003)(38100700002)(6512007)(2616005)(26005)(53546011)(6506007)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09XU2tLc0F6NEh4YlVpSUwwNFB4UGo0M3p4N1pIWS9SRWdWUllWQ2EycHRi?=
 =?utf-8?B?WEZiVUljQVREczRWR25kT0tZZlZzcUdJdjRGQnMxdlJXSWdNUEhFQjlFdkdV?=
 =?utf-8?B?N1haZituTVorOFJMM2NtZEdxZURNOUx5SUgraTJIVHFDV2hRRXVJY2ZVNHVs?=
 =?utf-8?B?Ly9LN25CUlZqUE9XTjlxNTlpcEN6SUptUFR0L01qWVpHcDd4eFZMamd6cjlp?=
 =?utf-8?B?MnhEcEV1TVd4Q253cWlOOCtxaUh2UEhWL3pIUCtVNklCVFR3VW5jYUdFU3Bj?=
 =?utf-8?B?UEZhZmpwb3Q0Tk1CVVh3STFDYWt0UWU4SExZZ0p5RzhWZGZwNHQzNzFMS3Nh?=
 =?utf-8?B?N1Q4R0l4a2gyY2tHTXA0MGI5WGtBRDVJTGoybUljelpnK2FCUitiR1pHMVBl?=
 =?utf-8?B?UDd5MFlTWXU2UFowd1JNMG1hMG5OZVZJZnVTWjlmNEQ1SHNXOGRrejZaREkx?=
 =?utf-8?B?Yk0zSEZBOGRkeWhkQ3ZaSnY5UzdLSXppNnFSRFJSRU42RkxGTEFZVzU3VGZ3?=
 =?utf-8?B?SzRReHd3elhpZ0JIYmFlSXp1S3I0bjVlY3ZGcStyaUJFdzl4bjNTZ0pvblB6?=
 =?utf-8?B?cG8vdThrS1IvTVJTVlFMdHlmRityLzdSODRwY2J2TlF1UW12azZTZmtvYURZ?=
 =?utf-8?B?TXk5b2lLb0pGUEhMQnl0Mkk5RHlkT1V6dmQ1YjR3YVF1Rno0ZlZiSEJOQmM3?=
 =?utf-8?B?RkxBa0M4b0g4cmo0VTI4M29zdlMrTUY3SWIyOU16RnpVMzRrc0hBV1hoMGdz?=
 =?utf-8?B?S0YzbzQxc1dPQm44SmhTejAweHlhQ1dQNHRKYUtVaXpBeitYRzZHZjBVczhY?=
 =?utf-8?B?a0ZaUXViQ3BrVDJIZWNoNGNkTkpXQkJkMkh6UGg5dlh6TW9VSGp1RTJua0t2?=
 =?utf-8?B?ZXpuU2FTbTZpYmJMM0xtb01aVXZEcVhMc0JVakx1Z2lMSWNDN1UvSFFudDhK?=
 =?utf-8?B?UC9kY0lrclNTakZadzZ5WVR5MHlhbzYxN1pGMXg1a2NGemdnQjVPcVVWZG1F?=
 =?utf-8?B?OHM5R1k5Qkd3bGMxUm5QNlhHa3hIZ1ZiSnlra0pvR2tnZ3ZnZFY1NExBQjZh?=
 =?utf-8?B?VDFwRk1vL3RvTkFMTm5ESzZ2cDVacC9Yd25Zd0ZoUWJxQk5wRnJGTFNkRlM0?=
 =?utf-8?B?NVAveU9BZS9XNjc3QlIzV0FucEF4MlpLbW9oK2pVS0RvRVA2U1ZORWtsSjNz?=
 =?utf-8?B?UHlnZ3QvVGJHRHBoVU95RFN1ZklKZDJlK0w4anQ3ZTk2ZjFlNUxQNENDWU83?=
 =?utf-8?B?VHVxZEplVmxvZ0xhTDNkMjVaWnpkRE1OWWpHOEUvRU9tNlE4UVJ0SFlFVEVI?=
 =?utf-8?B?ZGlTSW5pQW4rZXVCRTFMbS9yMDZXS3pvczI0YnBFSXBrMGNkeEQ2anllbXkx?=
 =?utf-8?B?Y0hOeWYvcWszNTRlakhQekhjMTc4RVh0WFZsSy9WUnk0Z0R4Tm5mQk1YazRy?=
 =?utf-8?B?M3N0RzNMemc0dHQvNHRKMVNxV1YrTmN3Ty9jYW0zcytTeGwxMTBVMkUyOWth?=
 =?utf-8?B?NEFRTGphTVBxS2FDck9JQk8vSUZ0R2JmL09IVWhkZTZ6SWV4dkZJSlk3dUdv?=
 =?utf-8?B?RHRYUUhrZCs2THg0VTNMa2duTUx5QlZRTlZlK3RCeWlWbTZqTVErSlJadS9h?=
 =?utf-8?B?N1pmWEFmNGVMWUpzOXBZRVp3aXkzK3QyS012dVFGSlBOUkJsRTl2NjBUdVdI?=
 =?utf-8?B?Z09rMkVoV0ZEU3F0V1ZJYm5wbjR3VDlyMGErUFdGZi93N3h6dGJvbnZieTdC?=
 =?utf-8?B?MUVrUTh2Nkxvb1N2d292eTdBYWFJT3E4TUZ6T2ZNc1ZDaEFHd2hUS1BmcXUz?=
 =?utf-8?B?NnRNTDc1Y0YvMWJrVXhlSm81VmhaeVZtZ1RQNzhHS2FTanRZMFdYdWxLVTFD?=
 =?utf-8?B?Sit3QUlRK1o2YVJ5UkYzQVk1djJvMWlUTmpTQTAxcnphVEp1ZzB5Q2ZTZzhm?=
 =?utf-8?B?TVRBRHNEd2QvQTNwMWtvN2pMNFdGejF0OXp3cWZUWGtRUllEampqK0xhc3RY?=
 =?utf-8?B?aldKYjRnVk5oWGVDbWRzM0d3YUVqQjlxUGUzaHlBVS9reXAzMFdFb2RERjhq?=
 =?utf-8?B?Vmszb1FxTlhSVFZ3ejRVZlFJRUs1WnFrbXFEN0VsWW1LSngyUzdRbmQydGxO?=
 =?utf-8?B?K2UvcytEV1FtekpXQTQ4eUZ5OWNXUlFML2NNbHAwNExNeno0cTdaR1RJK2FD?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa4dd23-cde9-4c10-d332-08dbfcd0c4c8
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 18:16:18.9000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wAbGxfVbd9QQTHlP/PQDtAIe3zSIsNzFW97sW6ChU2uWZMfcBhRMkYBEwuzJU4yvXYkv3ObWZkLGu1Up0NoCusSiHbzTL9lw6siTvQaASs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1602
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnGlcbOoxnr+wDif8N0dY7+U0jjTSHRn5rfYa0YBKBM=;
 b=R2YK/o3eWSKrUfTqUva9vA6MtL8X2cpvFgBDounZ8JnmvGuUxnZEA0nQYA+MjpH3m9vsw8Tc5Nqu6SWwoguiAOOs9zeLPj02OWoNWrag8B/TaDNT05NAy1WMo7FZrB7dKroz+MpL3MKI42hb/RAtmaKAJDbJd/RbPSbN+rnivXk=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=R2YK/o3e
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v3 4/8] package/python-fastapi: new package
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC4xMi4yMyAxNzo1NCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4g
ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gICBw
YWNrYWdlL3B5dGhvbi1mYXN0YXBpL0NvbmZpZy5pbiAgICAgICAgICAgfCAxMiArKysrKysrKysr
KysKPiAgIHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvcHl0aG9uLWZhc3RhcGkuaGFzaCB8ICA1ICsr
KysrCj4gICBwYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rICAgfCAxNSAr
KysrKysrKysrKysrKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluCj4gICBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24tZmFzdGFwaS5o
YXNoCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRob24t
ZmFzdGFwaS5tawo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KPiBpbmRleCAzYTRiZjIxYTJhLi44YTk3ZWIyODk3IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAtMTA3Myw2ICsx
MDczLDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1vZHVsZXMiCj4gICAgICAgc291cmNlICJw
YWNrYWdlL3B5dGhvbi1ldmRldi9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5
dGhvbi1leGVjdXRpbmcvQ29uZmlnLmluIgo+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24t
ZmFsY29uL0NvbmZpZy5pbiIKPiArICAgICBzb3VyY2UgInBhY2thZ2UvcHl0aG9uLWZhc3RhcGkv
Q29uZmlnLmluIgo+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZmlsZWxvY2svQ29uZmln
LmluIgo+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tZmlyZS9Db25maWcuaW4iCj4gICAg
ICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1mbGFzay9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvcHl0aG9uLWZhc3RhcGkvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24tZmFzdGFw
aS9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjdk
Mzc2ZDNkZDcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9D
b25maWcuaW4KPiBAQCAtMCwwICsxLDEyIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05f
RkFTVEFQSQo+ICsgICAgIGJvb2wgInB5dGhvbi1mYXN0YXBpIgo+ICsgICAgIGRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfSE9TVF9SVVNUQ19UQVJHRVRfQVJDSF9TVVBQT1JUUyAjIHB5dGhvbi1weWRh
bnRpYyAtPiBweXRob24tcHlkYW50aWMtY29yZQo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9Q
WVRIT05fQU5ZSU8gIyBydW50aW1lCj4gKyAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9Q
WURBTlRJQyAjIHJ1bnRpbWUKPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1NUQVJM
RVRURSAjIHJ1bnRpbWUKPiArICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9OX1RZUElOR19F
WFRFTlNJT05TICMgcnVudGltZQo+ICsgICAgIGhlbHAKPiArICAgICAgIEZhc3RBUEkgZnJhbWV3
b3JrLCBoaWdoIHBlcmZvcm1hbmNlLCBlYXN5IHRvIGxlYXJuLCBmYXN0IHRvCj4gKyAgICAgICBj
b2RlLCByZWFkeSBmb3IgcHJvZHVjdGlvbi4KPiArCj4gKyAgICAgICBodHRwczovL2dpdGh1Yi5j
b20vdGlhbmdvbG8vZmFzdGFwaQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1mYXN0YXBp
L3B5dGhvbi1mYXN0YXBpLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0
YXBpLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjNkYzE1
NzhjYjcKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tZmFzdGFwaS9weXRo
b24tZmFzdGFwaS5oYXNoCj4gQEAgLTAsMCArMSw1IEBACj4gKyMgbWQ1LCBzaGEyNTYgZnJvbSBo
dHRwczovL3B5cGkub3JnL3B5cGkvZmFzdGFwaS9qc29uCj4gK21kNSAgMDZiZmE3YzYxMGZjOWU4
MWQwNWIwMzE5ZWI3MGNhZTcgIGZhc3RhcGktMC4xMDUuMC50YXIuZ3oKPiArc2hhMjU2ICA0ZDEy
ODM4ODE5YWE1MmFmMjQ0NTgwNjc1ODI1ZTc1MGFkNjdjOWRmNDYxNGY1NTdhNzY5NjA2YWY5MDJj
ZjIyICBmYXN0YXBpLTAuMTA1LjAudGFyLmd6Cj4gKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYg
Y2hlY2tzdW1zCj4gK3NoYTI1NiAgNGVjODlmZmM4MTQ4NWI5N2ZlYzU4NGIyZDRhOTYxMDMyZWVm
ZmU4MzQ0NTM4OTRmZDljMTI3NDkwNmNjNzQ0ZSAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rIGIvcGFja2FnZS9weXRob24tZmFz
dGFwaS9weXRob24tZmFzdGFwaS5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMC4uZGI4NmJmY2UzMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3B5dGhv
bi1mYXN0YXBpL3B5dGhvbi1mYXN0YXBpLm1rCj4gQEAgLTAsMCArMSwxNSBAQAo+ICsjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgcHl0aG9uLWZhc3RhcGkKPiArIwo+ICsjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArUFlUSE9OX0ZBU1RBUElfVkVSU0lPTiA9IDAuMTA1LjAK
PiArUFlUSE9OX0ZBU1RBUElfU09VUkNFID0gZmFzdGFwaS0kKFBZVEhPTl9GQVNUQVBJX1ZFUlNJ
T04pLnRhci5nego+ICtQWVRIT05fRkFTVEFQSV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzc3L2JiLzU5NDFlNmUyY2UzMDIwZjY0YjUzOWE0OWQzOWY0OWJl
MDVkZTE3ZDBjNDdmZWE5NTAxMjU4OWY4MTJhNQo+ICtQWVRIT05fRkFTVEFQSV9TRVRVUF9UWVBF
ID0gcGVwNTE3Cj4gK1BZVEhPTl9GQVNUQVBJX0xJQ0VOU0UgPSBNSVQKPiArUFlUSE9OX0ZBU1RB
UElfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiArUFlUSE9OX0ZBU1RBUElfREVQRU5ERU5DSUVT
ID0gaG9zdC1weXRob24taGF0Y2hsaW5nCj4gKwo+ICskKGV2YWwgJChweXRob24tcGFja2FnZSkp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpvdGhlcm1vIEdtYkggfCBTaXR6IGRl
ciBHZXNlbGxzY2hhZnQ6IEFsemVuYXUgfCBBbXRzZ2VyaWNodCBBc2NoYWZmZW5idXJnOiBIUkIg
MTQ3ODMgfCBVU3QtSWROci46IERFMzE5OTc3OTc4IHwgR2VzY2jDpGZ0c2bDvGhydW5nOiBEci4g
RGVubmlzIE1ldHouCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
