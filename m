Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EECDC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4DAA418CD;
	Thu, 17 Mar 2022 13:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rSdteE-LI_2; Thu, 17 Mar 2022 13:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23137418CA;
	Thu, 17 Mar 2022 13:20:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 087D81BF36B
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 13:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA67C847C2
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 13:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BjJMwitreh5N for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 13:19:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.111.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C72B847C0
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 13:19:58 +0000 (UTC)
Received: from CAN01-QB1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2052.outbound.protection.outlook.com [104.47.60.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-26-sym_uqbaNqyH3-4f7yaZ2A-1; Thu, 17 Mar 2022 14:19:54 +0100
X-MC-Unique: sym_uqbaNqyH3-4f7yaZ2A-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT1PR01MB3659.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 13:19:52 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 13:19:52 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Thread-Topic: package gdk-pixbuf relocatable issue
Thread-Index: Adg6Aa7khoE5VjkiR3O2bnMKm72NGA==
Date: Thu, 17 Mar 2022 13:19:52 +0000
Message-ID: <YQXPR01MB612157C72AF87C24A7890356AE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 368ecff8-38b8-4b13-b906-08da0818d209
x-ms-traffictypediagnostic: YT1PR01MB3659:EE_
x-microsoft-antispam-prvs: <YT1PR01MB3659F92456D424DA089DBBAEAE129@YT1PR01MB3659.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: bvLXA3adD1j331e1Gcg+HR6V3LFMxYuY/crgA5n9wO6dFn+TB/Tdcitv2UrXO6sVtOxIQbSKrB/5sW8OnFrkcRN59BKI4G1opNmtOr+WLBmQAmwXIa3qgPGZq8pzab6mDJGGwjHs+X56pqtjyueVyaNG9xLrLca2/ufkL4BnMtcNbPdVjd8WqW22b4VFlB4iULSAaBkh+TE5oaLjZshvVRlJ6CmTW37JsNTDFgBVJOnsfsCvYvLNDBzWStprqp2/R6/+dPJGlwkkJ4sHvTFUnpP9QXyyrGreN3P5maLxLGc7xN7YynEwzJ/HMCjY2WD5dUVyec7oOjEq01gmLy81diKl5l4592VOTfkI1KlM5kQgYh4USazJEGDmMW5c9m4zhtGtmJd6+lt1sqEVo1KHLb4o4LcDNvnN1mM4raMYuG6FuxflCVJ5mPUKZV0FJZOz0SoN2iFHiHw6oCU0QGxqFVCSYFG9h2cV/MSa1qw3HOMPBp3+El3FqZIxuZGH/h0ywvRYlysa25GexQQCugf8laQtl04GIYvlCizHCNHj2hIcZRLhEXakk8nbMr7mSwHdB5/H8vErWpnbEz/9IqeyrcO6joz7bA/pHtFdyiSUWyQy99I8ndDUXpr8HXtgy+hn8TgzlbCR9p5eeODMOgvCLujLUhd/g8JyJZdOFzD6T8F8SUNnrirVCotq2m3A10TIaDTKjfl84EVZZLmVQ+KI3G1yud3y7EoVWEMAXB4VGgBBTyXE/XMYn8IABDgkZAvmjGdYLW4uRF8+2SBj9IjBHnggI38PxICeqgPgc69b0Os=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(64756008)(4326008)(8676002)(66476007)(52536014)(5660300002)(66446008)(76116006)(66556008)(38100700002)(122000001)(66946007)(54906003)(6916009)(508600001)(316002)(38070700005)(3480700007)(55016003)(86362001)(2906002)(9686003)(71200400001)(8936002)(186003)(26005)(33656002)(7696005)(6506007)(83380400001);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVFBcVVOWlpjNWJlL3dDZk9hZXZqR0hmRW1mNEp1UU1tRmxGajZvcVF4Wis0?=
 =?utf-8?B?b3hwWnF2SjYwQWV5NHFVcUZCaFV3UCs3bTJQSlJMWkQxTWpnWTVmLzltSVUv?=
 =?utf-8?B?QStqWEVtbG0rV0haM1AxY3ZQRWVTQ1FqRkZxZVd5WGJUTGt3dVZOaHYzZkFo?=
 =?utf-8?B?cDc3UlJ5YUtDSEdkWE8vWGNjR21uaklmZ0FoQ05GRzkzY2JPZU4wSFQ3cG9u?=
 =?utf-8?B?a3h0a1Q0YUQ2dkd1VGhwSlFSdnZGNmxuZHJQd3hqcG5kUHFBdmFFSloxMWlN?=
 =?utf-8?B?c3orSytnekhkcW1XUFRBZ3N5MjdQL1lKVWpWeWhlYzZ4cExOK0FDVmZJN2lz?=
 =?utf-8?B?N2pnZ3E4ejZJamR0dVU1ZlVoZnQvbEJjU0NTRHFjbXVjWnpkRUxKeEY3NFcx?=
 =?utf-8?B?a0ZKSWdaMjJ0eEk3WVUxOHZNYlBlSG80a2lVUzh6cHA2V3U1cFdOWGFMb2k0?=
 =?utf-8?B?K1dxdEhSR2lzWHZPa3hLMWl3UkZ1YTJZVU93b0phZHRHNzJ6UVJLUUdKeGI2?=
 =?utf-8?B?TTJzN2JrSVJkVStDeStLVjJhNStkRlNraktQZEZZeGp2ZmZGejU4aUg0ZHlo?=
 =?utf-8?B?NFdKaHA0NXc3WUZkYWdaUmRnZTZtK1J1T3NiNy9FNzNLT05QRDk5Rzc1d3dL?=
 =?utf-8?B?QWIyR0pPam1NQm1IR3JLOVE2VitxRCtnTjNuc0xuL3pxOUhZUzJwSHF5Q2xE?=
 =?utf-8?B?TlJyKzIrYTRaRmZ1ZUk1eHB5dkJCVnlLQm1oRkVnV2JENFg1U1Z4OWJtTTQz?=
 =?utf-8?B?dEtWTUczV0hwOWgvbTJ6K3Y4OWJSQWY5NnJtTGdyRENHMHpyY3JEc3RBQTlE?=
 =?utf-8?B?ekNaUE50eHB4VEdhdCs4Y2YySitSR3JlQ1BiY0Q3eWYzbUpQQWpNSm90YnY0?=
 =?utf-8?B?a3JBZ284bVRGVWFudkp6djYxdGtxN0RhQnFoVVpHNlF5UFJWS0MzVzZUeWxP?=
 =?utf-8?B?V290VzlNNENVeVJBODVObkpNZUR4a1A5bWpjdmdmVjlob1h0Nk5aOGxDRGs1?=
 =?utf-8?B?NkZhM3FKVGpGTmN5Szhycm5ZYm0wVi9TVXVIcjdpME1jVi9BdkpWOWd6VTd1?=
 =?utf-8?B?cHdDaW4rZUcvdFExRFhFWmtOMzQwRUtBbjRVOGdiZlM1Q2RFRmc3WVBuYURR?=
 =?utf-8?B?VGUvVUsxYnNXajJUMHh3b0VFMUVKaWUzTWI4a2FoZG03OFJucEdHV0RVcG5z?=
 =?utf-8?B?c2Zsc0dXZDd1RFcxbXpVN2JucW5rOENyM0VvWmFtcDhpbWV1R0NMKzAzYjZE?=
 =?utf-8?B?Wkt3VFZmYVV4eDREQk9zazdETkNPZFRNVEtySU8vU1NKdWQ5ZUVZM05vdkNv?=
 =?utf-8?B?Nndsb3BLSDMyVW5SS3VHVnZpVmFxamVnQVhTV0p3dk1Fa20reUFiUitzelJC?=
 =?utf-8?B?YzI3eUFoRzJqaUJncGY2TllHNTJWNzZ5dG1FM09yM2wwdDR5WTMzWHJ1bzdm?=
 =?utf-8?B?TUwrdThZWGcwQkRRMDdmNHZVUmZhMHdFcDJmWWhjSlJjeS82WG9oU21mOXlv?=
 =?utf-8?B?NUZFVkRLUFQrL2tPODE2Y3ZITjhXdzdlRXZXNXZmUUI1RFJIYno5RTZCWUwr?=
 =?utf-8?B?MFZSQlpHMEp1eHc5dVZ5L1NQMnNFSjAveDY2aURiSVdzSEZsYlNqNkNmYkZK?=
 =?utf-8?B?dTBmd085WEVFWTl1NEhkYzRuVmVBWU9EWnlqNmF2WkNkYU4xT2MzRGwyRThE?=
 =?utf-8?B?aG1xOEJrYmtSMjFmVDZtZ21tYXBTYnJqd3ZFeVZIc1J3Y2twenNrK3UxK0pK?=
 =?utf-8?B?MU5SSFNobXg2bW9aOTRjS1ZqVnQyL3hEVWpZaGo0K0lWT2RiczFSRE40YnQ0?=
 =?utf-8?B?RDYzVlhER244UEwrWTJ1bVVUanMycGp6dVlRYlV2YnFtTnliayt1QlJiT1JK?=
 =?utf-8?B?ZWVZaXY3NkN4aGpZdUNuZ3VNbXRyWlJ0NSt1eGpqSnpMSVpNYVduSzVQUE5y?=
 =?utf-8?B?c1B0cWR5SkVtUEUvc0hVMDcyZ0g2dVhIcUZpbCs0V051SWVCb214RkNMREI0?=
 =?utf-8?B?Ykg3VjFBSU1nPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 368ecff8-38b8-4b13-b906-08da0818d209
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 13:19:52.1967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5l0Yf/jwds3cFwZfRAMKP3a1Af7c/DqUjZ4/Lqrx95Ges4L8wvqD2mBfy8kyiseS7aEJkaNcrW8paiFzqNNM7thVUfd1K/NtC5X7vE2JVm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB3659
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
Content-Type: multipart/mixed; boundary="===============0989738667114171476=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0989738667114171476==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203171419556411"

--MCBoundary=_12203171419556411
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8gRmFicmljZSwNCg0KPiA+IEEgcmVjZW50IHBhdGNoIGZvciBwYWNrYWdlIGdkay1waXhi
dWYgdG8gZW5hYmxlIHRoZSByZWxvY2F0YWJsZSBvcHRpb24gZm9yIHRoZSBob3N0IHBhY2thZ2Ug
aGFzIGludHJvZHVjZWQgYSBwcm9ibGVtIGZvciB0aGUgdGFyZ2V0IHBhY2thZ2UuDQo+DQo+ID4g
VGhlIGxvYWRlcnMuY2FjaGUgZm9yIHRoZSB0YXJnZXQgY3VycmVudGx5IGlzIGdlbmVyYXRlZCBi
eSBjb3B5aW5nIHRoZSBsb2FkZXJzLmNhY2hlIGZyb20gdGhlIGhvc3QgcGFja2FnZSBhbmQgZWRp
dGluZyBpdCB1c2luZyBhIHNlZCBjb21tYW5kIHRvIHJlcGxhY2UgdGhlIGhvc3QgcGF0aHMgd2l0
aCB0YXJnZXQgcGF0aHMuIFRoZSBzZWQgY29tbWFuZCBpcyBubyBsb25nZXIgY29ycmVjdCwgc2lu
Y2UgdGhlIGhvc3QgbG9hZGVycy5jYWNoZSBkb2VzIG5vdCBjb250YWluIGFic29sdXRlIHBhdGhz
IGFueW1vcmUuDQo+ID4NCj4gPiBUaGUgY29uc2VxdWVuY2UgaXMsIHRoYXQgdGhlIHRhcmdldCBs
b2FkZXJzLmNhY2hlIG5vdyBjb250YWlucyBlbnRyaWVzIGxpa2UgImxpYi9nZGstcGl4YnVmLTIu
MC8yLjEwLjAvbG9hZGVycy9saWJwaXhidWZsb2FkZXItKiIuIFRoZXNlIHBhdGhzIGFyZSBpbmNv
cnJlY3QsIGFuZCBhcHBsaWNhdGlvbnMgdXNpbmcgZ2RrLXBpeGJ1ZiB3aWxsIGNyYXNoIGJlY2F1
c2UgdGhleSBhcmUgbm8gbG9uZ2VyIGFibGUgdG8gbG9hZCBpbWFnZXMuIEJlZm9yZSB0aGUgcGF0
Y2gsIGl0IHdvdWxkIGNvbnRhaW4gYWJzb2x1dGUgcGF0aHMgbGlrZSAiL3Vzci9saWIvZ2RrLXBp
eGJ1Zi0+IDIuMC8yLjEwLjAvbG9hZGVycy9saWJwaXhidWZsb2FkZXItKiIuDQo+ID4NCj4gPiBJ
J20gbm90IHN1cmUgd2hhdCB0aGUgYmVzdCBhcHByb2FjaCB3b3VsZCBiZSB0byBmaXggdGhpcyBp
c3N1ZS4gRWl0aGVyIGJ5IG1vZGlmeWluZyB0aGUgU0VEIHN0YXRlbWVudCwgb3IgYnkgbW9kaWZ5
aW5nIHRoZSB3YXkgdGhlIHRhcmdldCBsb2FkZXJzLmNhY2hlIGlzIGdlbmVyYXRlZCAoaS5lLiBi
eSBub3QgdXNpbmcgdGhlIGhvc3QgbG9hZGVycy5jYWNoZSBhcyBhIGJhc2UpLg0KPg0KPiBUaGFu
a3MgZm9yIHNwb3R0aW5nIHRoaXMgaXNzdWUsIEkgdGhpbmsgdGhlIGJlc3QgYXBwcm9hY2ggaXMg
dG86DQo+IC0gc2V0IHJlbG9jYXRhYmxlIHRvIHRydWUgZm9yIHRoZSB0YXJnZXQgKHNlZQ0KPiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIw
MjE5MTIyNTI2LjI5NTQzNTQtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbSkNCj4gLSBkcm9w
IEdES19QSVhCVUZfVVBEQVRFX0NBQ0hFICh3aGljaCBoYXMgbm8gZWZmZWN0IGFueW1vcmUpDQo+
DQo+IENhbiB5b3UgY29uZmlybSB0aGF0IHRoaXMgYXBwcm9hY2ggaXMgd29ya2luZz8NCg0KVW5m
b3J0dW5hdGVseSB0aGlzIGlzIG5vdCB3b3JraW5nLiBXaXRob3V0IHRoZSBHREtfUElYQlVGX1VQ
REFURV9DQUNIRSwgdGhlIHRhcmdldCBlbmRzIHVwIHdpdGggbm8gbG9hZGVycy5jYWNoZSBhdCBh
bGwuDQpJdOKAmXMgYWxzbyBub3QgcG9zc2libGUgdG8gcnVuIGdkay1waXhidWYtcXVlcnktbG9h
ZGVycyBpbiB0aGUgdGFyZ2V0IGRpcmVjdG9yeSBiZWNhdXNlIHRoZSBhcmNoaXRlY3R1cmUgbWln
aHQgZGlmZmVyIGZyb20gdGhlIGhvc3QuDQoNCkJlc3QgcmVnYXJkcywNCg0KUnV0Z2VyDQoNClRo
aXMgZW1haWwgY29tbXVuaWNhdGlvbiBpcyBDT05GSURFTlRJQUwuIElmIHlvdSBhcmUgbm90IHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBtYXkgbm90IHVzZSwgY29weSBvciBkaXNjbG9zZSB0
byBhbnlvbmUgdGhlIG1lc3NhZ2Ugb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGUg
bWVzc2FnZSBhbmQgSSBhc2sgdGhhdCB5b3UgcGxlYXNlIG5vdGlmeSBtZSBieSByZXR1cm4gZW1h
aWwgYW5kIGRlbGV0ZSB0aGlzIGNvbW11bmljYXRpb24gaW1tZWRpYXRlbHkuIFRoYW5rIHlvdS4N
Cg==
--MCBoundary=_12203171419556411
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>Hello Fabrice,<BR>
<BR>
&gt; &gt; A recent patch for package gdk-pixbuf to enable the relocatable o=
ption for the host package has introduced a problem for the target package.=
<BR>
&gt;<BR>
&gt; &gt; The loaders.cache for the target currently is generated by copyin=
g the loaders.cache from the host package and editing it using a sed comman=
d to replace the host paths with target paths. The sed command is no longer=
 correct, since the host loaders.cache does not contain absolute paths anym=
ore.<BR>
&gt; &gt;<BR>
&gt; &gt; The consequence is, that the target loaders.cache now contains en=
tries like &quot;lib/gdk-pixbuf-2.0/2.10.0/loaders/libpixbufloader-*&quot;.=
 These paths are incorrect, and applications using gdk-pixbuf will crash be=
cause they are no longer able to load images. Before the patch, it would co=
ntain absolute paths like &quot;/usr/lib/gdk-pixbuf-&gt; 2.0/2.10.0/loaders=
/libpixbufloader-*&quot;.<BR>
&gt; &gt;<BR>
&gt; &gt; I'm not sure what the best approach would be to fix this issue. E=
ither by modifying the SED statement, or by modifying the way the target lo=
aders.cache is generated (i.e. by not using the host loaders.cache as a bas=
e).<BR>
&gt;<BR>
&gt; Thanks for spotting this issue, I think the best approach is to:<BR>
&gt; - set relocatable to true for the target (see<BR>
&gt; <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/202202=
19122526.2954354-1-fontaine.fabrice@gmail.com)" target=3D"_blank">https://p=
atchwork.ozlabs.org/project/buildroot/patch/20220219122526.2954354-1-fontai=
ne.fabrice@gmail.com)</a><BR>
&gt; - drop GDK_PIXBUF_UPDATE_CACHE (which has no effect anymore)<BR>
&gt;<BR>
&gt; Can you confirm that this approach is working?<BR>
<BR>
Unfortunately this is not working. Without the GDK_PIXBUF_UPDATE_CACHE, the=
 target ends up with no loaders.cache at all.<BR>
It=E2=80=99s also not possible to run gdk-pixbuf-query-loaders in the targe=
t directory because the architecture might differ from the host.<BR>
<BR>
Best regards,<BR>
<BR>
Rutger<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203171419556411--


--===============0989738667114171476==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0989738667114171476==--

