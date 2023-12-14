Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD56CC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 12:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 678D440336;
	Thu, 14 Dec 2023 12:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 678D440336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwSa2nxIjSlt; Thu, 14 Dec 2023 12:13:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF2240198;
	Thu, 14 Dec 2023 12:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DF2240198
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 357201BF28E
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EAA483D6A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 12:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EAA483D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqM0dz43qe7K for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 12:12:58 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::60d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3EE983D5D
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 12:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3EE983D5D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O3lt+z6pUQNI2tSA7oct1gJ5476iz+7l3Bmb84tS0jM4RIDHqfC6OsFhtKqNhlDXFcqnKEBrjh/CLZb9CjXDtqg8z3tYxdcftu+Xg4YzoeajFHJuOe02QgEr3CBvOD5NXOiz01mRA51SKo/1yvcdgYtgoF6NAtEmG57a6nGOd0HqzYhNIF47FqWOx2jBN8AxAh8JLW3aA4oMfJzq+bwAO1Bi+3hI9ENLKvXjvFrDkPDdMao1w2Z2eXDACquYPxYMniDvS/1wTEQKmhBWkcXI/TRT7L705D/fE+kx22UrwrTmFGsUJ4W7EXZABACq8uY1LfOdtEsznjkrWMHuFdvH+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ttU25mlf1yTHzqf+DTiDAt73Ae/gIdHWi1yMPQr02A=;
 b=UyWhsl953bVKNbjy31elpVWhtRSl3WJWStHyc5lRuoYsSJMWCWoV6+8YdV55+S1SMzbsdg/+CYwhIGZ8U02Gu05wb1ysGb1Bd+bOnQwCfXS/hFsPL1ZXLbveWy6HjxcnqM3X0ae82Rmnw0dIaOknzwP4hPNa+swxeuX8MwJ0PIfiqU8Wo6YvhxcAGoTiuBmU6m10mXI8C8RgItNtGt0v4s+9q+RPRM352wjzcIKWh8EnwkEiqJnFGaqgDELRwEr9btVKVDG4rmNDST9XKMhR+y4miVf6nWMImdhglzDQLeN6Jf9aZ6MLwri7AMDr2pkzc1ifj9j6U/qFspZOFH6K/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=othermo.de; dmarc=pass action=none header.from=othermo.de;
 dkim=pass header.d=othermo.de; arc=none
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:2ae::24)
 by PAXP193MB2026.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:227::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:12:51 +0000
Received: from DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1]) by DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 ([fe80::755a:fe6c:9589:9d1%3]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 12:12:51 +0000
Message-ID: <56298c08-1bd2-4a58-957c-9ee3b6f2f566@othermo.de>
Date: Thu, 14 Dec 2023 13:12:51 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231214112436.144804-1-james.hilliard1@gmail.com>
 <20231214112436.144804-2-james.hilliard1@gmail.com>
In-Reply-To: <20231214112436.144804-2-james.hilliard1@gmail.com>
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:10:2ae::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P193MB1644:EE_|PAXP193MB2026:EE_
X-MS-Office365-Filtering-Correlation-Id: f6eac36c-6631-4358-4050-08dbfc9dfec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 75Z8ubg69/LG4SBUA/ahmoG2hzYVVumca5h1HGvOjXnw8RU41cuKHzebHHk1RP+E15oo8HaMWnB4GX6z5EhTLOjSUCQwCEcOrZkoztpPnUvA7hN++wwWOFjTr1yCIW3qHBUrVZS+LOJAAOugQ8/6uvhAuSxkmtHII/SSTFOnpkpv7Rq4bv2Z4xLbB9eDegtvO8g6EGmN2BXeEo0Y3zXS/IYRAaR9nMwYMwCiMgNTNIZuf/6CB7+c0KWxk5uMBxcnkG8/D1ZvZHOlTF+MI3skwz/fDLaeOTbr63JRXG0bqSbQM45CByUqiZBGL/nJr+xstPtkIVBMr96+flc7EdVW/pvJjJvolg3wqvd93OjgUgl3oLd4LLsMY3UbHKdy3Axgu2vRMBR5QMze+Iek/L/AjzyLpVWomDgx0w4mvO//tRt/DthV/G4g0lgJWrBK2tdDyXpKf4N4CXizBWvcb2oQSDBt4bDY/nZuHAswqqee4UiU1804twhjKsyhFzU1zzCK3YINHicY0uAvh2wPqrCu7EW3YAIrhNndI2+uG+kGlEe3fjWLkHcqVE5uSzr5oiFnOFT4N2sRA+VCGZMP7TpzFMOOJtXF0KKRa0pQMLKlbqBaaHmAPJYEIOslU/yn7jWvckf4LZc2VrSjElku3ww8Oq3uh/3H/o9rtloHbzLgjEiEzxHweCcwLnfxLKkw9YIx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P193MB1644.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(39830400003)(376002)(396003)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(31686004)(2616005)(6512007)(26005)(31696002)(86362001)(36756003)(38100700002)(44832011)(41300700001)(5660300002)(2906002)(6506007)(53546011)(66556008)(316002)(66476007)(6916009)(8676002)(8936002)(66946007)(6486002)(478600001)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG5YRzdQMG10aFZoTUk4cnVibDA4V3F4dm5qZWY2TXdVOFlTQnlZRVoyU0V0?=
 =?utf-8?B?L1JhM0xuZVVoN3F2enQva2xrb1JZcUZ0ZWtlZGxaWUt4UUJFMVlXeEhuT1NZ?=
 =?utf-8?B?Vm5YU0R6RGJlZ0dJQ3NwSWVrY0hENE41NW5nbC9lWHl1Zkp0anI3SXVMMHlC?=
 =?utf-8?B?Q1Z4aWxZdjBlZEtndSsvaUtoUTNOdlhFcnY2NElmUkk4YmwwT2EwOUV6ZmRN?=
 =?utf-8?B?blBxT0JyNkxGdEovWXpFMnZ1M0lRdG1oL05vRmZGN0tKY3hiSGhDWWs0MG14?=
 =?utf-8?B?a3FuMnhlNy9idjlXVHRITm1TVHgwbEQrQy9ieFpSQW5Pc0hIVjR4TmNtbDFj?=
 =?utf-8?B?V2x3MnFpaDVkWDZwSThHNVVQSGxiRDArVTBtRHJ0STM0ZlpnZXJ2Tndkdm1w?=
 =?utf-8?B?MWZqM01LZTE0dmVyc1ZXbkorbmNSNHhDQkRQSDlaWEZvOHRuTEN6czdhR2pS?=
 =?utf-8?B?aE1nanJ4QVc4Zzc5UlRLNHoxaU5zbzN1Z0dhTStXd0UvWGM5Ukx0cndVSUxa?=
 =?utf-8?B?Y2RvTXlIV21tNTlMaTNXSDVEaXpOa2NBdFFiVnZMT0IwS3hseU4rbkw5TkdH?=
 =?utf-8?B?b2dyTDV6SXZ0MG91NU9kK0cvSFFqT0ptU0pNRmpyazV6b3BGaVIrOUNpTnA5?=
 =?utf-8?B?cnlGeWlneEh0MlVaOENjMG0wYVJkTW5objl5NjVlZVlyckNlejRQSzFmbVVq?=
 =?utf-8?B?dDJBY3lHL2MvdHQvVUZPWkdkbitkUDlyQzlmdXQzNnlZUm9JQWN1dlpaeVJm?=
 =?utf-8?B?OWNRbWFOZktLM3A1Q1hXSGJ3SlZBeE1hSWtpbFNlbTd2NVFEd00rSU9tNUhy?=
 =?utf-8?B?Y2NLbEhsYUQ0V1J0Y1NoZWc0QWZOWFU4RWdBTjRuTjNHem9ERWxtZUVDQlcv?=
 =?utf-8?B?ekF0VE5SeTFYT2ZMbVBpZEkvaFIvUDVSS0IxNDcwTFF3RzY2M1dxTU5OVDNu?=
 =?utf-8?B?cFZxa0srZkl1RWk4bGo0TlNHZFBvQUwxWEhnSHFmMnByYnc1aUNoZ0tuNFpP?=
 =?utf-8?B?bWUzVUUzQ0piUmdTcjBBcjJZMHRPSitHNGZTNUR4SUhJNldoeXp4T3N0dU9C?=
 =?utf-8?B?dUtQMFZnVXdwcU5zdUsycWtlZ2ZhMXBxSEJVMnZNT0k3QjJYMWZydFk5RFJZ?=
 =?utf-8?B?MjdtZUdHR2xkM2k3UDdteVkrQUhmWVhVcnllVWFyamRLMHc0WlZ1WkswZVV5?=
 =?utf-8?B?ZGpmMHE5WUJoNGR0TUZGWHhLTVQwMmhGeitaTHY5cEJKYzN5a2pLYjRJbllk?=
 =?utf-8?B?K2UyTy9wYmFmUE5EeHc4RWVFNnBkR0F6QzVwOEVEdWhpUVJ4V3ZzRFplc3ls?=
 =?utf-8?B?QjdJQ1JrOUZub2w4eG5tUTRmdXNzZkRueWRWWlh6Q1BBdVVYd3ZRbktqM05G?=
 =?utf-8?B?SU1BalZIajRuME1xaGlOTTZCQS9iTFNrR2JEMytDVXh6OUpDdlB3S3RxOUd6?=
 =?utf-8?B?L0JjVGxaK1dhdzlPZXZJWExSSHNyME1kbWwrWDNUM0Y4K2VRYStHOFlZV3Ey?=
 =?utf-8?B?L1pvNjlpTUhoTmZvdWlHQkt3UjBKMFRFVUIxVTVXanBzLzBZUDVVWHF6clFs?=
 =?utf-8?B?aG1wM2k3anp1QjlZdHl0bU1QVmUxSiswV1dNRTBlQ1RlTW1SMTJqUjVNM2dT?=
 =?utf-8?B?ZG9zM0E1NDRldkhrNUw2RlVtT1NOYUVNT2xUTnI3dUlOajJtMFF3Z1J6S1VJ?=
 =?utf-8?B?SElnSzErUCtBOWFxSm45WTNiRHk4ck1lbzlkQVI3QW5uOWtuT1BicmM0Vkc5?=
 =?utf-8?B?dGJmNFVTeGV2R1c2azIvbldOWHBLandpc3d2RXdzWHBSRW9aU0tsb1VxVHhI?=
 =?utf-8?B?cmJvd2pOb2VJQ2l6U0lacWx2WXVRaFV4Y2xQUGFJb3l2K1dPWDlCUHJMTU5T?=
 =?utf-8?B?QUZmRllKdXI3SkZNYmdnbUlSS2tReVkzdkUzSXhXSWdBZ0ZQa3JBY1YwZUFD?=
 =?utf-8?B?WXVaZDRkYnBDM1R3QzZzaStDZWY3Tjg4ZkYxL1grTGxQclJRejFRV1hlVURk?=
 =?utf-8?B?dm9DcHYvdFNrTTUwdHlUY3JjclpkYnBzQkJ5enZUWnNIMC9SUXpRNVRhNThs?=
 =?utf-8?B?VytiQitjSGE5TnJjcU53UkkvNWlYWjVIRExsVXNQUlBpblR0eWk1ZTdNREkz?=
 =?utf-8?B?YWhaUUs0VEkxczIrYWVKU1dOU0JqWU1CQmJERm9tKzZMaUM0NkhFQThnNEY2?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: othermo.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f6eac36c-6631-4358-4050-08dbfc9dfec1
X-MS-Exchange-CrossTenant-AuthSource: DB9P193MB1644.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 12:12:51.8382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 85b1b12b-9424-4d9d-b1a2-39f36faa8bc7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqwQMe+fFG+jn8VoY/ObEC+woZpd/DbzYOWQuLQHz38lwQjAQRKGGQkOursAgeBcZ0rp9GD33+97JkCeB3Q/1a+t77CWU/sKOHiB8JhDi7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ttU25mlf1yTHzqf+DTiDAt73Ae/gIdHWi1yMPQr02A=;
 b=Tc48NBLpFaEWG1XSflfhK4pOkITkiLE9C50KuqnHtBjSB7zyh2pH/kwZAkPrJDStwEx0oUuvJY6QQf08mv/kb2OsgP2z6fcYvdvXy4nEsceAw8rcFAjBlMgggi9bt7vYTlI/gsF6dUyCYygTOU71LHzWA+8mvpef8EfisnorI5A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=othermo.de header.i=@othermo.de header.a=rsa-sha256
 header.s=selector1 header.b=Tc48NBLp
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=othermo.de;
Subject: Re: [Buildroot] [PATCH v2 2/3] package/python-starlette: new package
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

CgpPbiAxNC4xMi4yMyAxMjoyNCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1i
eTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9mZm1hbm5Ab3RoZXJtby5kZT4KCj4gLS0tCj4g
Q2hhbmdlcyB2MSAtPiB2MjoKPiAgIC0gZG93bmdyYWRlIHRvIHZlcnNpb24gMC4yNy4wCj4gLS0t
Cj4gICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
Kwo+ICAgcGFja2FnZS9weXRob24tc3RhcmxldHRlL0NvbmZpZy5pbiAgICAgICAgICAgICB8ICA3
ICsrKysrKysKPiAgIHBhY2thZ2UvcHl0aG9uLXN0YXJsZXR0ZS9weXRob24tc3RhcmxldHRlLmhh
c2ggfCAgNSArKysrKwo+ICAgcGFja2FnZS9weXRob24tc3RhcmxldHRlL3B5dGhvbi1zdGFybGV0
dGUubWsgICB8IDE1ICsrKysrKysrKysrKysrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9weXRob24tc3RhcmxldHRl
L0NvbmZpZy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXN0YXJsZXR0
ZS9weXRob24tc3RhcmxldHRlLmhhc2gKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B5
dGhvbi1zdGFybGV0dGUvcHl0aG9uLXN0YXJsZXR0ZS5tawo+Cj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCBjMDIzZTBlZjNmLi4zYTRi
ZjIxYTJhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9D
b25maWcuaW4KPiBAQCAtMTMzOCw2ICsxMzM4LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9uIG1v
ZHVsZXMiCj4gICAgICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1zcWxpdGVzY2hlbWEvQ29uZmln
LmluIgo+ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tc3FscGFyc2UvQ29uZmlnLmluIgo+
ICAgICAgIHNvdXJjZSAicGFja2FnZS9weXRob24tc3RhY2stZGF0YS9Db25maWcuaW4iCj4gKyAg
ICAgc291cmNlICJwYWNrYWdlL3B5dGhvbi1zdGFybGV0dGUvQ29uZmlnLmluIgo+ICAgICAgIHNv
dXJjZSAicGFja2FnZS9weXRob24tc3lzdGVtZC9Db25maWcuaW4iCj4gICAgICAgc291cmNlICJw
YWNrYWdlL3B5dGhvbi10YWJsZWRhdGEvQ29uZmlnLmluIgo+ICAgICAgIHNvdXJjZSAicGFja2Fn
ZS9weXRob24tdGVtcG9yYS9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXN0YXJsZXR0ZS9Db25maWcuaW4gYi9wYWNrYWdlL3B5dGhvbi1zdGFybGV0dGUvQ29uZmlnLmlu
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi45MGY1OTA2ODlhCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXN0YXJsZXR0ZS9Db25maWcuaW4K
PiBAQCAtMCwwICsxLDcgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9TVEFSTEVUVEUK
PiArICAgICBib29sICJweXRob24tc3RhcmxldHRlIgo+ICsgICAgIHNlbGVjdCBCUjJfUEFDS0FH
RV9QWVRIT05fQU5ZSU8gIyBydW50aW1lCj4gKyAgICAgaGVscAo+ICsgICAgICAgVGhlIGxpdHRs
ZSBBU0dJIGxpYnJhcnkgdGhhdCBzaGluZXMuCj4gKwo+ICsgICAgICAgaHR0cHM6Ly9naXRodWIu
Y29tL2VuY29kZS9zdGFybGV0dGUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc3Rhcmxl
dHRlL3B5dGhvbi1zdGFybGV0dGUuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXN0YXJsZXR0ZS9weXRo
b24tc3RhcmxldHRlLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAuLmE3ZjFmNjY0NDYKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc3Rh
cmxldHRlL3B5dGhvbi1zdGFybGV0dGUuaGFzaAo+IEBAIC0wLDAgKzEsNSBAQAo+ICsjIG1kNSwg
c2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3N0YXJsZXR0ZS9qc29uCj4gK21kNSAg
NTE5M2M0YjdkMmVhNGM5MzYzNWMzNDBhN2JhOWI1NGYgIHN0YXJsZXR0ZS0wLjI3LjAudGFyLmd6
Cj4gK3NoYTI1NiAgNmE2YjBkMDQyYWNiOGQ0NjlhMDFlYmE1NGU5Y2RhNmNiZDI0YWM2MDJjNGNk
MDE2NzIzMTE3ZDZhN2U3M2I3NSAgc3RhcmxldHRlLTAuMjcuMC50YXIuZ3oKPiArIyBMb2NhbGx5
IGNvbXB1dGVkIHNoYTI1NiBjaGVja3N1bXMKPiArc2hhMjU2ICBkY2I5NTY3N2EwMjI0MDI0MzE4
N2U5NjRmOTQxODQ3ZDE5YjE3ODIxY2Y5OWU1YWZhZTY4NGZhYjMyOGMxOWJmICBMSUNFTlNFLm1k
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXN0YXJsZXR0ZS9weXRob24tc3RhcmxldHRl
Lm1rIGIvcGFja2FnZS9weXRob24tc3RhcmxldHRlL3B5dGhvbi1zdGFybGV0dGUubWsKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQwOTMyOTI5YTAKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9weXRob24tc3RhcmxldHRlL3B5dGhvbi1zdGFybGV0dGUu
bWsKPiBAQCAtMCwwICsxLDE1IEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiAr
IyBweXRob24tc3RhcmxldHRlCj4gKyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4g
K1BZVEhPTl9TVEFSTEVUVEVfVkVSU0lPTiA9IDAuMjcuMAo+ICtQWVRIT05fU1RBUkxFVFRFX1NP
VVJDRSA9IHN0YXJsZXR0ZS0kKFBZVEhPTl9TVEFSTEVUVEVfVkVSU0lPTikudGFyLmd6Cj4gK1BZ
VEhPTl9TVEFSTEVUVEVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNr
YWdlcy8wNi82OC81NTliZWQ1NDg0ZTc0NmYxYWIyZWJiZTIyMzEyZjJjMjVlYzYyZTRiNTM0OTE2
ZDQxYThjMjExNDdiZjgKPiArUFlUSE9OX1NUQVJMRVRURV9TRVRVUF9UWVBFID0gcGVwNTE3Cj4g
K1BZVEhPTl9TVEFSTEVUVEVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICtQWVRIT05fU1RBUkxF
VFRFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCj4gK1BZVEhPTl9TVEFSTEVUVEVfREVQRU5E
RU5DSUVTID0gaG9zdC1weXRob24taGF0Y2hsaW5nCj4gKwo+ICskKGV2YWwgJChweXRob24tcGFj
a2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCgpvdGhlcm1vIEdtYkggfCBT
aXR6IGRlciBHZXNlbGxzY2hhZnQ6IEFsemVuYXUgfCBBbXRzZ2VyaWNodCBBc2NoYWZmZW5idXJn
OiBIUkIgMTQ3ODMgfCBVU3QtSWROci46IERFMzE5OTc3OTc4IHwgR2VzY2jDpGZ0c2bDvGhydW5n
OiBEci4gRGVubmlzIE1ldHouCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
