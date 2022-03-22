Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B105C433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 08:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF23340476;
	Tue, 22 Mar 2022 08:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUfUoaXio-7B; Tue, 22 Mar 2022 08:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7474040360;
	Tue, 22 Mar 2022 08:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C5DDC1BF2CD
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B30F3415F1
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 08:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NaDcuyPtv39x for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 08:16:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 099F4415F0
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 08:16:56 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2058.outbound.protection.outlook.com [104.47.60.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-riIMv8JfMguufwAHskWJ2w-1; Tue, 22 Mar 2022 09:16:52 +0100
X-MC-Unique: riIMv8JfMguufwAHskWJ2w-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YQXPR01MB4577.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:1c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Tue, 22 Mar
 2022 08:16:50 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:16:49 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: Arnout Vandecappelle <arnout@mind.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [External] Re: [Buildroot] [PATCH v3 1/1] package/rpi-firmware:
 fix missing files in overlays
Thread-Index: Adg57IpbJyf/ee8rToaft+SJaOOmcgDggGGAABTb0VA=
Date: Tue, 22 Mar 2022 08:16:49 +0000
Message-ID: <YQXPR01MB6121253D5991F7A70EEB49E3AE179@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
References: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
 <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
In-Reply-To: <c2c49834-638c-dbfe-bbba-7bcbe153a660@mind.be>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd0e389b-24e6-4560-4d34-08da0bdc50a1
x-ms-traffictypediagnostic: YQXPR01MB4577:EE_
x-microsoft-antispam-prvs: <YQXPR01MB45772035DF8A6BA31A4B45E3AE179@YQXPR01MB4577.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: Ch82BvR9jW1bJzrzcLvOyfkBS8qCzc13oQ4V6kfbVWH1IL+cVTDNRSLwA4B39mTc2mb/y2yE+mdWIzgachEBlkUbWCTwlVrs15sYwjZwRmxPXut5T/R+bQP2ug8FvF0KUmVIHMm/iAnDTdSp7r1daDnO+0ouQfwVgpjL+huoMRB4+tXsTzHinetpR1dqjpPF2MY3eejpIah9uLVK3qs1mq251YuU8sJuvGmXlWzjL/gCSqjPdKa+S4dwenfnadmypUdZNwQVBEN2PDdcepn21kPgi9ps9UymL9YSi9c99kHrJMNjbpQWOIdX7OTYTtXu2zktrtpG2OlTB0IXNYw4jLb49rmCSI+Dw6M/+R36M0JfbtngqeUA3uDMaYjOb8dMnZ7BCjwiTM3fuiw0Vpq/22uCOiKZLDDjYShmWfsg9ocA6Uuy7hb5DHNJEGmE+IVfvl/DJ/34W0cA7C/Atnm+e5n1imoA8DfU6A48U2It09GKW1m6tMh8uUoqmMd+AxGbrf8VN0KwK50fMiJ5h25MNFeFWdI4azsEfIEhvL6Bz7B6tPdpuA0bV4KzfBuUp2Gp0N9MJmXupYAcRtMt/i6XDCjHp0C38pfpe06y2SU55CgU9YQCY1xh8D84e+k3z2XPhR3BmTgVZ3UFW3JAZlZIJ3gTgq9af7n3+m1MgxEeEPKzwipx314VqkY/k5TT6xmr0h1DQ6lTc7B3Tm/fQx1KT8JseCKv8mcdusnWJ+PB4CSfRRa2wAjaePPvsURu9U1HEzA7BHyC+JwXAdBK7V9KSMHf5oQX9BYIIItuW8/VS1OGpX/5PqQA7QBQ3H+N1B0Y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(71200400001)(110136005)(33656002)(38100700002)(8676002)(55016003)(4326008)(76116006)(966005)(66476007)(66556008)(66946007)(508600001)(64756008)(66446008)(186003)(26005)(316002)(38070700005)(122000001)(5660300002)(9686003)(6506007)(7696005)(52536014)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXZtL2NQNEkyN2EyTU11VC8zT0ZYY0VWOVhrYVhjdG0rOW5VdyszUEJPQmRn?=
 =?utf-8?B?ZVdWV1Z5ZnpFUDN5M1hhL1VhN0RpQzhoNUoxeklBZ0duRXJuNWV1NE5idXRZ?=
 =?utf-8?B?ckdaNnZGd0YwbFg2OE1HRS9ZU3F3azJ6LzNlYi8yR2JlSi9SRmZPa2F4YzV3?=
 =?utf-8?B?RDduaTBWK2szY3Fib243N3VkQ3lzTTkwZzBqRXFOL2NNWjc4VUVnazdBb21N?=
 =?utf-8?B?NG9YMG5MNzFTbHlxeldVR05nNHRPS1ZQT1kvdm1UUVlRYXlyLzdOaFVTdmpy?=
 =?utf-8?B?SVFCSXZMMm5QL1JrZURrek1yOUxsTWRZY3M3TlR4YXRnUEROeVdCY2lzZWpz?=
 =?utf-8?B?NFJHNlFybkNHRjFERnVKVU1TNFVXM2xKUVNhbzBEdHVJemZDRzhjYjlmeG00?=
 =?utf-8?B?L3NRbEIwdGp1OG9jaVliWDB4cGd0T1RoaFBYNjlrTUJ3UTlGOGovU0tzRUMw?=
 =?utf-8?B?Y3RkTGhJY3ZmM2FnRmkzVE5aZy8yQ1FXUWw4ZThVdjVMc21MaHduZG5ncTAw?=
 =?utf-8?B?blBJZCtCSTc2VUNyNmpKVENzUjFBekZoYWdLa3dKZ3Zjekpub1MwNmp1bjhB?=
 =?utf-8?B?SGJCLzMwZ0JIQjJzSFZybkhZN0VGUTNsK01mQjRmcDZKdmRCM3lXdnBUMHVQ?=
 =?utf-8?B?ZE1WN1RTWTBKR2Q0cHhqaXlzTUVidDhNRWwzRXVmL3FITXIvbjlLdzk5NEp5?=
 =?utf-8?B?dS9nOExqT1BBN3NvRHE0QWpOODcxN3prVjVFTExTUTVWK0JjRGxBV25mWTFJ?=
 =?utf-8?B?RWhMR0syTEJ1Y0RVWXVuSzkyZ1cxN292YXUzdUZ6dHIvR3ZLT1NNdVM1NU9o?=
 =?utf-8?B?NDdVaHdPVlJKVnpMVktLYUJvay9GWkRVRjU4YjhRU0NJd1p3NHZtalBsR2k4?=
 =?utf-8?B?S2RuYnJUNXp1S0VhamJDRHRrTXBhdThUTVdDaFBwV1BLUVBGeUkyMFZRanFz?=
 =?utf-8?B?VUtldzhyTExuUGpxODBFZTlaejY1ZUVzc25mV2taRFAxeDRrd2hFMjZTaDNs?=
 =?utf-8?B?UnFwcUNOV1BqOHB6QjhpN09KV0VCQkR5T3dWTzRGVE9HcFl3R0I1ekhoRkh6?=
 =?utf-8?B?RkVNT0pxb3pRa2VDVG5jS0VlMjVGblRFQkZSOCsyOEU0ciszbFEvOXBVMytj?=
 =?utf-8?B?L3pLUU5sRUpxWVZhOXhTM21GRi9Oc0h6YzBqL2dIWWRDZHh2aWM2UmtYRjBZ?=
 =?utf-8?B?WlphS0EvbnBVcVhrTmZFODBObExjNmpFMXpLbC9rZ0ZyUGpLUStraUdxQ2tx?=
 =?utf-8?B?VW1xZWZtWWJDWFRNNVhvRURXenRYZEpnYU9ZRis0T0FoeXZxZ2FscVo1NFhJ?=
 =?utf-8?B?a0RFNmlmK2ZYZ2lsM1hOTnR3RFE3eFVtNmsrdWxIVE4vYUxiRmpTazFOcGtV?=
 =?utf-8?B?cEs0YnpXOWFPUGJtSUtKWkVoeUhuZXRyanMveVlvd3lMOFN3dU9tR201YUp4?=
 =?utf-8?B?K0ZvQmRoMkVIV1ZlM05pQzViQi9jUEExT1RzNnVDcktkVS9aRVFPNFUydXF3?=
 =?utf-8?B?NnlQeDN1dmNJdVFoQ2o5RFg5Wnk1VlZHM3lJSVNRdVBneGE5ZS9CYXRFU3RI?=
 =?utf-8?B?eGtyZ1MwaTVwMGRiT1J5UHpmdjhqcFNMdU5tRFZ0K3J1aGpadnJoUVN4dWpx?=
 =?utf-8?B?TERZVzBPNC8wY3h4M093UFdOQ0dHRmZvdytlNXBNeTA0SXBrK24veFZMVC9U?=
 =?utf-8?B?QkZKaUJBd3UrTTBMQ28xUUZJcjFmTjM5ZjdwWkNCOUlvWlZBNGMxS3RGTjI3?=
 =?utf-8?B?ZGNnNVVDYkpzRHBDb0t0a2NlR0xMeFZlaFNWdkxIdnNNbFh0dUNZRVpiSzV5?=
 =?utf-8?B?TlJIQjh4TGFrZXowbUhzaTVYM2Y0YjdHNGYzMVRTWGdlbXczdVRvcHlTWXAy?=
 =?utf-8?B?Si9BZ2JqbzVHanJibUdZdFMzYmMzdUV6cHV4RWxMK0dXVERWN0dHMkd1UjlL?=
 =?utf-8?B?WGZMdkR4U1lIdURlSXBEOXZZMTlhRHdnK3dFdWlsVTdyR2VlZDJQS0tqMkNK?=
 =?utf-8?B?a0FwL2czK09BPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0e389b-24e6-4560-4d34-08da0bdc50a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 08:16:49.9179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F40AjweQ6kGeIGROKxRLJLfwBipCRPIlQdGx1P20ve8F6uqTV1rNpP7S9orZdBtM6Sp9V+ajFuzKNJiJr0yGp+zcDWyJEpv50SR4ZhSQGMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB4577
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: Re: [Buildroot] [External] Re: [PATCH v3 1/1] package/rpi-firmware:
 fix missing files in overlays
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
Cc: Peter Seiderer <ps.report@gmx.net>, Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: multipart/mixed; boundary="===============0573650484934691845=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0573650484934691845==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203220916533871"

--MCBoundary=_12203220916533871
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkgQXJub3V0LA0KDQo+ID4gV2hlbiBzdXBwb3J0aW5nIG11bHRpcGxlIGhhcmR3YXJlIHRhcmdl
dHMsIG92ZXJsYXlfbWFwLmR0YiBtaWdodA0KPiA+IGJlIG5lZWRlZCB0byBtYXAgb3ZlcmxheSBu
YW1lcyB0byBvbmUgb2Ygc2V2ZXJhbCBpbXBsZW1lbnRhdGlvbnMuDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogUnV0Z2VyIFNhc3NlbiA8bWFpbHRvOnJzYXNzZW5AY29tZWNlci5jb20+DQo+ID4g
LS0tDQo+ID4gcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluIHwgMTIgKysrKysrKysrKysr
DQo+ID4gcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rIHwgNyArKysrKysrDQo+
ID4gMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvcnBpLWZpcm13YXJl
L0NvbmZpZy5pbg0KPiA+IGluZGV4IDgwNzBkYzMwMTkuLjM2MDU0MzUzZjggMTAwNjQ0DQo+ID4g
LS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluDQo+ID4gKysrIGIvcGFja2FnZS9y
cGktZmlybXdhcmUvQ29uZmlnLmluDQo+ID4gQEAgLTkzLDYgKzkzLDE4IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9SUElfRklSTVdBUkVfSU5TVEFMTF9EVEJfT1ZFUkxBWVMNCj4gPiBvdmVybGF5cywg
dG8gc3VwcG9ydCBIQVRzIChIYXJkd2FyZSBBdHRhY2hlZCBvbiBUb3AsIGFkZC1vbg0KPiA+IG1v
ZHVsZXMpLg0KPiA+IA0KPiA+ICtpZiBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfSU5TVEFMTF9E
VEJfT1ZFUkxBWVMNCj4gPiArDQo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVf
SU5TVEFMTF9EVEJfT1ZFUkxBWV9NQVANCj4NCj4gSW4gdGhlIGVuZCwgSSBkb24ndCB0aGluayB0
aGlzIG9wdGlvbiBpcyB2ZXJ5IHVzZWZ1bC4gU28gSSByZW1vdmVkIGl0Li4uDQoNCi4uLg0KDQo+
IC4uLiByZWR1Y2luZyB0aGUgcGF0Y2ggdG8ganVzdCB0aGlzIHNpbmdsZSBsaW5lLg0KDQpBbG1v
c3QgYmFjayB0byB0aGUgZmlyc3QgaXRlcmF0aW9uIG9mIG15IHBhdGNoLCB3aGVyZSBvdmVybGF5
X21hcC5kdGIgYW5kIFJFQURNRSB3ZXJlIGNvcGllZCB1bmNvbmRpdGlvbmFsbHkg8J+YiQ0KDQo+
IFBsZWFzZSBjaGVjayBpZiB0aGUgY29tbWl0IFsxXSBkb2VzIHdoYXQgeW91IG5lZWQsIGlmIG5v
dCBJIGNhbiByZWNvdmVyIHRoZSANCj4gb3JpZ2luYWwgcGF0Y2ggd2l0aCB0aGUgaHR0cDovL0Nv
bmZpZy5pbiBvcHRpb24uDQoNCkkndmUgY2hlY2tlZCwgYW5kIGl0IHdvcmtzIGZvciBtZS4gVGhh
bmtzLg0KDQo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuDQo+DQo+IFJlZ2FyZHMsDQo+IEFy
bm91dA0KPg0KPiBbMV0gDQo+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290L2Nv
bW1pdC8/aWQ9ZGEzOGNkZWFkOTA5YWExMzNiOWM0NjhkZGViZjNmNjdjOGQxOThmMg0KDQpSZWdh
cmRzLA0KDQpSdXRnZXINCg0KVGhpcyBlbWFpbCBjb21tdW5pY2F0aW9uIGlzIENPTkZJREVOVElB
TC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IG1heSBub3QgdXNl
LCBjb3B5IG9yIGRpc2Nsb3NlIHRvIGFueW9uZSB0aGUgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRp
b24gY29udGFpbmVkIGluIHRoZSBtZXNzYWdlIGFuZCBJIGFzayB0aGF0IHlvdSBwbGVhc2Ugbm90
aWZ5IG1lIGJ5IHJldHVybiBlbWFpbCBhbmQgZGVsZXRlIHRoaXMgY29tbXVuaWNhdGlvbiBpbW1l
ZGlhdGVseS4gVGhhbmsgeW91Lg0K
--MCBoundary=_12203220916533871
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hi Arnout,<BR>
<BR>
&gt; &gt; When supporting multiple hardware targets, overlay_map.dtb might<=
BR>
&gt; &gt; be needed to map overlay names to one of several implementations.=
<BR>
&gt; &gt; <BR>
&gt; &gt; Signed-off-by: Rutger Sassen &lt;mailto:rsassen@comecer.com&gt;<B=
R>
&gt; &gt; ---<BR>
&gt; &gt; package/rpi-firmware/Config.in | 12 ++++++++++++<BR>
&gt; &gt; package/rpi-firmware/rpi-firmware.mk | 7 +++++++<BR>
&gt; &gt; 2 files changed, 19 insertions(+)<BR>
&gt; &gt; <BR>
&gt; &gt; diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmwar=
e/Config.in<BR>
&gt; &gt; index 8070dc3019..36054353f8 100644<BR>
&gt; &gt; --- a/package/rpi-firmware/Config.in<BR>
&gt; &gt; +++ b/package/rpi-firmware/Config.in<BR>
&gt; &gt; @@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OV=
ERLAYS<BR>
&gt; &gt; overlays, to support HATs (Hardware Attached on Top, add-on<BR>
&gt; &gt; modules).<BR>
&gt; &gt; <BR>
&gt; &gt; +if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
&gt; &gt; +<BR>
&gt; &gt; +config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
&gt;<BR>
&gt; In the end, I don't think this option is very useful. So I removed it.=
..<BR>
<BR>
...<BR>
<BR>
&gt; ... reducing the patch to just this single line.<BR>
<BR>
Almost back to the first iteration of my patch, where overlay_map.dtb and R=
EADME were copied unconditionally =F0=9F=98=89<BR>
<BR>
&gt; Please check if the commit [1] does what you need, if not I can recove=
r the <BR>
&gt; original patch with the <a href=3D"http://Config.in" target=3D"_blank"=
>http://Config.in</a> option.<BR>
<BR>
I've checked, and it works for me. Thanks.<BR>
<BR>
&gt; Applied to master, thanks.<BR>
&gt;<BR>
&gt; Regards,<BR>
&gt; Arnout<BR>
&gt;<BR>
&gt; [1] <BR>
&gt; <a href=3D"https://git.buildroot.org/buildroot/commit/?id=3Dda38cdead9=
09aa133b9c468ddebf3f67c8d198f2" target=3D"_blank">https://git.buildroot.org=
/buildroot/commit/?id=3Dda38cdead909aa133b9c468ddebf3f67c8d198f2</a><BR>
<BR>
Regards,<BR>
<BR>
Rutger<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203220916533871--


--===============0573650484934691845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0573650484934691845==--

