Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C713EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 15:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D0240A01;
	Thu, 17 Mar 2022 15:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqduTEpuBGOg; Thu, 17 Mar 2022 15:28:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50D21401F4;
	Thu, 17 Mar 2022 15:28:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4E8A1BF25F
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 15:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BD1401F4
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 15:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hk3AFVuYr64G for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 15:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.109.105])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 466ED401B6
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 15:28:45 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-z8aqxhWQOOqJlkh6-kxvPQ-1; Thu, 17 Mar 2022 16:28:41 +0100
X-MC-Unique: z8aqxhWQOOqJlkh6-kxvPQ-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT3PR01MB9106.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 15:28:39 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 15:28:38 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: package gdk-pixbuf relocatable issue
Thread-Index: Adg6E2briGSk42OKS5+H/ugTKYNhhw==
Date: Thu, 17 Mar 2022 15:28:38 +0000
Message-ID: <YQXPR01MB6121EED8177153AF152808E3AE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9efd30f3-c1c9-494a-6a89-08da082acf6b
x-ms-traffictypediagnostic: YT3PR01MB9106:EE_
x-microsoft-antispam-prvs: <YT3PR01MB9106071EC40CD2EFC0D0FCF9AE129@YT3PR01MB9106.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: jgyHS105sCKnFl56PdK3bQMPWkzZvsQUKdWvpUEDj8ZjgJWAKpDlanPOyJ0Kd3e9f3HBjZ565Rm2HiniGzKcU5ccazoXRdSzYbb2Wi9HXFsRJ7/UYqLL/qL0UV4KFIXV9jEgpP7pIFTXXYixYQRDBYQejzqLG02gg/9RmLY0287S/ilWQN+zZqqT0ReQrl5wB1m8FFoTUNgbilBaG8mP8qY/orIqLBQxupqS9FgBrKmu2Pi3Hfw7xnz7ju3X230EPmiQQm3Oysz8QgsqFiUxXNfZsVN/tpRO3Fsp+yWuh2+9JKGNuZ4Q3NpTO93JofTZ2U6T/rNpriD+2lU5WV3fa6sBn0eos8KsrHcJ/Gs8g+6sAIyz7VmLJhrbk6Alr644W+ayQTrcXRMrH0UVBfy+ZzoqHVW6CgwkIFL25OE46hYeaMYCHrk+pmCR6q6FaQmSPsLrG5jh2NNjyBo1ZeI1iliBBKb+a0MI1TiGzRauvTxXG70WN0h/3ugbn7YLAgr7Hcd1qJsCyWgylXj+IR090UX0sTTenw+Blwny5kbvv7bUUMeOQxi584LDsxZwC7zW3AgAXnwUxW6kj3bVrobeiXMY7rO/OiX6CWh+5aZVNAaGQjRJITNv3U/a+FGxW0/3H8eLTVifDZnrZlZtG0Hlp9Vz9Qp64YQIjE/gDteTKhh2lAWadTcv/log7In7s9vJi0Mg+2eMM/890PsONcFugeviJC3b6+dBah8QJ1rLG00CtRkFgVLN2lFm6mGLPJoYfKwlkiVEcjZArAgJgm4trn3ak95k41RAsgjHzhRqJI6zwIaahzjYU00nE7dJizg167OM0OaScN5yc9iqSXyksw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(83380400001)(76116006)(66556008)(66446008)(66946007)(66476007)(966005)(38100700002)(64756008)(508600001)(7696005)(6506007)(3480700007)(33656002)(9686003)(38070700005)(8676002)(52536014)(186003)(26005)(4326008)(8936002)(55016003)(2906002)(6916009)(54906003)(122000001)(86362001)(316002)(71200400001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUovQ3FHTmFiTXZISWlrNGVIYUM1NW00bWhDNzlmbnAzTE1SdHUxalB4TlAw?=
 =?utf-8?B?SmV0ZmJTK3BFNmVjTFB3dVd5djlKdXl2a2thZkw0RGU3SnluanFqMmpCOWN2?=
 =?utf-8?B?TDVSdFdkNmZhb1RpQUgrWVlLSGllbVQ5b3N0aHBSVVdNNU90ejl3czJOalBD?=
 =?utf-8?B?MnltaFgzYzBkTFZpeXZBdXR1R0p2ZEpxdVl6eHZCbGVLUXNSeVh2TTFNSWVx?=
 =?utf-8?B?OGVUVXB5NGxYbHpESk9LV2VXQmZGbjZmcytzbzNCTGEzTGh4ZXRVcTlQUml4?=
 =?utf-8?B?My9zTXNsdnhBaFljYlhHZFZrbHZ0Z0g2WmREeklNVmhnbGVIdGlZS2ZKd1lx?=
 =?utf-8?B?Y0lBVTRlb3Z5RUZydHc1L3ZuZ2pxakErWHY1Z2NvZWtSVCtoSUszOHpaMXNj?=
 =?utf-8?B?UVl4SkhQdSt3VlpPQk54STh3Kzk4aXRBWWRWeVdDamdTWjU1Z0FyZmYzSDhm?=
 =?utf-8?B?cWMvSUNpZkhtSnVzNUZNem1OcENQbXpaV2NCbTRzemhaVkRrYzRBTHJlb2VR?=
 =?utf-8?B?L0dSM3ZvQ0s5VTFYVGN4NnBRSEE4dE10VWE2ZS9xOXkyaWxHSVFoc2tEeUdm?=
 =?utf-8?B?aWJ2eEp4Q0NnMmF4MTgyeFhNZTJXcE42TG9yejdwbEQwY050NkxCbjFJSzZX?=
 =?utf-8?B?Y1pWbzdhUTNYY0VKM0N4ZDFmT3Bkci8waWtsS0JvaDBpbVlRN0lZbjFITDg0?=
 =?utf-8?B?ek9xTnRDdDJhb0RqYkVwa09yNWRhQWlVN3M2NUVPemhkOFM4WU1PYkNRSnpa?=
 =?utf-8?B?b3MrK29aUjdreGllOHRyTlk4QzFpSEtYZjdDL3NPeGNTTHZ4NUZIclluN2pl?=
 =?utf-8?B?NVhXUEJ4TGZJTEtPeFBmdGhMTll5VnVvd1NNK2ZnOXBRTjlqa0xiam9qQVNx?=
 =?utf-8?B?N2pCdmtkT1hPNldZZVZoaDJkUUh2U1lZWVVMdXJES0l0OUpCTjZTY3piRnRn?=
 =?utf-8?B?MENwR0QyS1JpcFRoem9VSUVabDJXNDQxMm80YXpQc29jeDI1SmtGR3BoYklp?=
 =?utf-8?B?N2RYSElOWEtUZzlOK0d2dFVNNDVDTXZUZk5LaXQ3NnFHNDVpYlUzMFhFQWFi?=
 =?utf-8?B?RHBGMHNBejBDaTZDTllJWkh4S0VueWVFU3JpV0tEVG9lcTNpUHdXcW1RTFJC?=
 =?utf-8?B?NEh2VDNJZUE1UTgxQXRuLzZNL2dFRjk5VTBMSVU3MjRybTRtN2J6OVhUN3la?=
 =?utf-8?B?UkszYlZIUDgzNzVHVXkydzdDZ0pWd0REU0U2b0V3b0NWMHdLVDdKaGExL3dz?=
 =?utf-8?B?OTJJK2pVSTNCVHB3RE94K01FVzNiOExTa3BJZzFLZFZobXdrejBxeHhxNWN1?=
 =?utf-8?B?MzhSRTM5Z252QlpCMnl2U0c1a0NXNGU0K1R2L2IzS2dINWhmYVNPZE1rR2Vk?=
 =?utf-8?B?WmczMTAxUjRYVVpBbytNSFFBWHlHdE1wSmVnalFYcGxJdGRUUllxdmVRV1VO?=
 =?utf-8?B?Nmc0WGdRS1djSG5Ia1NzR3pCeHBrUE1CV25TWWE2S21JK0xDc0VLZlJlb3Y2?=
 =?utf-8?B?U3U3QUJvTXJBYWIweGVUUHZqMm54SWRDT3lzUXVTUFRtYXFKRmh2OTdwQ01m?=
 =?utf-8?B?QVZRck9qUFgxNnFmNWo1M2xtbGkrZklTWmEzKzdKRFFjUE9rRjJ2VEQ2VUFP?=
 =?utf-8?B?dk1taGhzaHd3T1FQZVU4a1V4d1RPdjE5OHhoUXRIdWFaTk84UlFrVGlXZkNU?=
 =?utf-8?B?bXg4czV4L3pqQW5KVkhVWHVqWWltOGZzZUpYdk5IVEd4VnByaS9UVE9QeWtp?=
 =?utf-8?B?ZXk2bTMyeFJIZ3FHdFNlNjAzMGpFdDg0c0dmMWVDMCtVRmV6SW9sOW4xN2lm?=
 =?utf-8?B?UWhGUmVXZUJoT3ZiTEk0RlJFaXRxaTRCVUxoSmJLcVJKNUNWc2U0YnFXVXdY?=
 =?utf-8?B?Zm4zcWhtOFlMY043alV5aGVHZVMxMzdabEhIdWdrMXhvY1NyTXN3MGZnSzdx?=
 =?utf-8?B?M0FNWXpaQmdIY2pYSlM3MnVzcEhGdnVldEJ4andxMTJsdit1WHlLWnRkQ1Zu?=
 =?utf-8?B?MFhmZlczS21nPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efd30f3-c1c9-494a-6a89-08da082acf6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 15:28:38.7137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TC0pW3MnFDU7Yb66a1GsjzQmqpVwVKbyfJEve+CqUsDmMP+FKIg7xkrDMopGnZoEEAktTRklyJOGZ9Us1mO3SyaoHgJ6vPpPKnFGHFK6GjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB9106
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CDE5A40 smtp.mailfrom=rsassen@comecer.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: comecer.com
Subject: Re: [Buildroot] package gdk-pixbuf relocatable issue
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
Content-Type: multipart/mixed; boundary="===============2594600827981184135=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2594600827981184135==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203171628423911"

--MCBoundary=_12203171628423911
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiA+ID4gPiBBIHJlY2VudCBwYXRjaCBmb3IgcGFja2FnZSBnZGstcGl4YnVmIHRvIGVuYWJsZSB0
aGUgcmVsb2NhdGFibGUgb3B0aW9uIGZvciB0aGUgaG9zdCBwYWNrYWdlIGhhcyBpbnRyb2R1Y2Vk
IGEgcHJvYmxlbSBmb3IgdGhlIHRhcmdldCBwYWNrYWdlLg0KPiA+ID4NCj4gPiA+ID4gVGhlIGxv
YWRlcnMuY2FjaGUgZm9yIHRoZSB0YXJnZXQgY3VycmVudGx5IGlzIGdlbmVyYXRlZCBieSBjb3B5
aW5nIHRoZSBsb2FkZXJzLmNhY2hlIGZyb20gdGhlIGhvc3QgcGFja2FnZSBhbmQgZWRpdGluZyBp
dCB1c2luZyBhIHNlZCBjb21tYW5kIHRvIHJlcGxhY2UgdGhlIGhvc3QgcGF0aHMgd2l0aCB0YXJn
ZXQgcGF0aHMuIFRoZSBzZWQgY29tbWFuZCBpcyBubyBsb25nZXIgY29ycmVjdCwgc2luY2UgdGhl
IGhvc3QgbG9hZGVycy5jYWNoZSBkb2VzIG5vdCBjb250YWluIGFic29sdXRlIHBhdGhzIGFueW1v
cmUuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBjb25zZXF1ZW5jZSBpcywgdGhhdCB0aGUgdGFyZ2V0
IGxvYWRlcnMuY2FjaGUgbm93IGNvbnRhaW5zIGVudHJpZXMgbGlrZSAibGliL2dkay1waXhidWYt
Mi4wLzIuMTAuMC9sb2FkZXJzL2xpYnBpeGJ1ZmxvYWRlci0qIi4gVGhlc2UgcGF0aHMgYXJlIGlu
Y29ycmVjdCwgYW5kIGFwcGxpY2F0aW9ucyB1c2luZyBnZGstcGl4YnVmIHdpbGwgY3Jhc2ggYmVj
YXVzZSB0aGV5IGFyZSBubyBsb25nZXIgYWJsZSB0byBsb2FkIGltYWdlcy4gQmVmb3JlIHRoZSBw
YXRjaCwgaXQgd291bGQgY29udGFpbiBhYnNvbHV0ZSBwYXRocyBsaWtlICIvdXNyL2xpYi9nZGst
cGl4YnVmLQ0KPiA+IDIuMC8yLjEwLjAvbG9hZGVycy9saWJwaXhidWZsb2FkZXItKiIuDQo+ID4g
PiA+DQo+ID4gPiA+IEknbSBub3Qgc3VyZSB3aGF0IHRoZSBiZXN0IGFwcHJvYWNoIHdvdWxkIGJl
IHRvIGZpeCB0aGlzIGlzc3VlLiBFaXRoZXIgYnkgbW9kaWZ5aW5nIHRoZSBTRUQgc3RhdGVtZW50
LCBvciBieSBtb2RpZnlpbmcgdGhlIHdheSB0aGUgdGFyZ2V0IGxvYWRlcnMuY2FjaGUgaXMgZ2Vu
ZXJhdGVkIChpLmUuIGJ5IG5vdCB1c2luZyB0aGUgaG9zdCBsb2FkZXJzLmNhY2hlIGFzIGEgYmFz
ZSkuDQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciBzcG90dGluZyB0aGlzIGlzc3VlLCBJIHRoaW5r
IHRoZSBiZXN0IGFwcHJvYWNoIGlzIHRvOg0KPiA+ID4gLSBzZXQgcmVsb2NhdGFibGUgdG8gdHJ1
ZSBmb3IgdGhlIHRhcmdldCAoc2VlDQo+ID4gPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwMjE5MTIyNTI2LjI5NTQzNTQtMS1mb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbSkNCj4gPiA+IC0gZHJvcCBHREtfUElYQlVGX1VQREFURV9DQUNI
RSAod2hpY2ggaGFzIG5vIGVmZmVjdCBhbnltb3JlKQ0KPiA+ID4NCj4gPiA+IENhbiB5b3UgY29u
ZmlybSB0aGF0IHRoaXMgYXBwcm9hY2ggaXMgd29ya2luZz8NCj4gPg0KPiA+IFVuZm9ydHVuYXRl
bHkgdGhpcyBpcyBub3Qgd29ya2luZy4gV2l0aG91dCB0aGUgR0RLX1BJWEJVRl9VUERBVEVfQ0FD
SEUsIHRoZSB0YXJnZXQgZW5kcyB1cCB3aXRoIG5vIGxvYWRlcnMuY2FjaGUgYXQgYWxsLg0KPiBJ
bmRlZWQsIGdvb2QgY2F0Y2gsIHRoZW4gd2UgY2FuIG9ubHkgZHJvcCB0aGUgU0VEIGNvbW1hbmQu
DQoNCj4gSG93ZXZlciwgY2FuIHlvdSBjb25maXJtIHRoYXQgc2V0dGluZyByZWxvY2F0YWJsZSB0
byB0cnVlIGRvZXNuJ3QgZml4IHRoZSBpc3N1ZT8NCj4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBp
ZiByZWxvY2F0YWJsZSBpcyB0cnVlLCBnZGstcGl4YnVmIHNob3VsZA0KPiBwcmVwZW5kIHRoZSB0
b3BsZXZlbCBkaXI6DQo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9nZGstcGl4YnVm
Ly0vYmxvYi9tYXN0ZXIvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmLWlvLmMjTDM1Mg0KDQpJdCB0ZXN0
ZWQgaXQsIGFuZCBpdCBkb2VzIG5vdCB3b3JrLg0KRnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoaXMg
dG9wbGV2ZWwgZGlyIGlzIG9uZSBkaXJlY3RvcnkgdXAgcmVsYXRpdmUgdG8gdGhlIHBhdGggb2Yg
dGhlIGV4ZWN1dGFibGUsDQpzbyBpZiB0aGUgZXhlY3V0YWJsZSBpcyAvZm9vL2Jhci9teV9leGVj
dXRhYmxlICwgdGhlIHRvcGxldmVsIGRpciB3aWxsIGJlIC9mb28gLg0KDQo+IElmIHRoaXMgZG9l
c24ndCB3b3JrIChiZWNhdXNlIHRoZSB0b3BsZXZlbCBkaXIgaXMgbm90IGNvcnJlY3QpLCB0aGVu
DQo+IHRoZSBiZXR0ZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHVwZGF0ZSB0aGUgU0VEIGNvbW1hbmQg
dG8gcHJlcGVuZCAvdXNyLw0KPiB0byBhbGwgbGliIHBhdGhzLg0KDQpJIGFncmVlLg0KDQpSdXRn
ZXINCg0KVGhpcyBlbWFpbCBjb21tdW5pY2F0aW9uIGlzIENPTkZJREVOVElBTC4gSWYgeW91IGFy
ZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgeW91IG1heSBub3QgdXNlLCBjb3B5IG9yIGRp
c2Nsb3NlIHRvIGFueW9uZSB0aGUgbWVzc2FnZSBvciBhbnkgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoZSBtZXNzYWdlIGFuZCBJIGFzayB0aGF0IHlvdSBwbGVhc2Ugbm90aWZ5IG1lIGJ5IHJl
dHVybiBlbWFpbCBhbmQgZGVsZXRlIHRoaXMgY29tbXVuaWNhdGlvbiBpbW1lZGlhdGVseS4gVGhh
bmsgeW91Lg0K
--MCBoundary=_12203171628423911
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>&gt; &gt; &gt; &gt; A recent patch for package gdk-=
pixbuf to enable the relocatable option for the host package has introduced=
 a problem for the target package.<BR>
&gt; &gt; &gt;<BR>
&gt; &gt; &gt; &gt; The loaders.cache for the target currently is generated=
 by copying the loaders.cache from the host package and editing it using a =
sed command to replace the host paths with target paths. The sed command is=
 no longer correct, since the host loaders.cache does not contain absolute =
paths anymore.<BR>
&gt; &gt; &gt; &gt;<BR>
&gt; &gt; &gt; &gt; The consequence is, that the target loaders.cache now c=
ontains entries like &quot;lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloade=
r-*&quot;. These paths are incorrect, and applications using gdk-pixbuf wil=
l crash because they are no longer able to load images. Before the patch, i=
t would contain absolute paths like &quot;/usr/lib/gdk-pixbuf-<BR>
&gt; &gt; 2.0/2.10.0/loaders/libpixbufloader-*&quot;.<BR>
&gt; &gt; &gt; &gt;<BR>
&gt; &gt; &gt; &gt; I'm not sure what the best approach would be to fix thi=
s issue. Either by modifying the SED statement, or by modifying the way the=
 target loaders.cache is generated (i.e. by not using the host loaders.cach=
e as a base).<BR>
&gt; &gt; &gt;<BR>
&gt; &gt; &gt; Thanks for spotting this issue, I think the best approach is=
 to:<BR>
&gt; &gt; &gt; - set relocatable to true for the target (see<BR>
&gt; &gt; &gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/pa=
tch/20220219122526.2954354-1-fontaine.fabrice@gmail.com)" target=3D"_blank"=
>https://patchwork.ozlabs.org/project/buildroot/patch/20220219122526.295435=
4-1-fontaine.fabrice@gmail.com)</a><BR>
&gt; &gt; &gt; - drop GDK_PIXBUF_UPDATE_CACHE (which has no effect anymore)=
<BR>
&gt; &gt; &gt;<BR>
&gt; &gt; &gt; Can you confirm that this approach is working?<BR>
&gt; &gt;<BR>
&gt; &gt; Unfortunately this is not working. Without the GDK_PIXBUF_UPDATE_=
CACHE, the target ends up with no loaders.cache at all.<BR>
&gt; Indeed, good catch, then we can only drop the SED command.<BR>
<BR>
&gt; However, can you confirm that setting relocatable to true doesn't fix =
the issue?<BR>
&gt; From my understanding, if relocatable is true, gdk-pixbuf should<BR>
&gt; prepend the toplevel dir:<BR>
&gt; <a href=3D"https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/blob/master/gdk=
-pixbuf/gdk-pixbuf-io.c#L352" target=3D"_blank">https://gitlab.gnome.org/GN=
OME/gdk-pixbuf/-/blob/master/gdk-pixbuf/gdk-pixbuf-io.c#L352</a><BR>
<BR>
It tested it, and it does not work.<BR>
From my understanding this toplevel dir is one directory up relative to the=
 path of the executable,<BR>
so if the executable is /foo/bar/my_executable , the toplevel dir will be /=
foo .<BR>
<BR>
&gt; If this doesn't work (because the toplevel dir is not correct), then<B=
R>
&gt; the better option would be to update the SED command to prepend /usr/<=
BR>
&gt; to all lib paths.<BR>
<BR>
I agree.<BR>
<BR>
Rutger<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203171628423911--


--===============2594600827981184135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2594600827981184135==--

