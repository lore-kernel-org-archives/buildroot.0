Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C0DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 05:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B3E060D71;
	Thu, 14 Apr 2022 05:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pqADLCwTLVOS; Thu, 14 Apr 2022 05:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D1360C24;
	Thu, 14 Apr 2022 05:53:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28F751BF861
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 05:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0764A81BBD
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 05:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQ0G9UybYkLu for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 05:53:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA6DF81A34
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 05:53:44 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2050.outbound.protection.outlook.com [104.47.6.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-OEZWoHzCMIWxQ-i93ahKlQ-1; Thu, 14 Apr 2022 07:53:37 +0200
X-MC-Unique: OEZWoHzCMIWxQ-i93ahKlQ-1
Received: from AM0PR02MB5427.eurprd02.prod.outlook.com (2603:10a6:208:158::26)
 by DB6PR0202MB2853.eurprd02.prod.outlook.com (2603:10a6:4:a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 05:53:36 +0000
Received: from AM0PR02MB5427.eurprd02.prod.outlook.com
 ([fe80::80eb:bd7c:2c60:221a]) by AM0PR02MB5427.eurprd02.prod.outlook.com
 ([fe80::80eb:bd7c:2c60:221a%5]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 05:53:35 +0000
From: Andrei FOMITCHEV HERVIEU <andrei.fomitchevhervieu@getinge.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [EXT] Re: [Buildroot] [PATCH 1/1] package/opkg: enable openssl
 signature
Thread-Index: AQHYTwh9I6bhCgkrqEWc+Sac7HwuS6zuV0QAgACO2lA=
Date: Thu, 14 Apr 2022 05:53:35 +0000
Message-ID: <AM0PR02MB5427EEEF5C87B7EDC15E85ABECEF9@AM0PR02MB5427.eurprd02.prod.outlook.com>
References: <20220413073119.458265-1-andrei.fomitchevhervieu@getinge.com>
 <20220413230848.63adde79@windsurf>
In-Reply-To: <20220413230848.63adde79@windsurf>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cde1491a-c511-4b0a-c6d5-08da1ddb1db5
x-ms-traffictypediagnostic: DB6PR0202MB2853:EE_
x-microsoft-antispam-prvs: <DB6PR0202MB2853551E5E8433F19F798B3AECEF9@DB6PR0202MB2853.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: A2TBpO/yj3mXdWVRLKKWeuu/Ig7tqmmI+5yhjV4xDTxRhg1Al9sEaN7CkHcUvs8iY9pIN098Q4cSKqGvOKalzyxBjYB5UNcTUDbMzOHnykPgOrgX5euwCnz4xQzXF30i8PZsMJGYDa/knyjgnwg719omkaiEkqRyV7REUlg8XzOqKicm3SnT2+M+juhMVHlF7FmeZDRv+IBDdtfqvGEzqnHhIncezlQUgO9y/xsM05whbRQZLV10u1TS++AawqH7N53s+T/MEYIcXUdsbmBcUcekGb91rMkjvdCp4M6GlMhQaXGWgB2NgtKzq4n1Xh35FBiNKB1COeAZIhZUl/c5TQJlewHe1jJtUAmbwXbZkJIYPDGyqUsi9ArzsLTACdrFU175oOUMqMMmwxE6xkAze8gePhSG/+pChZaIRyqqKc/mlKPzEWKd2uAR2bK1gdSWmC6axrQrvR6lxZy35kZCH98mISWuDEtoMZtJM6Xfe/GuRdZnHV8k03VEwwJvXJcQYsDBRF0sFB9AKIMo6pHqD4f8ZgcEKw1ca75TZ/MFKNnrIsw4d90wz8AY0yzjAGPRzYNGfDNyM6P+ptaVGhgGe9K2FdMhoFiZRN7EHhx1kiUFqZwsF7QqKvbYqnYH8Wl1RDUrBLq1PeeJPZDXt/UxgQgALH5ZA6V71jmjwS8ZFhQXyLHe4CiSV2wsKGcprEqXvj6ZoCqsjHxQxuicFm3ZUoWqG8t9x/96KhhfffO17H9/8Yc8whem5m5s3k65j7Re6aLV96t15bQXbRVQOm+Z092avcxhfcGMS/GxTaWy61U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR02MB5427.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(64756008)(316002)(71200400001)(186003)(8936002)(966005)(66446008)(2906002)(9686003)(7696005)(6506007)(122000001)(4326008)(76116006)(66946007)(52536014)(38100700002)(66476007)(8676002)(66556008)(55016003)(38070700005)(83380400001)(6916009)(33656002)(86362001)(5660300002)(508600001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWpyUXZGMWVpdlJ6NFpvWW5remdlZytwV2dwM1Vmd3NNcVNSdmFTRVlTWWRz?=
 =?utf-8?B?TExhcEdzY1ZRWWxGYzFmZDNxQldpV1NnLzQwSC9JbklWejdXd0JGVzkwNnlk?=
 =?utf-8?B?eHJJOU1MMmMvdStNTUZhZW5MOXlSVUI0S1Nsdm10QXFqbGFLSnM1NUtzQm42?=
 =?utf-8?B?VlVna2YyMFgwSjNXVHJtV1hYdk4ycjJNWGVOR0xHK3pyTGVPRU4zOGxncG9L?=
 =?utf-8?B?K1FlVzR6Mlprc2ZsWUZ6WkY3ckdoRm1XQ0IwSnJiMysxOWhrdGdDZ2dlKzN2?=
 =?utf-8?B?T01jMmQ4amZQWVllQ1R5QUk5S1ptOGFSc1IyZzdOWjNjQTVoQWRNa1FSMlFN?=
 =?utf-8?B?akhMNEUrelVXT2dXYVQ2SSt0WlZxUXlxS0ZuNHJ3NktFejE2TENhTmkzbGZi?=
 =?utf-8?B?czlsdUNLWFpPUzViSFE5TFlmTHdsbGRNSGF0TzZvcFNBbVJsWktvWEU3am1Y?=
 =?utf-8?B?Uzl4SUxSRXJPcWVxSEJMOVFMekIxWVJmN0ZoTkJXWm1DRldIL1ZhbWlhWnYw?=
 =?utf-8?B?TWI2dVRPZnFzK09OYTNxanhnWXdqU0VBUWJTbzAzVmJFZDFHUjZzQXJkdXVJ?=
 =?utf-8?B?dEFkY0VPSjl4YVRKUVhlWlhXdldLS3kwK0VISSt1N3R1R0FrdURyMGk3TW5t?=
 =?utf-8?B?NEFTS0Z4Z1NnVkJTN2tiNStYWkp0cFI0a2NSWDBIN2kzRElPUWZuZXo1NURh?=
 =?utf-8?B?VzdiUjErTmxnUVJCKzlJL0R4ZGI3TU1tS09OeUR6OVlVTFdYRUdMYWhYL294?=
 =?utf-8?B?NytmRkFTUGJzclhFZVk1ZzU5WklBM3E0OGVoQnhEeFVXUEZVV202elJVNTNQ?=
 =?utf-8?B?emxsL01lY0N4SHREU0pId1pWV20zTHpGVExTbkx2aUQrd2VyMFY1bnY3NnRZ?=
 =?utf-8?B?TnhLdmovR0x2cDRyekYwSzZXWk1ZMXdRTitGcC9RSjB6dmNiWTh5ZG9UMm9u?=
 =?utf-8?B?dUhCbDB0R3krTkFIQ05BaGNKMlNTbEI3RkZGQXM2Y0hUbTRYZ0lxdUgxTnBh?=
 =?utf-8?B?VUduWTVYcUxURG5lK1g3dGRtM0pXeEQzVnVTd0pMNnNZbnhzdklBZjY3YVJE?=
 =?utf-8?B?VWpheUpVVmZ1VVNReVpiTHFMKzlpeHFWeEJCZW9GYXpTZDdHT0dFVHNSV2pE?=
 =?utf-8?B?MHNtNGZsMWR3RlBGK3B1c2U3UXZjNWJlUEdoMU9xTDJqUkgyeStpUGFqTG9p?=
 =?utf-8?B?akJPUy8xekR1Q1Z6WWxTUU1BUEJLdzJua0pURXB5YUtDSGR6V1Y3U1dWaXhm?=
 =?utf-8?B?dnBscU51RnE5VCtFTW53OHBYekl5UzFZOStmdFM0dm1TY2t1ZlNnVlI1WmZw?=
 =?utf-8?B?UWs1eHh4QmxCY0ptcU03T0JKSVdDSzRYL2thcUlhNi9QYUtRenpRRkx1Z3pq?=
 =?utf-8?B?OXRCeVhObDh3MWhKdk0vd0Rnb3NPcC8rVmJEeks5REVWQXU4MTI2MUZLQ0Qx?=
 =?utf-8?B?S2lsUk5OSjE2TGlRVk1NSCtKRjdBMERSL0EyOStrbmtJTDMrU2poczE4RWh4?=
 =?utf-8?B?SmRodnY4eHh4Q0M1OWZGK283cjczNmtkK081YkQwMzJQaVkwR2VmNk91Tkgw?=
 =?utf-8?B?SlNqTjlLYnR5MmVsWkh6ZE1yTFFDRHZ5dEQrWE5Zb0hFTGJtL0NaeFB2L1lx?=
 =?utf-8?B?elJYVmhRRlcrcENzMWZ1VHFKSUFncG82c0VxcVVPYzJIZXRxc2hHYTlJUE9Y?=
 =?utf-8?B?Njk4b2VTai9DTFFqOGNJUnU2T2lDeFFEYVpwb2NFT3Z1TVNSUVE4Rko1VWFZ?=
 =?utf-8?B?Y0RKT2kxb0dGRm9CQ3Y4L3dRVHhCeDIxSStJZkFnNGhWUXVyQzcvK3dqR2Vu?=
 =?utf-8?B?UkMyMmZGemZPZ3FCc0IxYnlzdmxJbkI0elRQR3Z2OVpibFo2NmQ2ZUcyYzF6?=
 =?utf-8?B?UUFzbW4xU0dGN2MyMFp3WmVGaDRvZFRVM2FnSEZBdXlraTFWc2VmN2FtV0ZK?=
 =?utf-8?B?MDc4aXNkNklUZkF6Rm9mM0R3OURRWWtReFJ0dlZ2Qjg3eHNlWFFZd3RKeGNB?=
 =?utf-8?B?N3h0YXJkZHhqeUcyZzdDYnQrUy96aWxMWC90bjN5Vlh6cjhFZVJUekhUZHkx?=
 =?utf-8?B?TTdycmRPZE9hWFRSajdCSlpIRU9uS3RBU3czT1JCRlVCMkVoekJaMnN3VXd1?=
 =?utf-8?B?cG5tTEw1OEFYQytvaXY0ZnZ3MGs2UlpRTkw4M0RHTEFvbHhpb3pOd2pIL2Fq?=
 =?utf-8?B?Z3ozNDZZNm5lL0ZIemFCMlFMZVJ3NUdmU2JIcnJwTEtlRmR0am16NmNxWm5B?=
 =?utf-8?B?em1MUHRNZnZKZEJpUDd4ZGNTWk9Nd2dNbVRDK0RkczVRcWh6MnhoYXh5RHRH?=
 =?utf-8?B?N3NZZmhwa2pNdDE5bFUwQWhIb05XSUV5cDJSbmZKem9sbURTZ2FwOVV3elpK?=
 =?utf-8?Q?rA/qJAU78YHsy3tzPgcGyJHksVG0kT65hgyCbQ8BoGl1B?=
x-ms-exchange-antispam-messagedata-1: J9LtMfIfAzNjpaOQ+pMeQxEk6H1UxVsjPeHWqgDT97fHqCOBub3HLWKA
MIME-Version: 1.0
X-OriginatorOrg: getinge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB5427.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde1491a-c511-4b0a-c6d5-08da1ddb1db5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 05:53:35.9060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d5faa72a-2614-4d56-abd8-865197339e56
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Om/OW5B74e3vsie4K6o2MaKeCRRx6unssnXS4OlwY979U/3K4jyvivMOrUW9ILJ3VViJiYJISaiwVkWZCSVeWbh7dG4124ze1loSEOnDyl7hkBE6fz0dRaQjcvVJ4v9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2853
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: getinge.com
Content-Language: fr-FR
Subject: Re: [Buildroot] [EXT] Re: [PATCH 1/1] package/opkg: enable openssl
 signature
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwb2ludC4gTWF5YmUgeW91IHJlbWVt
YmVyLCBJIChzdGlsbCkgdXNlIHRoZSB2ZXJzaW9uIDIwMjEuMDIgb2YgYnVpbGRyb290IGFuZCB0
aGlzIHZlcnNpb24gaW50ZWdyYXRlcyB0aGUgdmVyc2lvbiAwLjQuMiBvZiBPUEtHLiBUaGUgcXVv
dGVkIGNvbW1lbnQgaW4gT1BLRyBzb3VyY2VzIHdhcyBpbnRyb2R1Y2VkIGluIHYwLjQuNSBhbmQg
dGhlIHJlYXNvbiBpcyAicmVsYXRpdmVseSB1bnVzZWQgZmVhdHVyZSIgb2YgT3BlblNTTCBzaWdu
YXR1cmVzIChodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2cvb3BrZy1kZXZlbC9jL2RycXc1X0h1
WHVVKS4NClNvIEkgYWdyZWUsIHRoZSBPUEtHIHByb2plY3QgcGxhbnMgbWFrZSBteSBwYXRjaCB0
byBidWlsZHJvb3QgdXNlbGVzcw0KDQpCZXN0IHJlZ2FyZHMNCg0KRGUgOiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPg0KRW52b3nDqSA6IG1lcmNyZWRpIDEz
IGF2cmlsIDIwMjIgMjM6MDkNCsOAIDogQW5kcmVpIEZPTUlUQ0hFViBIRVJWSUVVIDxhbmRyZWku
Zm9taXRjaGV2aGVydmlldUBnZXRpbmdlLmNvbT4NCkNjIDogYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcNCk9iamV0IDogW0VYVF0gUmU6IFtCdWlsZHJvb3RdIFtQQVRDSCAxLzFdIHBhY2thZ2Uvb3Br
ZzogZW5hYmxlIG9wZW5zc2wgc2lnbmF0dXJlDQoNCkNBVVRJT046IFRoaXMgZW1haWwgb3JpZ2lu
YXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQg
a25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KDQpIZWxsbyBBbmRyZcOvLA0KDQpPbiBXZWQsIDEz
IEFwciAyMDIyIDA5OjMxOjE5ICswMjAwDQpBbmRyZcOvIFYuIEZPTUlUQ0hFVi1IRVJWSUVVIDxt
YWlsdG86YW5kcmVpLmZvbWl0Y2hldmhlcnZpZXVAZ2V0aW5nZS5jb20+IHdyb3RlOg0KDQo+IE9Q
S0cgc3VwcG9ydHMgZWl0aGVyIEdQRyBvciBPcGVuU1NMIHNpZ25hdHVyZSBjaGVjay4gSXQgaXMg
YWxyZWFkeSBwb3NzaWJsZQ0KPiB0byBlbmFibGUgaW4gYnVpbGRyb290IHRoZSBjaGVjayBvZiBH
UEcgc2lnbmF0dXJlcy4gVGhpcyBwYXRjaCBhZGRzIHNpbWlsYXINCj4gY29uZmlndXJhdGlvbiB0
byBlbmFibGUgdGhlIE9wZW5TU0wgc2lnbmF0dXJlIGNoZWNrcy4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmXDryBWLiBGT01JVENIRVYtSEVSVklFVSA8bWFpbHRvOmFuZHJlaS5mb21pdGNoZXZo
ZXJ2aWV1QGdldGluZ2UuY29tPg0KPiBDaGFuZ2UtSWQ6IElkMmM3NmIzY2IzOWJhNWVlZDViZDBi
ZWY3NjQ4Zjc5NzAwMzNiODdiDQoNCk5pY2UgdG8gc2VlIHlvdSBoZXJlLCB0aGFua3MgZm9yIHRo
ZSBjb250cmlidXRpb24hDQoNCkhvd2V2ZXIsIGFyZSB5b3Ugc3VyZSBpdCBtYWtlcyBzZW5zZSB0
byBzdXBwb3J0IHRoaXMgYW5kIHVzZSB0aGlzPw0KSW5kZWVkLCBvcGtnIGhhcyBkZXByZWNhdGVk
IHRoZSB1c2FnZSBvZiBvcGVuc3NsIGZvciBzaWduYXR1cmUuIEZyb20NCm9wa2cncyBjb25maWd1
cmUuYWM6DQoNCkFDX01TR19XQVJOKE9wZW5TU0wgc2lnbmF0dXJlLWNoZWNraW5nIHN1cHBvcnQg
aXMgZGVwcmFjdGVkIGFuZCB3aWxsIGJlIFwNCnJlbW92ZWQgaW4gZnV0dXJlIHJlbGVhc2VzLiBD
b25zaWRlciB1c2luZyBHUEdNRSAoLS1lbmFibGUtZ3BnKSBpbnN0ZWFkLikNCg0KU28sIGl0IGlz
IHJlYWxseSBzZW5zaWJsZSB0byBzdXBwb3J0IHRoaXM/DQoNClRob21hcw0KLS0NClRob21hcyBQ
ZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4NCkVtYmVkZGVkIExpbnV4IGFuZCBL
ZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nDQpodHRwczovL2Jvb3RsaW4uY29tDQpUaGlz
IGVtYWlsIGFuZCBhbnkgZmlsZXMgdHJhbnNtaXR0ZWQgd2l0aCBpdCBhcmUgY29uZmlkZW50aWFs
IGFuZCBpbnRlbmRlZCBzb2xlbHkgZm9yIHRoZSB1c2Ugb2YgdGhlIGluZGl2aWR1YWwgb3IgZW50
aXR5IHRvIHdoaWNoIHRoZXkgYXJlIGFkZHJlc3NlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhp
cyBlbWFpbCBpbiBlcnJvciBwbGVhc2Ugbm90aWZ5IHRoZSBzeXN0ZW0gbWFuYWdlci4gVGhpcyBt
ZXNzYWdlIGNvbnRhaW5zIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBhbmQgaXMgaW50ZW5kZWQg
b25seSBmb3IgdGhlIGluZGl2aWR1YWwgbmFtZWQuIElmIHlvdSBhcmUgbm90IHRoZSBuYW1lZCBh
ZGRyZXNzZWUgeW91IHNob3VsZCBub3QgZGlzc2VtaW5hdGUsIGRpc3RyaWJ1dGUgb3IgY29weSB0
aGlzIGUtbWFpbC4gUGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGJ5IGUtbWFp
bCBpZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBieSBtaXN0YWtlIGFuZCBkZWxldGUg
dGhpcyBlLW1haWwgZnJvbSB5b3VyIHN5c3RlbS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVk
IHJlY2lwaWVudCB5b3UgYXJlIG5vdGlmaWVkIHRoYXQgZGlzY2xvc2luZywgY29weWluZywgZGlz
dHJpYnV0aW5nIG9yIHRha2luZyBhbnkgYWN0aW9uIGluIHJlbGlhbmNlIG9uIHRoZSBjb250ZW50
cyBvZiB0aGlzIGluZm9ybWF0aW9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
