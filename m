Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F19DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 11:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA86418B0;
	Thu, 17 Mar 2022 11:06:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4rFI_YLfB5n; Thu, 17 Mar 2022 11:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CE7141861;
	Thu, 17 Mar 2022 11:06:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA3D01BF356
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 11:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C582D40122
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 11:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tluyoeUPE6Xn for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 11:06:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from de-smtp-delivery-105.mimecast.com
 (de-smtp-delivery-105.mimecast.com [194.104.111.105])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2819A4000B
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 11:06:27 +0000 (UTC)
Received: from CAN01-TO1-obe.outbound.protection.outlook.com
 (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-N8zLCv32PiCB41vK-lapWQ-1; Thu, 17 Mar 2022 12:06:24 +0100
X-MC-Unique: N8zLCv32PiCB41vK-lapWQ-1
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:3e::9)
 by YT1PR01MB9243.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Thu, 17 Mar
 2022 11:06:22 +0000
Received: from YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b]) by YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::61b2:ac5:d9cc:578b%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 11:06:22 +0000
From: "Sassen, Rutger" <rsassen@comecer.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH v3 1/1] package/rpi-firmware: fix missing files in
 overlays
Thread-Index: Adg57IpbJyf/ee8rToaft+SJaOOmcg==
Date: Thu, 17 Mar 2022 11:06:22 +0000
Message-ID: <YQXPR01MB61216162093E0D5F17304D0BAE129@YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95f5f881-1522-421b-f2d8-08da08062ba3
x-ms-traffictypediagnostic: YT1PR01MB9243:EE_
x-microsoft-antispam-prvs: <YT1PR01MB9243645CF6D94375F85F3C28AE129@YT1PR01MB9243.CANPRD01.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: mrrpnK01QTnai1VsXNcOyEppzJjnEaP8zGNSEs5xcGKDzOLgoTRFQlSqNVpZuyPKgEqZbEUQD0KbTbzKKXxm7yXzj4UVmjXQSPwUD43SBGxRNWT/tpTWkDltYkNTxbchwCnSh8rEXZPm3a3cQ+yS8hXQO8HqEcCC+ySa/kpsulglu0ZsPmB/x5syG2X0+GOH0N2RtmgQeZ25Yiy/NLWuhhEssJQEKHQuoooPTfMsuNa75vG48MAH1rxgAae96cfSZm0uMRGDRTojb6bRhNb17HqophMGhZTWVav6KzVf5ZUBYLFTtcd/7+MFg9BLR+VHWx8EaziZ+rifnFNR0qAIGTiKcSCoSzkvb2vHCkNH2+arbuYt23Gel2rvIKxju0z8TH8L87cQ2Bh3aNZVtC7uqs5cidKVv4BjECfWRLD0lSATYeLHmnU3TsRvWjnqQ00AfXXEYIs6HK+DhmK6r2qcHwhhJqT759t6iZnuElZRLV/u6IE4H5y5JTe9dp5JqVOc2IIMNKnUko7glKm4I3YkwEO1o5XtikkutuO8tfLK6gvEAgltb5SdkaDaphv/fothx/Ftd0RgeA/MwGLAVFzpspHgwdA43OPRUTF+VDizXfv26BJA8OtiDbWys/jG+ufKmnDAw8JCf2M2f7ebYB0axvkuhnuuduVTaYqDktyCdfyILHknwjtkEuremd6AB47BpuewWCCyqXUX+dO7VyS9Bg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(33656002)(7696005)(6506007)(508600001)(2906002)(71200400001)(86362001)(316002)(4326008)(8676002)(186003)(26005)(64756008)(66446008)(66476007)(66556008)(66946007)(122000001)(76116006)(38100700002)(9686003)(8936002)(52536014)(5660300002)(38070700005)(55016003)(6916009)(54906003);
 DIR:OUT; SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TitoN0pZODRKWHMrcm5XTmQvWXBYd1dMZVBqTU5RWmN6U2grNTkzK254STZq?=
 =?utf-8?B?RFowNitrYVEvenI3QzlnWkpLaDBtVGJqSG9Nb240eUN5YThnUXljUHphcUFW?=
 =?utf-8?B?aG9kTkJ5UTJkRk56aWpGQzQyclZuZ0llUjdhc0l0b0hnQUVhMktRU0RSN3JI?=
 =?utf-8?B?N2hOcGJlbUg4RHUrRTE5RXI4UWtrM1hOZnVqM1c1T2w4ZHVyaDhNQmdoVkdJ?=
 =?utf-8?B?YUZMR21Wei9admtyckx6SUdsQWwzdThqN1ZPSEg2bVF1aTAvcmFwSHBpSTAv?=
 =?utf-8?B?aEUxQlU3aGhxZUpiQTZGMDhyYlhVcmliV3pLNTkxQWlBVGoyVFRBOEdjQnM1?=
 =?utf-8?B?S3d1T3JCcVB0ekdoMjJnaFplNDcrK3VXNUZINUJLakJIeFJEUmw5UmpOeFFp?=
 =?utf-8?B?TkhFVXJkSktkZ0puVm90MHB5V3ZpQ0RSMm1XYjVNS211NFRvQ1ZmZFlPbERR?=
 =?utf-8?B?MkQ4M1UyNHpZcnRDM3JMS0xKaUNROEl5bzNMazlsRHNqOXBsM0hNY29DOC81?=
 =?utf-8?B?ZGp2VzdlcjI5Y2cwM1QrUVlJYlJjM3FkSnhyRmQyaVVacWk1Um1Tbmd2dGlB?=
 =?utf-8?B?R2wrcnIwQndKN2hyTFlNZUNvaGxCTHlYeHZwdWFVM1dQY0hNVWJWSDY0anBM?=
 =?utf-8?B?Y3c5MTR0WmpsMFc0dHo2UmJLYnYzZlpDdHpKS1dVWFNnVzhVQkdRWkVta3pE?=
 =?utf-8?B?UmdjWU51TFBZaHlVcWgxNG9ad096N0p4cFRZU01xZncrOCtBUjdnVXlXQldB?=
 =?utf-8?B?QTFhbi9FcXBOWTZIQWtwZWptTE9Da1M1c1RhS2J6WmxWL1RIRXZCdmxkTUda?=
 =?utf-8?B?Y2F3ZkI5c0p3Lzg3VUF6dFFVQTBTYmhXN1JsUnpGamNxWC9RZXozalUwSFlh?=
 =?utf-8?B?ckVhZlVYU1dIMDNEdWRzRzlYZmduU3JTUWprWEYwMXgwQ1lyaUxpUTFyZGVJ?=
 =?utf-8?B?clFaR0wzNzNQRWxVKzNyRVhSY01aU08rSVY5QXg4b0xjcnpjR3hQS2dNMUZZ?=
 =?utf-8?B?eVQ2OCs5NzFNK25uclEyemRhZVJka0h5blBZZi8rbDM5RzBvL0tKNDJFd0FN?=
 =?utf-8?B?WDJoZ0orSW02NnZ0VktUZTdyemQzMCt3c2NiZTFpaTZIQWZncHlwL3hjd0g2?=
 =?utf-8?B?aVExQXRkc0p3R0dDa213OVc4dTEzTGRVYWdodG1ubTJSR2JONjE1MEQ5RFZv?=
 =?utf-8?B?Njl5czJwSll1elMrblpYMmlNV1VVWWxvam5wanlLSHhoSzBKK2prMEx5QVNy?=
 =?utf-8?B?MWljRVVLWGFFVzV1RnJkd1JqUHMyRVZlWHZLNFpFOHpWcWZEdkdIWXZWK3hY?=
 =?utf-8?B?bWxyajBTSDdOM3JDaUozWUNQUlVtTmZROGwrNDVtSEpObUVNYmFPVnkwRUVG?=
 =?utf-8?B?cDVvdUZTckxzRUVWekhsM0ViV21KYlMyV1p5Mkgxd2hlaFNzZUdwR2E2V0Ru?=
 =?utf-8?B?WjgyZ2pLVW1PZktJWlVCYVNVU2pqencvV293Z2diL0FodHNRNHNzanlLQWpl?=
 =?utf-8?B?dHpqUXJTbGxaWjdMQ0tubVJ5QkZzQnVmSHdkMEFCbzBrcEE0VXB3bUlDN0hj?=
 =?utf-8?B?TzlTeGtmQkdEcktGNWRGaW44WEtHS0wyTUEzTDRzVWhHYUw0WFhlYWNkK0ZP?=
 =?utf-8?B?QnJwNFhNaWlmYjI5VVhkZXJZWjNwM3d6WVBGVytkZVJ5aWxSb25pU0pEaUk1?=
 =?utf-8?B?V2dsS3MwWXR1Y09XRWVQdWlMblZDZWUzZFRDWDdvWjhxL2t1SXhPaWhtVXo0?=
 =?utf-8?B?Q1dGUitHMFN6ckFVQnZXa2k3TDZaTmRWWHFrMzNuQ2ZHc3RlZHFiKzRiUHpI?=
 =?utf-8?B?TUM0TVFyVXdIYjNTSTF5NDRnMktjbWRMRG1tUWplRmtrZ0ZJYmtydmF4RXdm?=
 =?utf-8?B?Ymh3MEV1NVFYZzZtbE01eFFCMUZkb1VyS3FvcGx4emxtb3NvZS9BSnRlOVVt?=
 =?utf-8?B?ZUZncjU5Z21vUW1HL05QaHNzbzg5alFLaGpkN1NnTjh3OUZjTHBrcUNPUlBp?=
 =?utf-8?B?bms1N0xZK1pnPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: comecer.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB6121.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f5f881-1522-421b-f2d8-08da08062ba3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 11:06:22.0868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f5b2e964-6123-4a27-9a8c-8c1dfbf93791
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S76nHt4Lj3IjaRyhnCw9NTivbyxKsiGpiZqshD8NjE9RS1bvgVYookQdTXekezl3hE4B95OjfHkv6ZdIVFJo4tQfMsOISSVA5YaS433PVTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT1PR01MB9243
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: comecer.com
Subject: [Buildroot] [PATCH v3 1/1] package/rpi-firmware: fix missing files
 in overlays
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
Content-Type: multipart/mixed; boundary="===============2330316788367079055=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2330316788367079055==
Content-Type: multipart/alternative;
	boundary="MCBoundary=_12203171206251331"

--MCBoundary=_12203171206251331
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

V2hlbiBzdXBwb3J0aW5nIG11bHRpcGxlIGhhcmR3YXJlIHRhcmdldHMsIG92ZXJsYXlfbWFwLmR0
YiBtaWdodA0KYmUgbmVlZGVkIHRvIG1hcCBvdmVybGF5IG5hbWVzIHRvIG9uZSBvZiBzZXZlcmFs
IGltcGxlbWVudGF0aW9ucy4NCg0KU2lnbmVkLW9mZi1ieTogUnV0Z2VyIFNhc3NlbiA8cnNhc3Nl
bkBjb21lY2VyLmNvbT4NCi0tLQ0KQ2hhbmdlcyB2MiAtPiB2MzoNCiAtIGluIENvbmZpZy5pbiB1
c2UgaWYgc3RhdGVtZW50IGluc3RlYWQgb2YgZGVwZW5kcyAoc3VnZ2VzdGVkIGJ5IFBldGVyDQog
ICBTZWlkZXJlcikNCiAtIG1lbnRpb24gdGhlIGZpbGVuYW1lIG92ZXJsYXlfbWFwLmR0YiBpbiB0
aGUgaGVscCB0ZXh0IChzdWdnZXN0ZWQgYnkNCiAgIFBldGVyIFNlaWRlcmVyKQ0KIA0KQ2hhbmdl
cyB2MSAtPiB2MjoNCiAgLSBpbnN0ZWFkIG9mIGFsd2F5cyBjb3B5aW5nIG92ZXJsYXlfbWFwLmR0
YiwgbWFrZSBpdCBjb25maWd1cmFibGUNCiAgICAoc3VnZ2VzdGVkIGJ5IFBldGVyIFNlaWRlcmVy
KQ0KICAtIGRvIG5vdCBjb3B5IFJFQURNRSBzaW5jZSBpdCBhIHNwZWNpYWwgY2FzZSwgb25seSBu
ZWVkZWQgd2hlbg0KICAgIGluc3RhbGxpbmcgb3ZlcmxheXMgdG8gYSBub24tc3RhbmRhcmQgbG9j
YXRpb24gKHN1Z2dlc3RlZCBieSBQZXRlcg0KICAgIFNlaWRlcmVyKQ0KDQpXaGVuIHN1cHBvcnRp
bmcgbXVsdGlwbGUgaGFyZHdhcmUgdGFyZ2V0cywgb3ZlcmxheV9tYXAuZHRiIG1pZ2h0DQpiZSBu
ZWVkZWQgdG8gbWFwIG92ZXJsYXkgbmFtZXMgdG8gb25lIG9mIHNldmVyYWwgaW1wbGVtZW50YXRp
b25zLg0KDQpTaWduZWQtb2ZmLWJ5OiBSdXRnZXIgU2Fzc2VuIDxyc2Fzc2VuQGNvbWVjZXIuY29t
Pg0KLS0tDQogcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluICAgICAgIHwgMTIgKysrKysr
KysrKysrDQogcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rIHwgIDcgKysrKysr
Kw0KIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluIGIvcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmln
LmluDQppbmRleCA4MDcwZGMzMDE5Li4zNjA1NDM1M2Y4IDEwMDY0NA0KLS0tIGEvcGFja2FnZS9y
cGktZmlybXdhcmUvQ29uZmlnLmluDQorKysgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9Db25maWcu
aW4NCkBAIC05Myw2ICs5MywxOCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lO
U1RBTExfRFRCX09WRVJMQVlTDQogCSAgb3ZlcmxheXMsIHRvIHN1cHBvcnQgSEFUcyAoSGFyZHdh
cmUgQXR0YWNoZWQgb24gVG9wLCBhZGQtb24NCiAJICBtb2R1bGVzKS4NCiANCitpZiBCUjJfUEFD
S0FHRV9SUElfRklSTVdBUkVfSU5TVEFMTF9EVEJfT1ZFUkxBWVMNCisNCitjb25maWcgQlIyX1BB
Q0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCX09WRVJMQVlfTUFQDQorCWJvb2wgIkluc3Rh
bGwgRFRCIG92ZXJsYXkgbWFwIg0KKwlkZWZhdWx0IG4NCisJaGVscA0KKwkgIFNheSAneScgaGVy
ZSBpZiB5b3UgbmVlZCB0byBzdXBwb3J0IG11bHRpcGxlIGhhcmR3YXJlIHRhcmdldHMNCisJICBh
bmQgeW91IG5lZWQgb3ZlcmxheV9tYXAuZHRiIGZvciB0YXJnZXQgZGVwZW5kZW50IG1hcHBpbmcg
b2YNCisJICBvdmVybGF5IG5hbWVzIHRvIG9uZSBvZiBzZXZlcmFsIG92ZXJsYXkgaW1wbGVtZW50
YXRpb25zLg0KKw0KK2VuZGlmICMgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRC
X09WRVJMQVlTDQorDQogY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9JTlNUQUxMX1ZD
REJHDQogCWJvb2wgInZjZGJnIg0KIAlkZXBlbmRzIG9uIEJSMl9hcm0gIyBwcmVidWlsdCBhcm0g
YmluYXJ5LCBycGktdXNlcmxhbmQNCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9y
cGktZmlybXdhcmUubWsgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsNCmlu
ZGV4IGI0NmE3ZjUyNzAuLjgwMGI1NjAwNzAgMTAwNjQ0DQotLS0gYS9wYWNrYWdlL3JwaS1maXJt
d2FyZS9ycGktZmlybXdhcmUubWsNCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJt
d2FyZS5taw0KQEAgLTU3LDYgKzU3LDEyIEBAIGRlZmluZSBSUElfRklSTVdBUkVfSU5TVEFMTF9E
VEJfT1ZFUkxBWVMNCiBlbmRlZg0KIGVuZGlmDQogDQoraWZlcSAoJChCUjJfUEFDS0FHRV9SUElf
RklSTVdBUkVfSU5TVEFMTF9EVEJfT1ZFUkxBWV9NQVApLHkpDQorZGVmaW5lIFJQSV9GSVJNV0FS
RV9JTlNUQUxMX0RUQl9PVkVSTEFZX01BUA0KKwkkKElOU1RBTEwpIC1EIC1tIDA2NDQgJChARCkv
Ym9vdC9vdmVybGF5cy9vdmVybGF5X21hcC5kdGIgJChCSU5BUklFU19ESVIpL3JwaS1maXJtd2Fy
ZS9vdmVybGF5cy8NCitlbmRlZg0KK2VuZGlmDQorDQogIyBJbnN0YWxsIHByZWJ1aWx0IGxpYnJh
cmllcyBpZiBSUElfVVNFUkxBTkQgbm90IGVuYWJsZWQNCiBpZm5lcSAoJChCUjJfUEFDS0FHRV9S
UElfVVNFUkxBTkQpLHkpDQogZGVmaW5lIFJQSV9GSVJNV0FSRV9JTlNUQUxMX1RBUkdFVF9MSUIN
CkBAIC04Myw2ICs4OSw3IEBAIGRlZmluZSBSUElfRklSTVdBUkVfSU5TVEFMTF9JTUFHRVNfQ01E
Uw0KIAkkKFJQSV9GSVJNV0FSRV9JTlNUQUxMX0NPTkZJRykNCiAJJChSUElfRklSTVdBUkVfSU5T
VEFMTF9EVEIpDQogCSQoUlBJX0ZJUk1XQVJFX0lOU1RBTExfRFRCX09WRVJMQVlTKQ0KKwkkKFJQ
SV9GSVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZX01BUCkNCiBlbmRlZg0KIA0KICQoZXZhbCAk
KGdlbmVyaWMtcGFja2FnZSkpDQotLSANCjIuMjAuMQ0KDQpUaGlzIGVtYWlsIGNvbW11bmljYXRp
b24gaXMgQ09ORklERU5USUFMLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50
LCB5b3UgbWF5IG5vdCB1c2UsIGNvcHkgb3IgZGlzY2xvc2UgdG8gYW55b25lIHRoZSBtZXNzYWdl
IG9yIGFueSBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhlIG1lc3NhZ2UgYW5kIEkgYXNrIHRo
YXQgeW91IHBsZWFzZSBub3RpZnkgbWUgYnkgcmV0dXJuIGVtYWlsIGFuZCBkZWxldGUgdGhpcyBj
b21tdW5pY2F0aW9uIGltbWVkaWF0ZWx5LiBUaGFuayB5b3UuDQo=
--MCBoundary=_12203171206251331
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><style type=3D"text/css">.style1 {font-family: "Times New Roman=
";}</style></head><body>When supporting multiple hardware targets, overlay_=
map.dtb might<BR>
be needed to map overlay names to one of several implementations.<BR>
<BR>
Signed-off-by: Rutger Sassen &lt;rsassen@comecer.com&gt;<BR>
---<BR>
Changes v2 -&gt; v3:<BR>
 - in Config.in use if statement instead of depends (suggested by Peter<BR>
   Seiderer)<BR>
 - mention the filename overlay_map.dtb in the help text (suggested by<BR>
   Peter Seiderer)<BR>
 <BR>
Changes v1 -&gt; v2:<BR>
  - instead of always copying overlay_map.dtb, make it configurable<BR>
    (suggested by Peter Seiderer)<BR>
  - do not copy README since it a special case, only needed when<BR>
    installing overlays to a non-standard location (suggested by Peter<BR>
    Seiderer)<BR>
<BR>
When supporting multiple hardware targets, overlay_map.dtb might<BR>
be needed to map overlay names to one of several implementations.<BR>
<BR>
Signed-off-by: Rutger Sassen &lt;rsassen@comecer.com&gt;<BR>
---<BR>
 package/rpi-firmware/Config.in       | 12 ++++++++++++<BR>
 package/rpi-firmware/rpi-firmware.mk |  7 +++++++<BR>
 2 files changed, 19 insertions(+)<BR>
<BR>
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.i=
n<BR>
index 8070dc3019..36054353f8 100644<BR>
--- a/package/rpi-firmware/Config.in<BR>
+++ b/package/rpi-firmware/Config.in<BR>
@@ -93,6 +93,18 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
 =09  overlays, to support HATs (Hardware Attached on Top, add-on<BR>
 =09  modules).<BR>
 <BR>
+if BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
+<BR>
+config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
+=09bool &quot;Install DTB overlay map&quot;<BR>
+=09default n<BR>
+=09help<BR>
+=09  Say 'y' here if you need to support multiple hardware targets<BR>
+=09  and you need overlay_map.dtb for target dependent mapping of<BR>
+=09  overlay names to one of several overlay implementations.<BR>
+<BR>
+endif # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
+<BR>
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG<BR>
 =09bool &quot;vcdbg&quot;<BR>
 =09depends on BR2_arm # prebuilt arm binary, rpi-userland<BR>
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rp=
i-firmware.mk<BR>
index b46a7f5270..800b560070 100644<BR>
--- a/package/rpi-firmware/rpi-firmware.mk<BR>
+++ b/package/rpi-firmware/rpi-firmware.mk<BR>
@@ -57,6 +57,12 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS<BR>
 endef<BR>
 endif<BR>
 <BR>
+ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP),y)<BR>
+define RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP<BR>
+=09$(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DI=
R)/rpi-firmware/overlays/<BR>
+endef<BR>
+endif<BR>
+<BR>
 # Install prebuilt libraries if RPI_USERLAND not enabled<BR>
 ifneq ($(BR2_PACKAGE_RPI_USERLAND),y)<BR>
 define RPI_FIRMWARE_INSTALL_TARGET_LIB<BR>
@@ -83,6 +89,7 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS<BR>
 =09$(RPI_FIRMWARE_INSTALL_CONFIG)<BR>
 =09$(RPI_FIRMWARE_INSTALL_DTB)<BR>
 =09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)<BR>
+=09$(RPI_FIRMWARE_INSTALL_DTB_OVERLAY_MAP)<BR>
 endef<BR>
 <BR>
 $(eval $(generic-package))<BR>
-- <BR>
2.20.1<BR>

<br><br><p style=3D"font-family: Verdana; font-size:10pt; color:#666666;"><=
b>Disclaimer</b></p><p style=3D"font-family: Verdana; font-size:8pt; color:=
#666666;">This email communication is CONFIDENTIAL. If you are not the inte=
nded recipient, you may not use, copy or disclose to anyone the message or =
any information contained in the message and I ask that you please notify m=
e by return email and delete this communication immediately. Thank you.</p>=
</body></html>

--MCBoundary=_12203171206251331--


--===============2330316788367079055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2330316788367079055==--

