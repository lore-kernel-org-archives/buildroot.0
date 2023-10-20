Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EE1C001DF
	for <buildroot@archiver.kernel.org>; Fri, 20 Oct 2023 15:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE7370507;
	Fri, 20 Oct 2023 15:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE7370507
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I543H6AHV2QX; Fri, 20 Oct 2023 15:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 932F170490;
	Fri, 20 Oct 2023 15:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 932F170490
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E5C801BF34D
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA5B343388
 for <buildroot@lists.busybox.net>; Fri, 20 Oct 2023 15:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA5B343388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I0scYGxc2S6o for <buildroot@lists.busybox.net>;
 Fri, 20 Oct 2023 15:09:04 +0000 (UTC)
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on071a.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::71a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2171D4014D
 for <buildroot@buildroot.org>; Fri, 20 Oct 2023 15:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2171D4014D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=zAnI0Smt9Vis+gmexjZFbEuF/dg2TPba36KYsDCQCsTy2dybIjmLptiqOXLzzZ00Ayffy2yf0mBZ2nCWvyBEB52ErxeapWHRFTh6RPSfVKs7rkfdM4HkM5h+vRaDuhJTi2FD5SOnN/6RPtTeV4d/Loc+0IQTnr+lOzt+Ya4LXq9lgrmRkTyZJoJmfa/Kuum8GGB/NmPUP4IR+KxUWuT/Hnaeb4xMsPKtjn6+lmfskCmKoEv4xu9jrHzVbXLfx0L0J5LKWf70oKunYUXzqa8Rw5yeTF4u0oFATbHW1Ycc+umbLyOtIcc8Pd1JsSLqSvom0TbfPc2wCM2YIt/AbfzJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqTk8V09voRe7aAa4fowo6jc/dr2B6LiOiBvlHFXayc=;
 b=wBrL+Dd92W9qLVI6PY0z6ZATFQRiTjeM61q9aV0+eezZg0rOI3fbpZxxc0kGda3tRpVhHW+e8YkBbIr6PG/gtuya3xJrY4aDo8dWAdg5zT1rl3G0w3J97DnSuCOEjvHLnRQy9aeiQpaTDj7QoTJDTal124l9dyKt1rXg9hqSEJTTc9mJlsTDd5YAadZGW0ywtyr4ufP9HLYCwHT9v7vt3C2G3yAXTCKcxxdei9g2usgG1FWsSyaYZ12xzehUNLYgbw4ZEfBsQA4ByYnaTimY/tyPuvVdMje9refXNchAbTWW+xC3H36Gg86w+UtRMiXidBkz/p/Fnyv9LoJ6sZVAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1410.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.45; Fri, 20 Oct
 2023 15:09:00 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::cea8:bbb1:c66f:e835%4]) with mapi id 15.20.6838.045; Fri, 20 Oct 2023
 15:09:00 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Andreas Naumann <dev@andin.de>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>, "Arnout Vandecappelle
 (Essensium/Mind)" <arnout@mind.be>
Thread-Topic: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
Thread-Index: AQHaAd1DJypFnfSS5kqbg78thqvvqbBQubSAgAIGVICAAAaSsA==
Date: Fri, 20 Oct 2023 15:09:00 +0000
Message-ID: <PH1P110MB1603F040C26E52D79C4F01719FDBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20231017143424.430007-1-anaumann@ultratronik.de>
 <PH1P110MB1603AE1FC3925D2A2D33EEED9FD6A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <38dd6e9a-7fea-e3fb-21a1-5a381a36c8cf@mind.be>
 <bede2a82-ee1f-4f8a-97f8-c6e2b54b2b84@grenoble.cnrs.fr>
 <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
In-Reply-To: <b2979a64-22b7-4006-9cec-912af8b1cb02@andin.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1410:EE_
x-ms-office365-filtering-correlation-id: 9ff34fc2-09c2-4e8d-3d0a-08dbd17e7d54
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xfSkfsfADNxuZFwXSRhSA+2+Mb+z+MAgj6nPCPoD13j31BmwdEdTxLN7zSi2QNwO13ZEvnGnPkBpx/MM4KQfRc0wMpIjS/Vi3xVaJJCMY+lgmiLb8mikxFno7Vy9iXFhqCS1CDgz7KTRtxxcvwG7cpylfGg54cyynNraDaTVcnA0xOdQlQZJl8HkaI/CLUHkbD5eUjhCNaAWvb/dwIuH+CnmFRho88XDMgdGh4gddxfax1+nIf2nPRwquo8k4PuXOJowv4XfN0Mp7SIe+ikQW7m3Ani2WKI816Yb8zhDI4gXZcTK+Amxs9lnKWgmaiKFHEHY3HDPJuRJjEwSlfJuGExefA+T8fR1LcywWriCzKqMrH+PNoOiXiMGwRfbnmf4P4MV8XLW9ffejqZZvT7UJUIgmMF8mHx38VHDO/KreJLsrWL2n3jbUs0k9vT0Ii9i7EGEIlPNnH5A10HKeXqIQbryzHjhVojnh7tAbfhyR2Oj95zKbxFnqGEvOJ0s0rjMiiiAWgaByewBKE4PIqz7IBTrjjdxgUbV0HT+PR7KK8dXUKD3zhmeGqzC0NgAniKAs1AEfWVm6Jz37o1Vz/GWhGLow15dv460NlSEUQh/YVo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39830400003)(396003)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(66574015)(33656002)(9686003)(86362001)(55016003)(7696005)(38070700009)(53546011)(122000001)(110136005)(66446008)(76116006)(38100700002)(26005)(66556008)(41320700001)(66476007)(83380400001)(4001150100001)(41300700001)(8936002)(71200400001)(64756008)(6506007)(66946007)(966005)(2906002)(508600001)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: ov6249DOnzhBcQyrOpatSge8OLWsPATXP8FzCERdUN0v1KRzsjYkcoHIK0pMbybA0+Em4QYP8tMMx6BKK2XIAgCYW51s+X1yGd0kJDZfXnmB8Q2WsVAin8wwNi0pLZun5V7WDRtNpF19Q1RUW58ib6uy3W6AYdg5dsF3/QpLJnCPs/ZR9z03XHuvFLQPeNgfwb+ulqsxfeKHAtInQO9WAwXZ7WlsyTc7so7WK9lsikGq6JE6X6vcUjRuOLeQ1LGyNoC3Gs3WkxGZ6ZGb8J/a6cd5IWZ4LSSuPVO3859Xx1MInjRj2t+xTNgvgD78Na/MEy/qJEducY5SQ3O7hUxzgZ2YDBjv6We3ETLrAE9vZuX5UhvnJr2s3peqFHcuEtj10thbhIx4giF2/vMH7EHlsM7RpVlqKtbw374LcA529IY=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff34fc2-09c2-4e8d-3d0a-08dbd17e7d54
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 15:09:00.1622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1410
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqTk8V09voRe7aAa4fowo6jc/dr2B6LiOiBvlHFXayc=;
 b=3UUdQh8WHYmLLE5Ea27ENNCP6Y0oDsCHQbk6LeqNrjbZQq496UQ/rdYI9yz2TRX9nlwROCt5YSF1JHMejU1yPiW/jcjhqOPMqyAI6rmrXSJnAqMpZO1t9x2lEQSSXivykBTX2jPGaxfDT4o72jxSqWVY6IMnVdg2zlnjtJ81nk3I3OoN7U2Pr7atBtVjZ6dqiOyRJX2Tc1CAWIhK7RMAEyCha+trOshGfU5YmNpCn/qwQosFqlJg0GInhLkE8UQ9KEN14Klbb1p2kN6ouuTQgf+xvtSio2vq7uqg4RNJXQ6J/9V7OsB7T6+Leg1tNZ3WynuWKP/sNsg1L7/Vjrb+6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=3UUdQh8W
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [External] - [PATCH 0/1] libgpiod v2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmVhcyBOYXVt
YW5uIDxkZXZAYW5kaW4uZGU+DQo+IFNlbnQ6IEZyaWRheSwgT2N0b2JlciAyMCwgMjAyMyA5OjMw
IEFNDQo+IFRvOiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5mcj47IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnOw0KPiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+OyBB
cm5vdXQgVmFuZGVjYXBwZWxsZQ0KPiAoRXNzZW5zaXVtL01pbmQpIDxhcm5vdXRAbWluZC5iZT4N
Cj4gU3ViamVjdDogUmU6IFtCdWlsZHJvb3RdIFtFeHRlcm5hbF0gLSBbUEFUQ0ggMC8xXSBsaWJn
cGlvZCB2Mg0KPiANCj4gSGkgVmluY2VudCwgYWxsLA0KPiANCj4gT24gMTkuMTAuMjMgMDk6MzQs
IEVkZ2FyIEJvbmV0IHdyb3RlOg0KPiA+IEhlbGxvIQ0KPiA+DQo+ID4gT24gMjAyMy0xMC0xOCwg
YWJvdXQgd2hldGhlciB0aGUgQVBJLWJyZWFraW5nIGxpYmdwaW9kIHYyIHNob3VsZCBiZSBhbg0K
PiA+IHVwZ3JhZGUgb3IgYSBuZXcgcGFja2FnZSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6
DQo+ID4+IElmIGl0J3MgbGlrZSAibW9zdGx5IGl0IHdpbGwgc3RpbGwgd29yaywgYnV0IHRoZXJl
IGFyZSBhIGZldw0KPiA+PiBmdW5jdGlvbnMgdGhhdCB5b3UgbmVlZCB0byByZXBsYWNlIHdpdGgg
YSBuZXcgdmFyaWFudCIsIHRoZW4gdGhlDQo+ID4+IHByb3BlciBhcHByb2FjaCBpcyBpbmRlZWQg
dG8gZml4IHRoZSBwYWNrYWdlcyB0aGF0IGZhaWwgdG8gYnVpbGQuDQo+ID4+IFsuLi5dDQo+ID4+
DQo+ID4+IEZvciBiaWdnZXIgQVBJIGNoYW5nZXMgWy4uLl0gd2UgaW5kZWVkIG5lZWQgYSBuZXcg
cGFja2FnZSBsaWJncGlvZDIuDQo+ID4NCj4gPiBJJ3ZlIHdhdGNoZWQgYSB0YWxrIGJ5IEJhcnRv
c3ogR29sYXN6ZXdza2kgYWJvdXQgdGhlIG5ldyBsaWJncGlvZCxbMV0NCj4gPiB0aGVuIHN0YXJ0
ZWQgbG9va2luZyBhdCB0aGUgZG9jdW1lbnRhdGlvbiBvZiB0aGlzIG5ldyBBUEkuWzJdIE15DQo+
ID4gZmVlbGluZyBpcyB0aGF0IHRoaXMgaXMgYSBxdWl0ZSBleHRlbnNpdmUgcmV3cml0ZS4gQSBw
cm9ncmFtIHdhbnRpbmcNCj4gPiB0byBzdXBwb3J0IGJvdGggdGhlIHYxIGFuZCB0aGUgdjIgQVBJ
cyB3b3VsZCBuZWVkIHF1aXRlIGEgYml0IG9mDQo+ID4gY29uZGl0aW9uYWwgY29tcGlsYXRpb24u
DQo+ID4NCj4gDQo+IEkndmUgZ290IHRoZSBzYW1lIGltcHJlc3Npb24gYW5kIHdvdWxkIHZvdGUg
dG8gY3JlYXRlIGxpYmdwaW9kMiBmb3IgdGhlIHNhbWUNCj4gcmVhc29ucyBBcm5vdXQgc3RhdGVk
LiBFdmVuIGlmIGNvbmRpdGlvbmFsIHVzZSBpcyBwb3NzaWJsZSwgaXQncyBub3QgdGhhdA0KPiBz
dHJhaWdodGZvcndhcmQgYW5kIHJlcXVpcmluZyBzb21lYm9keSB0byBpbXBsZW1lbnQgYW5kIHBv
c3NpYmx5DQo+IHVwc3RyZWFtIHRob3NlIGZvciB0aGUgNCBkZXBlbmRlbnQgcGFja2FnZXMgc2Vl
bXMgbGlrZSBjcmVhdGluZyBhIGJhcnJpZXIuDQo+IA0KDQpUaGlzIGlzIGZpbmUsIGJ1dCBpdCB3
b24ndCBiZSBhIHBhaW5sZXNzIHRyYW5zaXRpb24uIFRoZSBkb3duc2lkZSBpcyB0aGF0IGxpYmdw
aW9kMg0KcmVxdWlyZXMgTGludXggNS4xMCssIHNvIG1ha2luZyBpdCBhIHNlcGFyYXRlIHBhY2th
Z2UgZm9yIHRoYXQgcHVycG9zZSBtYWtlcw0Kc2Vuc2UuIEJ1dCBoYXZpbmcgaXQgYmUgYSBzZXBh
cmF0ZSBwYWNrYWdlIGRvZXMgY29tcGxpY2F0ZSBvdGhlciBwYWNrYWdlcw0KdGhhdCBkZXBlbmQg
b24gbGliZ3Bpb2QgYmVjYXVzZSB0aGV5IHdpbGwgbmVlZCB0byBiZSBwYXRjaGVkIHRvIHBsYXkg
bmljZSB3aXRoDQpib3RoIHZlcnNpb25zIGVpdGhlciB3YXkuIEFuZCBpdCB3aWxsIG5vdCBiZSBw
b3NzaWJsZSB0byBzZWxlY3QgbGliZ3Bpb2QyIGFuZA0KdGhvc2Ugb3RoZXIgcGFja2FnZXMgdW50
aWwgdGhleSBoYXZlIGhhZCBwYXRjaGVzIHdyaXR0ZW4uDQoNCj4gSW4gYWRkaXRpb24sIGkgdGhp
bmsgdGhlIGJlaGF2aW91ciBvZiB0aGUgdG9vbHMgaGFzIGNoYW5nZWQgYSBiaXQsIGUuZy4NCj4g
YWZ0ZXIgZ3Bpb3NldCBmaW5pc2hlcyBpdCByZXR1cm5zIHRoZSBHUElPIHRvIHRoZSBvcmlnaW5h
bCBzdGF0ZSAoYXQgbGVhc3QgdGhhdCdzDQo+IHdoYXQgSSByZWNhbGwgZnJvbSB3aGF0IELDtnJn
ZSB0b2xkIG1lIGFib3V0IGl0KS4NCj4gDQo+IFNvIGlmIHBlb3BsZSB1c2UgZ3Bpb2dldC9zZXQg
YW5kIHNvIG9uIGluIHNjcmlwdHMsIHRoZSBiZWhhdmlvdXIgbW9zdCBsaWtlbHkNCj4gY2hhbmdl
cyB1bmV4cGVjdGVkbHkuDQo+IA0KDQpJTU8sIGNvbnN1bWVycyBvZiBCUiBzaG91bGQgYmUgcmV2
aWV3aW5nIHRoZSBjaGFuZ2Vsb2dzIGFuZCBtYWtpbmcgbm90ZSBvZg0KYW55IHZlcnNpb24gYnVt
cHMgdGhhdCBjb3VsZCBpbXBhY3QgdGhlaXIgd29ya2Zsb3dzIGFuZCBkb2luZyB0aGUgdGVzdGlu
ZyB0bw0KbWFrZSBzdXJlIHRoaW5ncyBzdGlsbCB3b3JrIGZvciB0aGVpciBzaXR1YXRpb24uDQoN
CkJSIGNhbid0IGJlIHJlc3BvbnNpYmxlIGZvciB0aGUgZXRlcm5hbCBiYWNrd2FyZHMgY29tcGF0
aWJpbGl0eSBvZiBhbGwgb2YgdGhlIA0KdG9vbHMgaXQgcHJvdmlkZXMuDQoNCj4gQFZpbmNlbnQs
IGRvIHlvdSBoYXZlIHRoZSBpbnRlbnQgb3IgbWF5YmUgZXZlbiBhIHBhdGNoIGZvciBjcmVhdGlu
ZyBhDQo+IHNlcGFyYXRlIHYyIHBhY2thZ2U/IE90aGVyd2lzZSBtZS9Cw7ZyZ2Ugd291bGQgbG9v
ayBpbnRvIGNvbWluZyB1cCB3aXRoDQo+IG9uZS4NCj4gDQoNCkkgd29uJ3QgaGF2ZSB0aW1lIHRv
IGRvIHRoaXMgYW55IHRpbWUgc29vbi4NCg0KPiANCj4gcmVnYXJkcywNCj4gQW5kcmVhcw0KPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gYnVp
bGRyb290IG1haWxpbmcgbGlzdA0KPiA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+ID4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290DQo+ID4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
