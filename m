Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB51C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B35A408A5;
	Wed,  2 Nov 2022 09:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B35A408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJ_kLgKUuiX7; Wed,  2 Nov 2022 09:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A2E640186;
	Wed,  2 Nov 2022 09:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2E640186
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C08D51BF2BA
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 09:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C39781B52
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 09:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C39781B52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyplGxiK-2yz for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 09:50:37 +0000 (UTC)
X-Greylist: delayed 00:06:55 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A6381B25
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net
 [87.98.172.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9A6381B25
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 09:50:36 +0000 (UTC)
Received: from player792.ha.ovh.net (unknown [10.108.1.170])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 0F65321912
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 09:43:39 +0000 (UTC)
Received: from armadeus.com (atoulouse-656-1-53-167.w90-11.abo.wanadoo.fr
 [90.11.232.167])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id 36B4F304ADEC9;
 Wed,  2 Nov 2022 09:43:37 +0000 (UTC)
X-OVh-ClientIp: 90.11.232.167
Message-ID: <0c853ca0-f347-3ad3-5e14-0f58199d2439@armadeus.com>
Date: Wed, 2 Nov 2022 10:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Ovh-Tracer-Id: 4308255994240559989
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfvvefhufgtgfesthekredttdefjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepfeekvefgleffkeevffetgfejkeevieegleelffektdfgveekuedvvddugfffueelnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdhoiihlrggsshdrohhrghdprhgvlhgvrghsvgdqmhhonhhithhorhhinhhgrdhorhhgnecukfhppeduvdejrddtrddtrddupdeltddruddurddvfedvrdduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehiedtpdhmohguvgepshhmthhpohhuth
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-102R00498de3e14-fc2b-4dd9-89e5-c4af8245ed75,
 75395A156758582480B20E87EE78217152216007)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-10-30
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTAvMzEvMjIgMDc6MzQsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gQXV0b2J1aWxkZXIgZmFpbHVyZXMKPiA9PT09PT09PT09PT09PT09PT09
PQo+IAo+IEJlbG93IGlzIGEgbGlzdCBvZiBidWlsZCBmYWlsdXJlcyByZXBvcnRlZCBieSB0aGUg
QnVpbGRyb290IGF1dG9idWlsZGVycwo+IGluIHJlbGF0aW9uIHRvIHBhY2thZ2VzIG9yIENQVSBh
cmNoaXRlY3R1cmVzIHlvdSBhcmUgaW4gY2hhcmdlIG9mLgo+IFBsZWFzZSBoZWxwIHVzIGltcHJv
dmluZyB0aGUgcXVhbGl0eSBvZiBCdWlsZHJvb3QgYnkgaW52ZXN0aWdhdGluZyB0aG9zZQo+IGJ1
aWxkIGZhaWx1cmVzIGFuZCBzZW5kaW5nIHBhdGNoZXMgdG8gZml4IHRoZW0uCj4gCj4gUmVzdWx0
cyBmb3IgdGhlICdtYXN0ZXInIGJyYW5jaAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAKPiBCdWlsZCBmYWlsdXJlcyByZWxhdGVkIHRvIHlvdXIgcGFja2FnZXM6Cj4gCj4gICAg
ICBhcmNoICAgICB8ICAgICAgICAgICAgIHJlYXNvbiAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdXJsCj4gLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICAgbWlw
c2VsICAgIHwgbW1jLXV0aWxzLWQ0MGVjNTM1YjlkNGU0Yzk3Li4uIHwgaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvYjJjNjhmNzMwOGU1MDU0NTFjODMyNjVmZjUzN2ViMDI1
NGJhZDAzNgoKU2hvdWxkIGJlIGZpeGVkIGJ5IHRoaXMgcGF0Y2g6CgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIxMDEzMDg1NzMzLjQ5NzMt
MS1zZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbS8KCj4gCj4gCj4gT3V0ZGF0ZWQgcGFj
a2FnZXMKPiA9PT09PT09PT09PT09PT09PQo+IAo+IFRoaXMgaXMgdGhlIGxpc3Qgb2YgcGFja2Fn
ZXMgZm9yIHdoaWNoIGEgbmV3IHZlcnNpb24gaGFzIGJlZW4gZGV0ZWN0ZWQKPiBhbmQgZm9yIHdo
aWNoIHlvdSBhcmUgYSByZWdpc3RlcmVkIGRldmVsb3Blci4gUGxlYXNlIGhlbHAgdXMgaW1wcm92
aW5nCj4gdGhlIHF1YWxpdHkgb2YgQnVpbGRyb290IGJ5IGJ1bXBpbmcgdGhlc2UgcGFja2FnZXMg
dG8gdGhlaXIgbGF0ZXN0Cj4gdmVyc2lvbi4KPiAKPiAgICAgICAgICAgICAgIG5hbWUgICAgICAg
ICAgICAgIHwgZm91bmQgYnkgfCAgICAgICAgbGluayB0byByZWxlYXNlLW1vbml0b3Jpbmcub3Jn
ICAgICAgICB8ICAgdmVyc2lvbiAgICB8ICAgdXBzdHJlYW0KPiAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLQo+ICAgICAgICAgICAg
cHl0aG9uLWZsYXNrLWpzb25ycGMgfCAgRElTVFJPICB8IGh0dHBzOi8vcmVsZWFzZS1tb25pdG9y
aW5nLm9yZy9wcm9qZWN0LzIxNjk4IHwgMi4yLjEgICAgICAgIHwgMi4yLjIKClVwZGF0ZWQ6Cgpo
dHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvcGFja2FnZT9pZD03Mzg5
MDc5OWVlMTRjYmExYWU2NTBmMTllYzdhNmU0ZmQyZGQ0MDg2CgpSZWdhcmRzLAoKPiAKPiBUaGFu
a3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIHRvIEJ1aWxkcm9vdCEKPiAKCi0tIApTw6liYXN0aWVu
IFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBlbmdpbmVlcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
